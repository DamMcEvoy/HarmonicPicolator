/************************************************* bounds(0, 0, 0, 0)

Harmonic Percolator Waveshaper

Uses widgets

**************************************************/
<Cabbage> bounds(0, 0, 0, 0)
form caption("Harmonic Percolator") size(450,450), pluginid("Hrmnc Prcltr")

image bounds(0, 0, 450,450) , file("HARMPERC.jpg")

vslider   bounds(114, 42, 25, 120), channel("Harmonics"), text(""), colour(65, 48, 19, 255), trackercolour(106, 79, 44, 255), textcolour(17, 11, 4, 255), range(0, 1, 0.5, 1, 0.001) value(0.5) alpha(0.75)
vslider   bounds(309, 42, 25, 120), channel("Balance"), text(""), colour(65, 48, 19, 255), trackercolour(106, 79, 44, 255), textcolour(17, 11, 4, 255), range(0, 1, 0.5, 1, 0.001) value(0.5) alpha(0.75)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./harmperc.dylib -odac -idac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

instr 1 

;aSig            in
aSigL, aSigR    diskin         "ClassicalGuitar.wav", 1, 0, 1

aInput          =               (aSigL + aSigR)

aInput          =               tanh(aInput)

kGain 		    chnget			"Harmonics"	
kGain			portk			kGain, 0.005

kVol 			chnget		    "Balance"	
kVol			portk			kVol, 0.005
 
aOut			harmperc		aInput, kGain, kVol

				outs			aOut, aOut

endin

</CsInstruments>
<CsScore>
i 1 0 z
</CsScore>
</CsoundSynthesizer>
