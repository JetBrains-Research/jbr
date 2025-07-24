[![JetBrains Research](https://jb.gg/badges/research.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

JBR Genome Browser
==================

**JBR Genome Browser** is a fast and scalable general purpose genome browser with support of a
 [semi-supervised approach](http://artyomovlab.wustl.edu/aging/tools.html) to peak calling.

It supports classic genome browser functionality and provide readily accessible integrated peak annotation and peak
calling capabilities. JBR Genome Browser allows researchers to upload tracks of Chip-seq data and perform on-the-fly
annotation and peak calling with [Omnipeak](https://github.com/JetBrains-Research/omnipeak) (Previously [SPAN](https://github.com/JetBrains-Research/span)) algorithm for a given annotation,
with the results of peak calling immediately visualized as BED files in the same session.

It can serve not only as an efficient semi-supervised peak calling engine but also as a next-generation genome browser
with enhanced functionality for viewing large files, viewing multiple locations simultaneously, and gathering track
statistics.

**Open Access Paper:** https://doi.org/10.1093/bioinformatics/btab376

**Citation:** Shpynov O, Dievskii A, Chernyatchik R, Tsurinov P, Artyomov MN. Semi-supervised peak calling with SPAN and JBR Genome Browser. Bioinformatics. 2021 May 21.

Features
--------

* Classical genome browser features to visualize various genome data formats
* Supported data file formats: BED (including MACS2, SICER peaks), BigWig, Wig, BigBed, Tdf
* Supported BAM/SAM/CRAM files including Bisulfite-Sequencing files visualization
* GTF files support
* Supported session formats: JBR *.yaml, IGV *.xml, UCSC *.txt session files
* Remote URL BigWig/BigBed/BED files support
* Select tracks by name or wildcard
* Multiple panels support
* Group scale mode for selected tracks
* Integrated annotation of peaks and on-the-fly semi-supervised peak calling
* Enhanced Omnipeak | SPAN models visualization
* Support for viewing multiple genomic locations simultaneously
* Optimized for large sessions
* Detailed track statistics and information on mouse hover
* BED tracks overlap / Jaccard analysis
* Support for screenshots in PNG or SVG formats
* Headless screenshots done from command line interface
* Support for searching and loading tracks from ENCODE portal
* Easily set up a server using publicly available Docker image
* Full support of High DPI displays
* Genomes configuration editor
* Mouse mm39, Human hs1 (telomere-to-telomere), hs37-1kg, hs37d5 (decoy genomes)
* Peak calling with BAM files rigth from the graphical user interface

Note: JBR Genome Browser supports models produced by the [SPAN](https://github.com/JetBrains-Research/span) version 2.0+.

Downloads
---------
See [releases](https://github.com/JetBrains-Research/jbr/releases) section for actual information.

See changelog for the latest version [here](https://raw.githubusercontent.com/JetBrains-Research/jbr/master/CHANGES.txt).

Installation
------------
Download a suitable build for your OS from the Downloads section.

* Windows<br>
  Unpack the browser `jbr-XXX.zip` file.<br>
  Launch `jbr.exe`.

* MacOS<br>
  * For M1+ Mac computers:<br>
  Download the `jbr-XXX.dmg` macOS Disk Image file<br>
  Mount it as another disk in your system<br>
  Copy JBR Genome Browser to your Applications folder<br>
  If you want to open multiple JBR instances, launch instance with the command:<br>
  `open -n "/Applications/JBR.app"`<br>
  
  * For Intel-based Mac computers:<br>
  Download the `jbr-XXX.jar` Java archive file, ensure that you have Java 21+ installed.<br>
  Launch JBR Genome Browser with the command:<br>
  `java -jar jbr-XXX.jar"`


* Linux:<br>
  Unpack the browser `jbr-XXX.tar.gz` file using the following command:<br>
  `tar -xzf jbr-XXX.tar.gz`<br>
  Launch `jbr.sh` from the `bin` subfolder.


Web server mode
---------------
JBR Genome Browser can be set up as a local web server which allows for an accessible way to share the results. This can
be particularly useful when working with private datasets, which cannot be exported to public UCSC browser session, and
should be accessible only within local network.<br>
Example of web server mode can be seen at: [https://artyomovlab.wustl.edu/jbr/](https://artyomovlab.wustl.edu/jbr/).

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
