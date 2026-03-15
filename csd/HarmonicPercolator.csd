/************************************************* bounds(0, 0, 0, 0)

Harmonic Percolator Waveshaper

Uses widgets

**************************************************/
<Cabbage> bounds(0, 0, 0, 0)
form caption("Harmonic Percolator") size(450,450), pluginId("HPer")

image bounds(0, 0, 450,450) , file("HARMPERC.jpg"), colour("black")
rslider   bounds(38, 322, 100, 100), channel("InputGain"), text("Input Gain"), colour(0, 3, 22, 69), trackerColour(103, 75, 17, 255), textColour(103, 36, 17, 255), range(0, 1, 0.5, 1, 0.001)  outlineColour(108, 30, 14, 255) markerColour(152, 29, 4, 255)
vslider   bounds(114, 42, 25, 120), channel("Harmonics"), text(""), colour(65, 48, 19, 255), trackerColour(106, 79, 44, 255), textColour(17, 11, 4, 255), range(0, 1, 0.5, 1, 0.001)  alpha(0.75)
vslider   bounds(309, 42, 25, 120), channel("Balance"), text(""), colour(65, 48, 19, 255), trackerColour(106, 79, 44, 255), textColour(17, 11, 4, 255), range(0, 1, 0.5, 1, 0.001) value(0.5) alpha(0.75)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./harmperc.dylib -odac -idac
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1 

aSigL            inch          1
                 if nchnls == 2 then
                    aSigR    inch 2
                 endif
                 
;aSigL, aSigR    diskin         "ClassicalGuitar.wav", 1, 0, 1

kInputGain 		chnget			"InputGain"	
kInputGain		portk			kInputGain, 0.005
kInputGain      *=              2

aInputL          =              aSigL*kInputGain
aInputR          =              aSigR*kInputGain 

aInputL         =               aInputL
aInputR         =               aInputR

kGain 		    chnget			"Harmonics"	
kGain			portk			kGain, 0.005

kVol 			chnget		    "Balance"	
kVol			portk			kVol, 0.005
 
aOutL			harmperc		aInputL, kGain, kVol
aOutR			harmperc		aInputR, kGain, kVol

aOutL           dcblock2        aOutL
aOutR           dcblock2        aOutR

                outch			1, tanh(aOutL)
                if nchnls == 2 then
                    outch           2, tanh(aOutR)
                endif

endin

</CsInstruments>
<CsScore>
i 1 0 z
</CsScore>
</CsoundSynthesizer>
