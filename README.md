<h1><a id="phison2307BadUSB_0"></a>phison-2307-BadUSB</h1>
<p>PS2251-07(PS2307) based BadUSB firmware</p>
<p>Build DriveCom after applying the patch with VS2012 – Done<br>
Extract “BN07V502TAW.BIN” from “firmware_ps225107.rar” – Done<br>
Open “BN07V502TAW.BIN” with hex editor and change the values of offset 0x4D85, 0x4D86 to 00 – Yet to be done<br>
Rest are completed based on <a href="https://vivibit.net/psychson2307final-en/">https://vivibit.net/psychson2307final-en/</a></p>
<h1><a id="Flashing_firmware_with_DriveComexe_8"></a>Flashing firmware with DriveCom.exe</h1>
<p>DriveCom.exe /drive=E /action=SendFirmware /burner=BN07V502TAW.BIN /firmware=fw.bin</p>

