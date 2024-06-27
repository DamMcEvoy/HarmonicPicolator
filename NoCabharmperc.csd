<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./harmperc.dylib -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1 

;aSig 			diskin2			"loop.wav", 1, 0, 1

aSig 		diskin2			"Double Note Guitar.wav", 1, 0, 1

kGain 	=				1

kVol 		=				1
 
aOut			harmperc		aSig, kGain, kVol

aOut   dcblock2 aOut

  				outs				aOut, aOut

endin

</CsInstruments>
<CsScore>
i 1 0 z
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
