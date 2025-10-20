[![JetBrains Research](https://jb.gg/badges/research.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

JBR Genome Browser
==================

**JBR Genome Browser**  is a fast, scalable, and versatile genome browser that integrates built-in peak calling through [Omnipeak](https://github.com/JetBrains-Research/omnipeak)*.<br>

It provides all the essential features of a classical genome browser while adding powerful tools for integrated peak annotation and [semi-supervised](http://artyomovlab.wustl.edu/aging/tools.html) peak calling. 
Researchers can upload ChIP-seq data tracks and perform on-the-fly peak calling with immediate visualization of results in the same session.<br>

Beyond its peak calling capabilities, JBR Genome Browser serves as a next-generation genome visualization platform, 
offering efficient handling of large datasets, simultaneous multi-location viewing, and detailed track statistics.


**Open Access Paper:** https://doi.org/10.1093/bioinformatics/btab376

**Citation:** Shpynov O, Dievskii A, Chernyatchik R, Tsurinov P, Artyomov MN. Semi-supervised peak calling with SPAN and JBR Genome Browser. Bioinformatics. 2021 May 21.

Features
--------
* **Comprehensive genome browser functionality** for visualizing multiple genome data formats
* **Supported file types:**
* * BED (including MACS2, SICER peaks), BigWig, Wig, BigBed, TDF
* * BAM/SAM/CRAM (including Bisulfite-Sequencing visualization)
* * GTF files
* **Session formats:** JBR (.yaml), IGV (.xml), UCSC (.txt)
* **Remote file access:** BigWig, BigBed, and BED files via URL
* **Flexible visualization:**
* * Multiple panels and group-scale mode
* * Simultaneous viewing of multiple genomic locations
* * Detailed hover statistics and track information
* **Integrated tools:**
* * Peak annotation and on-the-fly semi-supervised peak calling
* * Enhanced Omnipeak model visualization
* * BED overlap and Jaccard analysis
* **Performance and usability:**
* * Big fonts support for presentation mode
* * Optimized for large sessions
* * High DPI display support
* * Headless screenshot generation (PNG/SVG) from the command line
* * Genome configuration editor
* **Data access and integration:**
* * Load tracks directly from the ENCODE portal
* * Supported genomes include Mouse (mm39), Human (hs1, hs37-1kg, hs37d5)
* * Peak calling from BAM or BigWig directly in the GUI
* **Deployment:**
* * Easily deployable server via a public Docker image

Downloads
---------
See [releases](https://github.com/JetBrains-Research/jbr/releases) section for actual information.

See changelog for the latest version [here](https://raw.githubusercontent.com/JetBrains-Research/jbr/master/CHANGES.txt).

Installation
------------
Download a suitable build for your OS from the Downloads section.

* **Linux**<br>
  Unpack the browser `jbr-XXX.tar.gz` file using the following command:<br>
  `tar -xzf jbr-XXX.tar.gz`<br>
  Launch `jbr.sh` from the `bin` subfolder.

* **Windows**<br>
  Unpack the browser `jbr-XXX.zip` file.<br>
  Launch `jbr.exe`.

* **MacOS**<br>
  * For M1+ Mac computers:<br>
  Download the `jbr-XXX.dmg` macOS Disk Image file<br>
  Mount it as another disk in your system<br>
  Copy JBR Genome Browser to your Applications folder<br>
  If you want to open multiple JBR instances, launch instance with the command:<br>
  `open -n "/Applications/JBR.app"`<br>
  
  * For Intel-based Mac computers:<br>
  Download the `jbr-XXX.jar` Java archive file, ensure that you have Java 21+ installed.<br>
  Launch JBR Genome Browser with the command:<br>
  `java --add-modules=jdk.incubator.vector -Xmx8G -jar jbr-XXX.jar"`


Web server mode
---------------
**JBR Genome Browser** can be launched as a **local web server**, providing a convenient way to share results with collaborators.<br>
This mode is especially useful when working with private datasets that cannot be exported to public genome browsers like UCSC. 
When deployed locally, the browser remains accessible only within the local network, ensuring data privacy and security.<br>
An example of the web server mode in action can be found at:
👉 [https://artyomovlab.wustl.edu/jbr/](https://artyomovlab.wustl.edu/jbr/).

Build Docker image or use uploaded to docker.io.
```
   docker build . -t biolabs/jbr --platform linux/amd64  
```

The user creates a number of preconfigured JRB sessions, place them in a separate `<sessions_folder>` on the local
machine, and easily set up a server using publicly available Docker image `biolabs/jbr` with the command:

```
  docker run --platform linux/amd64 --publish=5000:5000 --volume=<sessions_folder>:/jbr_sessions --volume=<logs_folder>:/jbr_logs  -d -t biolabs/jbr
```

Documentation
-------------

* Documentation is available in the JBR [Wiki](https://github.com/JetBrains-Research/jbr/wiki) on GitHub.
* Semi-supervised peak calling tutorial is available [here](https://artyomovlab.wustl.edu/aging/howto.html).

Errors Reporting
-----------------

Use this [Issues Tracker](https://github.com/JetBrains-Research/jbr/issues) to suggest new features or report bugs.

Authors
-------
JetBrains Research BioLabs [homepage](https://research.jetbrains.org/groups/biolabs)

Other
-----
\* Previously [SPAN](https://github.com/JetBrains-Research/span)
