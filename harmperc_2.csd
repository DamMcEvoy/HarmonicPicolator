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

kGain 		    invalue			"Harmonics"	
kGain			portk			kGain, 0.005

kVol 			invalue		    "Balance"	
kVol			portk			kVol, 0.005
 
aOut			harmperc		aInput, kGain, kVol

				outs			aOut, aOut
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
 <bgcolor mode="background">
  <r>108</r>
  <g>107</g>
  <b>108</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Harmonics</objectName>
  <x>115</x>
  <y>213</y>
  <width>56</width>
  <height>164</height>
  <uuid>{57dfeb16-5abe-4018-84f0-2c7b46561b91}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>0.99900000</maximum>
  <value>0.76752439</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Balance</objectName>
  <x>214</x>
  <y>211</y>
  <width>56</width>
  <height>166</height>
  <uuid>{a42544bc-cc7f-46b2-a3c8-85ff3fa42970}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>0.99900000</maximum>
  <value>0.34303012</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Harmonics</objectName>
  <x>115</x>
  <y>374</y>
  <width>56</width>
  <height>26</height>
  <uuid>{11f121d3-f28a-45bd-b32d-d98a0b6f088b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.768</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Balance</objectName>
  <x>214</x>
  <y>375</y>
  <width>56</width>
  <height>27</height>
  <uuid>{dda53a2e-c9cc-445f-91d3-84003d497d81}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.343</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>103</x>
  <y>190</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8c7a8c57-e9b6-45e1-a490-874b8efcb62e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Harmonics</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>202</x>
  <y>188</y>
  <width>80</width>
  <height>25</height>
  <uuid>{18782eb1-b62a-4c68-b055-01f433d13438}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Balance</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
