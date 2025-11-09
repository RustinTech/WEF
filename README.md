<div align="center">
  <img src="images/logo.png" alt="WEF" width=23% height=50%>
</div>

<p align="center">
  <h4 align="center">WiFi Exploitation Framework</h4>
  <h6 align="center">Coded with 💙 by D3Ext</h6>
</p>

<p align="center">

  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/license-MIT-_red.svg">
  </a>

  <a href="https://github.com/D3Ext/D3Ext/blob/main/CHANGELOG.md">
    <img src="https://img.shields.io/badge/maintained%3F-yes-brightgreen.svg">
  </a>

  <a href="https://github.com/D3Ext/WEF/issues">
    <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat">
  </a>

</p>

<p align="center">
  <a href="#introduction">Introduction</a> •
  <a href="#supported-attacks">Attacks</a> •
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#Usage">Usage</a>
</p></br>

<p align="center">
  <a href="SPANISH.md">README in spanish</a>
</p>

## Introduction

This tool is designed for security researchers and penetration testers to analyze and exploit vulnerabilities in Wi-Fi networks. It provides an intuitive interface with a wide range of automated and manual attack techniques to test WPA/WPA2, WPS, and WEP security. With support for both 2.4 GHz and 5 GHz networks, detailed logging and customizable attack options, it offers flexibility for different testing scenarios. This is not a professional tool.

If you find an error, please open an issue (you can write it in english or spanish, as you want).

## Supported attacks

- DoS (optional handshake capture):
    - Deauthentication/Disassociation attack
    - WIDS Confusion attack
    - Authentication attack
    - Beacon Flood attack
    - TKIP attack (Michael Shutdown Exploitation)
- WPS:
    - Pixie Dust attack
    - PIN Bruteforce attack
    - Null Pin attack
- WEP:
    - ARP Replay attack
    - HIRTE attack
    - Caffe Latte attack
    - Fake Authentication attack
- Handshake:
    - WPA handshake attack
    - PMKID handshake attack
    - Pwnagotchi mode
- Rogue AP:
    - Evil Twin attack
        - BSSID spoofing
        - Karma mode
        - Enterprise WPA supported
        - Deauth supported
- Other attacks:
    - Automatic attack mode (Auto PWN)
    - WPA3 dictionary attack

All the mentioned attacks/techniques are explained [here](https://github.com/D3Ext/WEF/wiki/Attacks) on the Wiki

## Features

This are some of the most notable features:

:ballot_box_with_check: WPA/WPA2/WPA3, WPS, WEP, Rogue-AP, and Handshake Attacks

:ballot_box_with_check: Automatic attack mode based on the features of the AP

:ballot_box_with_check: Automatic handshake capture

:ballot_box_with_check: Online and offline handshake cracking

:ballot_box_with_check: Simple login template for Evil Twin attack (multiple languages supported)

:ballot_box_with_check: Toggle monitor mode and view information about the network interface (frequencies, chipset, etc.)

:ballot_box_with_check: 2.4 GHz and 5 GHz supported

:ballot_box_with_check: Informative reports using HTML templates

:ballot_box_with_check: Standalone script

:ballot_box_with_check: English and spanish supported

## Installation

> As root
```sh
git clone --depth 1 https://github.com/D3Ext/WEF
cd WEF
bash wef
```

Take a look at the [Wiki](https://github.com/D3Ext/WEF/wiki/Installation) where I have more info about the tool

## Easy Start
> Common usage of the framework (your interface may have other name)
```sh
sudo ./start.sh
```

## Usage

> Common usage of the framework (your interface may have other name)
```sh
wef -i wlan0
```

> Help panel
```
 __      _____ ___
 \ \    / / __| __|
  \ \/\/ /| _|| _|
   \_/\_/ |___|_|

[WEF] WiFi Exploitation Framework 1.6

[*] Interfaces:
    wlan0

Required parameters:
    -i, --interface)    The name of your network adapter interface in managed mode

Optional parameters:
    -h, --help)         Show this help panel
    --version)          Print the version and exit
```

See [here](https://github.com/D3Ext/WEF/wiki/Usage-&-Tips) for more information about how to use the tool and other related topics

## Demo

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/wef-demo.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/wef-demo2.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/wef-demo3.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/wef-demo4.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/wef-demo5.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/help-panel.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/randomize-mac.png">

<img src="https://raw.githubusercontent.com/D3Ext/WEF/main/images/info.png">

## TODO

- Custom Evil Twin templates based on target AP vendor (TP-Link, Netgear, etc)
- Even more languages for Evil Twin templates
- More WPA3 attacks: Downgrade, Dragondrain
- ~~Sort APs by default by power to show which APs are closer~~
- ~~WEF now works as a standalone script~~
- ~~Disassociation is now supported alongside deauthentication~~
- ~~Vendors are no longer parsed from a local file~~
- ~~APs scanning has been improved, now APs with clients are marked in green colour~~
- ~~Evil Twin now supports PMKID handshake to check captured passwords~~
- ~~MAC randomization/spoofing improved~~
- ~~Filters for WPS and WPA3 when scanning APs~~
- ~~Most attacks were reworked and/or improved, new options are available~~
- ~~Graphical session and windows were reworked~~
- ~~Non-Graphical usage has been improved~~
- ~~Automatic dependencies installation on main distros~~
- ~~Deep testing on supported distros (Manjaro, Fedora, Parrot, Debian, etc)~~
- ~~Requirements were updated. Some more were added although the should be installed on most distros~~
- ~~WPA3 attack optimized~~
- ~~Now certificate files needed for Enterprise Evil Twin are generated automatically~~
- ~~More languages supported on Evil Twin templates (czech, danish and romanian)~~
- ~~Now wordlists are not needed anymore as dependencies~~
- ~~Better error handling for most scenarios~~
- ~~Multiple bug fixes~~

## Changelog

See [CHANGELOG.md](https://github.com/D3Ext/WEF/blob/main/CHANGELOG.md)

## References

```
https://github.com/aircrack-ng/aircrack-ng
https://github.com/aircrack-ng/mdk4
https://github.com/v1s1t0r1sh3r3/airgeddon
https://github.com/FluxionNetwork/fluxion
https://github.com/P0cL4bs/wifipumpkin3
https://github.com/s0lst1c3/eaphammer
https://github.com/derv82/wifite2
https://github.com/wifiphisher/wifiphisher
https://github.com/ZerBea/hcxtools
https://github.com/ZerBea/hcxdumptool
https://github.com/Tylous/SniffAir
https://github.com/blunderbuss-wctf/wacker
https://github.com/evilsocket/pwnagotchi
https://github.com/koutto/pi-pwnbox-rogueap
https://github.com/koutto/pi-pwnbox-rogueap/wiki/01.-WiFi-Basics
```

## Disclaimer

The creator has no responsibility for any kind of illegal use of the project.

## License

This project is under MIT license

Copyright © 2025, *D3Ext*



