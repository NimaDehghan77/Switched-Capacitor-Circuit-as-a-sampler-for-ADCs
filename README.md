# Switched-Capacitor-Circuit-as-a-sampler-for-ADCs

The following switched-capacitor circuit is designed as a sampler for ADCs. There is an opAmp in this structure with a voltage gain of 80 decibels,which can be modeled by using a voltage-controlled current source element in HSpice software.
during simulation must be satisfied below conditions:
1-SNDR > 60 dB
2-SFDR > 65 dB
3-Technology: 90 nm CMOS
4-Input signal: Sine with 0.5 amplitude differential and 0.5 V common mode level
5-Power supply voltage: 1 volt
________________
![2022-10-24_17-02-00](https://user-images.githubusercontent.com/115939486/197539045-381171ba-4272-4de9-84f5-28dd6f006703.jpg)
_____
Output results:
____
![2022-10-24_17-15-09](https://user-images.githubusercontent.com/115939486/197540724-ea0430a6-6edd-471a-aad4-f124a307c8a7.jpg)
_____
