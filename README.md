# LTE Cell Search
This system will perform cell search, establishes timing, frequency synchronization and displays cell ID.
<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



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



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#rfsoc-details">RF Soc Details</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#documentation">Documentation</a></li>
      <ul>
        <li><a href="#Synchronization_Signals">Synchronization Signals (PSS and SSS)</a></li>
        <li><a href="#MIB_Decode_Steps">MIB Decode Steps</a></li>
      </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">Demo</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    <li><a href="#references">References</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

In this project we will design and develop software for LTE cell search where the LTE signals will be captured with SDR Radio hardware such as Xilinx Zynq-Based Radio RFSOC 2x2.

This system will perform cell search, establishes timing and frequency synchronization and optionally decodes MIB.

Main idea of final project is to establish synchronization with live LTE cells and extract cell ID information, frequency offset, frequency of transmission, received power.

LTE signal will be captured with SDR Radio hardware such as Xilinx Zynq-Based Radio (RF SoC) and this waveform will be decoded to recover basic system information. In LTE the master information block (MIB) is carried within the broadcast channel (BCH). The MIB provides basic cell-wide settings including the system bandwidth and frame number.

The BCH is transmitted in the middle six resource blocks (RBs) of an LTE transmission, therefore a capture bandwidth of only 1.92 MHz is required to decode the MIB, regardless of the cell bandwidth. Only subframe #0 of a frame is required to decode the MIB


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- RFSOC-DETAILS -->
### RF Soc Details

This section shows RF SoC Image, schematic and details.

* [Image](http://www.pynq.io/board.html)
* [Schematics](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)
* [User Manual](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)
* [Accessories](https://www.rfsoc-pynq.io/accessories.html)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- DOCUMENTATION -->
## Documentation

* [Synchronization Signals (PSS and SSS)](http://www.pynq.io/board.html)
* [MIB_Decode_Steps](https://www.rfsoc-pynq.io/pdf/HTG-ZRF2-XUP_REV_11_Schematic_20Jan21.pdf)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Synchronization Signals -->
## Synchronization Signals (PSS and SSS)

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
## MIB Decode Steps

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [x] Add Changelog
- [x] Add back to top links
- [ ] Add Additional Templates w/ Examples
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support
    - [ ] Chinese
    - [ ] Spanish

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)

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
