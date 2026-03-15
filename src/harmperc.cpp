/*
********HARMONIC PERCOLATOR********
**********CSOUND OPCODE************
Damien McEvoy 2018.

The opcode includes a low pass filter 
based on CPOF 'Tone Opcode' example 
from the article:
'Supporting an Object-Oriented 
Approach to Unit Generator 
Development: The Csound Plugin 
Opcode Framework', by
V. Lazzarini, 2017
*/
#include "plugin.h"
#include "modload.h"
#include "harmperc.h"//external file containing function table array.

struct HarmPerc:csnd::Plugin<1,3>{
/*
Declare variables for update function
*/
	MYFLT c1; 
	MYFLT c2;
	MYFLT yt1;
	MYFLT prvhp;
/*
define update function for low pass filter
*/
	void update(){
		MYFLT sr = csound->sr();
		prvhp = 1500;
		MYFLT b = 2.0 - cos(csnd::twopi*prvhp/sr);
		c2 = b - sqrt(pow(b, 2)-1.0);
		c1 = 1 + c2;
	}
/*
This is the initialisation pass of the opcode.
Calls the update function and external function table 
and initialises yt1 to 0.
*/
	int init(){
		update();
		yt1 = 0.;
		extern double distArray[4096];
		return OK;
	}
/*
Below is the perf-time pass of the opcode.
This is an audio-rate performance opcode.
*/
	int aperf(){

		csnd::AudioSig in(this, inargs(0));
		csnd::AudioSig out(this, outargs(0));
		MYFLT y = yt1;
		/*
		Low Pass Filter - CPOF version
		*/	
		if (prvhp != 1500) update();
			std::transform(in.begin(), in.end(), out.begin(),
			[this, &y](MYFLT x){
			return (y = c1 * x + c2 * y);
			});
			yt1 = y;
		/*
		Harmonic Percolator distortion
		*/
		for (int i = 0; i < nsmps; i++){
			outargs(0)[i] *= 0.15;
			MYFLT currentSample = tanh(outargs(0)[i]);
			/*
			using current sample magnitude as index to read throught
			the function table
			*/
			int distIndex = (currentSample * inargs[1]) * 2048 + 2047;
			MYFLT frac = distIndex - (int)distIndex;
			/*
			linear interpolation
			*/
			MYFLT distortionValue = (distArray[distIndex]+frac*(distArray[distIndex+1]-distArray[distIndex]));
			/*
			limit distortion magnitudes using parabolic tanh function.
			Assign distortion value scaled by volume argument to 
			output. 
			*/
			outargs(0)[i] = tanh(distortionValue) * inargs[2];
		}
		return OK;
	}
};
/*
Regsiter opcode with Csound.
*/
void csnd::on_load(Csound *csound){
csnd::plugin<HarmPerc>(csound, "harmperc", "a", "akk", csnd::thread::ia);
}
//compile; c++ -dynamiclib -std=c++11 -o harmperc.dylib harmperc.cpp -I /Library/Frameworks/CsoundLib64.framework/Headers
