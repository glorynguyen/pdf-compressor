# pdf-compressor
This is my custom batch file using Ghostscript to compress PDF files on Windows 10.

## Pre-required

- Download and install the latest version of [ghostscript](https://ghostscript.com/releases/gsdnld.html)
- This is only supported for Windows 10 and higher.
- Your machine should have already installed the Word application (This snippet uses the Word application to open a file chooser).

## How to install

1. Copy the `filechooser.vbs` and `run.bat` files and put them in the same folder as the Ghostscript installed `bin` folder.
2. Make a shortcut of the `run.bat` file and place it on the desktop