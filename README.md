# Switched-Capacitor-Circuit-as-a-sampler-for-ADCs

The following switched-capacitor circuit is designed as a sampler for ADCs. There is an opAmp in this structure with a voltage gain of 80 decibels,which can be modeled by using a voltage-controlled current source element in HSpice software.
during simulation must be satisfied below conditions:
__
1-SNDR > 60 dB
__
2-SFDR > 65 dB
___
3-Technology: 90 nm CMOS
___
4-Input signal: Sine with 0.5 amplitude differential and 0.5 V common mode level
___
5-Power supply voltage: 1 volt
________________
![2022-10-24_17-02-00](https://user-images.githubusercontent.com/115939486/197539045-381171ba-4272-4de9-84f5-28dd6f006703.jpg)
_____
Output results:
____
![2022-10-24_17-15-09](https://user-images.githubusercontent.com/115939486/197540724-ea0430a6-6edd-471a-aad4-f124a307c8a7.jpg)
_____
Select suitable switch and Design that
___
![2022-10-24_17-18-05](https://user-images.githubusercontent.com/115939486/197542363-a26fc6ef-92fe-46e5-beac-f37817475e61.jpg)
____
![2022-10-24_17-18-32](https://user-images.githubusercontent.com/115939486/197542434-074a4f8a-9635-482d-a7c5-069ab14ecaba.jpg)
_____
Dimensions of switch transistors:
____
