-----------------------------------|
********HARMONIC PERCOLATOR********|
**********CSOUND OPCODE************|
-----------------------------------|

DAMIEN MCEVOY,
13716211

SUBMITTED AS PART OF FINAL 
PROJECT FOR MU620A,
2018

OPCODE FOR USE WITH CSOUND
WRITTEN USING C++ AND 
CSOUND PLUGIN OPCODE 
FRAMEWORK
------------------------------------|
This opcode models the Harmonic 
Percolator distortion Pedal.
This is a unipolar, non-linear
waveshaper.
The function table for the distortion 
algorithm was generated from analysis
of a Harmonic Percolator clone.
The values are found the file 
'harmperc.h'.
Linear interpolation is used.

The opcode includes a low pass filter 
at input stage, set at 1500Hz and 
based on CPOF 'Tone Opcode' example 
from the article:
'Supporting an Object-Oriented 
Approach to Unit Generator 
Development: The Csound Plugin 
Opcode Framework', by
V. Lazzarini, 2017
------------------------------------|
OPERATING INSTRUCTIONS:

The Harmonic Percolator opcode is not
compiled with Csound. Therefore the 
option:
--opcode-lib=./harmperc.dylib -odac
needs to be called in the Csound set
up options at the top of the Csound
file. As follows:

<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./harmperc.dylib -odac
</CsOptions>
<CsInstruments>

The Harmonic Percolator opcode is
instantiated by calling 'harmperc'.
It has one mono, a-rate output 
argument.
It takes one mono, a-rate
and two k-rate input arguments. 
The inputs are: 
1. audio signal
2. distortion amount
3. output volume
-----------------------------------|
*NB*
This opcode requires some form of 
DC blocking for audio output
------------------------------------|
Damien McEvoy 2018.
