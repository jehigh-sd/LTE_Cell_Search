# LTE Cell Search
This system will perform cell search, establishes timing, frequency synchronization and displays cell ID.
<div id="top"></div>




<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/jehigh-sd/LTE_Cell_Search">
    <img src="Images/BD.png" alt="Logo" width="660" height="360">
  </a>

  <h3 align="center">System Block Diagram of LTE Cell Search</h3>

  <p align="center">
    LTE Cell Search algorithm implementation on Xilinx RF SoC.
    <br />
    <a href="https://github.com/jehigh-sd/LTE_Cell_Search"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/jehigh-sd/LTE_Cell_Search">View Demo</a>
    ·
    <a href="https://github.com/jehigh-sd/LTE_Cell_Search/issues">Report Bug</a>
  </p>
</div>



# Table of Contents
<details open>
<summary><b>(click to expand or hide)</b></summary>
<!-- MarkdownTOC -->

1. [About The Project](#about-the-project)
1. [Getting Started](#getting-started)
	1. [RF SoC Details](#rf-soc-details)
	1. [Prerequisites](#prerequisites)
	1. [Installation](#installation)
1. [Documentation](#documentation)
	1. [Synchronization Signals (PSS and SSS)](#Synchronization_Signals)
	1. [MIB Decode Steps](#MIB_Decode_Steps)
1. [Simulation](#Simulation)
1. [Hardware](#Hardware)
	1. [RF SoC](#RF_SoC)
	1. [RF SoC LMX Configuration](#lmx)
	1. [Low Noise Amplifier](#LNA)
	1. [Band Pass Filter](#BPF)
	1. [Antenna](#Antenna)
1. [IP Blocks](#IP_Blocks)
	1. [Hardware Description](#Hardware_Description)
	1. [LTE Cell Search](#LTE_Cell_Search)
	1. [Simulink Model](#Simulink_model)	
1. [Test Bench](#Test_Bench)
1. [Host software](#Host_Software)
1. [Demo](#demo)
1. [Contributing](#contributing)
1. [Contact](#contact)
1. [Acknowledgments](#acknowledgments)
1. [References](#references)

<!-- /MarkdownTOC -->
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

In this project we will design and develop software for LTE cell search where the LTE signals will be captured with SDR Radio hardware such as Xilinx Zynq-Based Radio RFSOC 2x2.

This system will perform cell search, establishes timing and frequency synchronization and optionally decodes MIB.

Main idea of final project is to establish synchronization with live LTE cells and extract cell ID information, frequency offset, frequency of transmission, received power.

LTE signal will be captured with SDR Radio hardware such as Xilinx Zynq-Based Radio (RF SoC) and this waveform will be decoded to recover basic system information. In LTE the master information block (MIB) is carried within the broadcast channel (BCH). The MIB provides basic cell-wide settings including the system bandwidth and frame number.

The BCH is transmitted in the middle six resource blocks (RBs) of an LTE transmission, therefore a capture bandwidth of only 1.92 MHz is required to decode the MIB, regardless of the cell bandwidth. Only subframe #0 of a frame is required to decode the MIB

![image](https://user-images.githubusercontent.com/77175120/168498051-bc56e4c7-d1d9-4f33-aa92-8c22ba1d3a62.png)


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To get start with your RF Soc visit below page for instructions:

[Getting started on RF SoC ](https://www.rfsoc-pynq.io/getting_started.html)

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```
  
<!-- RFSOC-DETAILS -->
### RF SoC Details

This section shows RF SoC Image, schematic and details.

* [Image](http://www.pynq.io/board.html)
* [Schematics](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)
* [User Manual](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)
* [Accessories](https://www.rfsoc-pynq.io/accessories.html)

<p align="right">(<a href="#top">back to top</a>)</p>

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   https://github.com/jehigh-sd/LTE_Cell_Search.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- DOCUMENTATION -->
## Documentation

* [Synchronization Signals (PSS and SSS)](http://www.pynq.io/board.html)
* [MIB_Decode_Steps](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Synchronization Signals -->
<a id="Synchronization_Signals"></a>
# Synchronization Signals (PSS and SSS)


In LTE, there are two downlink synchronization signals which are used by the UE to obtain the cell identity and frame timing.

  * Primary synchronization signal (PSS)

  * Secondary synchronization signal (SSS)

The division into two signals is aimed to reduce the complexity of the cell search process.

**Cell Identity Arrangement**

 The physical cell identity, NcellID, is defined by the equation:

 NCELLID=3N(1)ID+N(2)ID

  * N(1)ID is the physical layer cell identity group (0 to 167).
  * N(2)ID is the identity within the group (0 to 2).

  This arrangement creates 504 unique physical cell identities

**Synchronization Signals and Determining Cell Identity**

 The primary synchronization signal (PSS) is linked to the cell identity within the group (N(2)ID). The secondary synchronization signal (SSS) is linked to the cell identity group (N(1)ID) and the cell identity within the group (N(2)ID).

 You can obtain N(2)ID by successfully demodulating the PSS. The SSS can then be demodulated and combined with knowledge of N(2)ID to obtain N(1)ID. Once you establish the values of N(1)ID and N(2)ID, you can determine the cell identity (NcellID).

**Primary Synchronization Signal (PSS)**

  The primary synchronization signal (PSS) is based on a frequency-domain Zadoff-Chu sequence.

 * Zadoff-Chu Sequences

  Zadoff-Chu sequences are a construction of Frank-Zadoff sequences defined by D. C. Chu. These codes have the useful property of having zero cyclic autocorrelation at all nonzero lags. When used as a synchronization code, the correlation between the ideal sequence and a received sequence is greatest when the lag is zero. When there is any lag between the two sequences, the correlation is zero. This property is illustrated in this figure.
  
  ![image](https://user-images.githubusercontent.com/77175120/168496835-99a35c7a-5d69-4238-94dc-a2d6246cbbfb.png)
  ![image](https://user-images.githubusercontent.com/77175120/168496949-d12a2782-7ba4-4c5f-95c6-ce3f87ba5c62.png)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MIB Decode Steps -->
<a id="MIB_Decode_Steps"></a>
## MIB Decode Steps:

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- SIMULATION -->
<a id="Simulation"></a>
## Simulation:


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- HARDWARE -->
<a id="Hardware"></a>
## Hardware:

<!-- RF SoC -->
<a id="RF_SoC"></a>
### RF SoC:

Xilinx’s Radio Frequency System-on-Chip (RFSoC) device combine high-accuracy ADCs and DACs operating at Giga samples per second (Gsps), with programmable heterogeneous compute engines. RFSoC 2x2 board with 2 RF DAC and 2 RF ADC channels. The RFSoC 2x2 has a Zynq Ultrascale+ XCZU28DR-FFVG1517AAZ with an Quad-core ARM Cortex A53 Processing System (PS) and Xilinx Ultrascale+ Programmable Logic (PL). There are BALUNs between the SMA connectors and the Zynq RFSoC on the board, which means that antenna and external signal sources can be connected directly to the board.

**RFSoC Board:**

![image](https://user-images.githubusercontent.com/77175120/168524070-e34712db-e864-4dd9-b182-6a35b00d5852.png)

**RFSoC Block Diagram:**

![image](https://user-images.githubusercontent.com/77175120/168524116-8beba6e0-f300-4990-b298-17b5d1e52188.png)


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- RF SoC LMX Configuration -->
<a id="lmx"></a>
### RF SoC LMX Configuration:

* [LMX2596 Configuration files](https://github.com/jehigh-sd/LTE_Cell_Search/tree/main/Hardware/LMX_Settings)

* Configured ADC Clock for LTE OTA RF input
* RFSoC Range = 1024 MHz to 4096 MHz
    * Max decimation supported RF data converter (x8)
* Live Signal Target = 30.72 MHz
* ADC Sample Rate = 1.96608 GHz
* Need of IP Block: Decimate 245.76 MHz to 30.72 MHz


**LMX Configuration to configure to 245.76MHz**
![image](https://user-images.githubusercontent.com/77175120/168522940-0c458bac-967c-44a3-8043-116fa8b4533c.png)

**245.76MHz Tone measured in the Spectrum Analyzer after configuring LMX 2596**
![image](https://user-images.githubusercontent.com/77175120/168523024-419aa3f3-1ba4-4538-be6c-b5d92e9d7672.png)



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LNA -->
<a id="LNA"></a>
### Low Noise Amplifier:

* Used Vega Barebones - Ultra Low-Noise Variable Gain Amplifier (VGA) Module for RF & Software Defined Radio (SDR) from Nooelec.
* Highly Linear & Wideband 30MHz-4000MHz Frequency Capability w/Bias Tee & USB Power Options.
* Characterized Nooelec LNA for its Gain modes and return loss performance using KeySight E5071C vector network Analyzer
* Measured Gain (S21) for different Analog gain modes.
* Conclusion: ~40 dB of gain around ~1GHz and ~34 dB of gain around ~2GHz
* Return loss (S11) performance is reasonable in the entire bandwidth

Gain across frequency with 5 Gain modes
![image](https://user-images.githubusercontent.com/77175120/168521348-b243b478-aff8-4194-b9dc-a5173fda35cb.png)

Gain (S21) and Return Loss (S11) performing at Max Gain mode

![image](https://user-images.githubusercontent.com/77175120/168521435-544ce17e-8b10-4732-b39c-dec93d782e19.png)

Image of nooelec LNA:

![image](https://user-images.githubusercontent.com/77175120/168521577-a6aacffe-198c-483e-a1d5-c59fa8132f9a.png)

![image](https://user-images.githubusercontent.com/77175120/168521692-72d2b6f1-8484-420d-ad5d-51efcae6ebc0.png)

![image](https://user-images.githubusercontent.com/77175120/168521749-ad4f0d0c-f598-40bd-b067-a1a6232aa335.png)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- BPF -->
<a id="BPF"></a>
### Band Pass Filter:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ANTENNA -->
<a id="Antenna"></a>
### Antenna:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- IP BLOCKS -->
<a id="IP_Blocks"></a>
## IP Blocks:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- HARDWARE DESCRIPTION -->
<a id="Hardware_Description"></a>
### Hardware Description:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LTE CELL SEARCH -->
<a id="LTE_Cell_Search"></a>
### LTE Cell Search:




<p align="right">(<a href="#top">back to top</a>)</p>

<!-- SIMULINK MODEL -->
<a id="Simulink_model"></a>
### Simulink Model:





<p align="right">(<a href="#top">back to top</a>)</p>

<!-- TEST BENCH -->
<a id="Test_Bench"></a>
## Test Bench:

* Need PYNQ board,Pluto SDR and RTL digitizer to build this test bench.
* Install Matlab Pluto SDR driver from below link:
	[Pluto SDR driver](https://www.mathworks.com/help/supportpkg/plutoradio/ug/install-support-package-for-pluto-radio.html)
* To create test bench for this project, used LTE Cell scanner open-source software from GitHub and compiled on the PYNQ board.
	[LTE Cell Scanner](https://github.com/Evrytania/LTE-Cell-Scanner)
* Verified test bench with NAR bands – 900MHz, able to detect different MIB’s from different Cells
* Picked non-NAR region band – 860MHz to generate LTE Test signal
* Used Matlab "Wireless waveform Generator" application and Generated LTE Test signal using Matlab– 5MHz, 25 RB, 64QAM, Cell ID: 11 with PSS, SSS, PBCH.
* Exported this signal to MatLab to play from Pluto SDR
* Play LTE test signal continuously from Pluto SDR and run cell search algorithm in PYNQ to capture the transmitted LTE test signal.

**"Wireless waveform Generator" application in Matlab**
![image](https://user-images.githubusercontent.com/77175120/168521307-bde56b3c-8cd0-4a36-a6ca-82908db87317.png)

**Block diagram of Test Bench**
![image](https://user-images.githubusercontent.com/77175120/168525137-b0576fe0-edb7-48d5-be1a-041e3c41d492.png)

**LTE Cell Search Result from PYNQ Board**
![image](https://user-images.githubusercontent.com/77175120/168525256-2f4d184c-fb22-4da8-9ad1-91684b45fcd7.png)


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- HOST SOFTWARE -->
<a id="Host_Software"></a>
## Host software:





<p align="right">(<a href="#top">back to top</a>)</p>

<!-- DEMO -->
<a id="demo"></a>
## Demo:



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
<a id="contributing"></a>
## Contributing:

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

We would like acknowledge

* [Vitis HLS Guide](https://pp4fpgas.readthedocs.io/en/latest/)
* [Kastner Research Group] https://kastner.ucsd.edu/

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- REFERENCES -->
## References

* [1]https://www.rfsoc-pynq.io/overlays.html
* [2]https://www.rfsoc-pynq.io/base_overlay.html
* [3]git clone https://github.com/Xilinx/RFSoC2x2-PYNQ.git
* [4]https://github.com/strath-sdr/rfsoc_sam
* [5]https://github.com/strath-sdr/rfsoc_ofdm
* [6]https://www.mathworks.com/help/wireless-hdl/ug/lte-hdl-cell-search.html 
* [7]https://www.mathworks.com/help/lte/ug/synchronization-signals-pss-and-sss.html
* [8]ML Estimation of Time and Frequency Offset in OFDM Systems (IEEE paper)
* [9]https://www.mathworks.com/help/lte/ug/cell-search-mib-and-sib1-recovery.html
* [10]https://www.sharetechnote.com/html/FrameStructure_DL.html#Overview

<p align="right">(<a href="#top">back to top</a>)</p>
