JBR Genome Browser
==================

**JBR Genome Browser** is a fast and scalable general purpose genome browser with support of a
novel [semi-supervised approach](http://artyomovlab.wustl.edu/aging/tools.html) to peak calling.

It supports classic genome browser functionality and provide readily accessible integrated peak annotation and peak
calling capabilities. JBR Genome Browser allows researchers to upload tracks of Chip-seq data and perform on-the-fly
annotation and peak calling with [SPAN](https://github.com/JetBrains-Research/span) algorithm for a given annotation,
with the results of peak calling immediately visualized as BED files in the same session.

It can serve not only as an efficient semi-supervised peak calling engine but also as a next-generation genome browser
with enhanced functionality for viewing large files, viewing multiple locations simultaneously, and gathering track
statistics.

Features
--------

* On-the-fly peak calling using [SPAN](https://github.com/JetBrains-Research/span) models
* Integrated annotation of peaks for semi-supervised peak calling
* Support for viewing multiple genomic locations simultaneously
* Classical genome browser features to visualize various genome data formats
* Supported data file formats: BED (including MACS2, SICER peaks), BigWig, Wig, BigBed, Tdf
* **New** Supported session formats: JBR *.yaml, IGV *.xml, UCSC *.txt session files
* Remote URL BigWig/BigBed/BED files support
* Show track statistics
* BED tracks overlap analysis
* Optimized for large sessions
* Support for screenshots in PNG or SVG formats
* Support for searching and loading tracks from ENCODE portal
* Easily set-up a server using publicly available Docker image.<br>
  See an example at https://artyomovlab.wustl.edu/jbr/
* Full support of High DPI displays
* **New** Genomes configuration editor

Note: JBR Genome Browser supports models produced by the SPAN version 0.12+.

Downloads
---------

Version [1.0.beta.5320](https://github.com/JetBrains-Research/jbr/releases/tag/1.0.beta.5320) released on March 24, 2021

| Download | Description |
| -------- | ----------- |
| [jbr-1.0.beta.5320.zip](https://download.jetbrains.com/biolabs/jbr_browser/win/jbr-1.0.beta.5320.zip) | Windows archive (includes bundled 64-bit Java Runtime) |
| [jbr-1.0.beta.5320.dmg](https://download.jetbrains.com/biolabs/jbr_browser/mac/jbr-1.0.beta.5320.dmg)      | Mac installer (includes bundled 64-bit Java Runtime)   |
| [jbr-1.0.beta.5320.tar.gz](https://download.jetbrains.com/biolabs/jbr_browser/linux/jbr-1.0.beta.5320.tar.gz) | Linux archive (includes bundled 64-bit Java Runtime)   |
| [jbr-1.0.beta.jar](https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-1.0.beta.5320.jar) | Java archive file |

Installation
------------
Download a suitable build for your OS from the Downloads section.

* Windows<br>
  Unpack the browser `1.0.beta.5320.zip` file.<br>
  Launch `jbr.exe`.

* MacOS<br>
  Download the `1.0.beta.5320.dmg` macOS Disk Image file<br>
  Mount it as another disk in your system<br>
  Copy JBR Genome Browser to your Applications folder<br>
  If you want to open multiple JBR instances, launch instance with the command:<br>
  `open -n "/Applications/JBR 1.0.app"`

* Linux:<br>
  Unpack the browser `1.0.beta.5320.tar.gz` file using the following command:<br>
  `tar -xzf 1.0.beta.5320.tar.gz`<br>
  Launch `jbr.sh` from the `bin` subfolder.

Web server mode
---------------
JBR Genome Browser can be set up as a local web server which allows for an accessible way to share the results. This can
be particularly useful when working with private datasets, which cannot be exported to public UCSC browser session, and
should be accessible only within local network.<br>
Example of web server mode can be seen at: [https://artyomovlab.wustl.edu/jbr/](https://artyomovlab.wustl.edu/jbr/).

The user creates a number of preconfigured JRB sessions, place them in a separate `<sessions_folder>` on the local
machine, and easily set up a server using publicly available Docker image `biolabs/jbr` with the command:

```
  docker run --publish=5000:5000 --volume=<sessions_folder>:/jbr_sessions --volume=<logs_folder>:/jbr_logs  -d -t biolabs/jbr
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
