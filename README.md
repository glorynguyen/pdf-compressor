# pdf-compressor
This is my custom batch file using Ghostscript to compress PDF files on Windows 10.

## Pre-required

- This is only supported for Windows 10 and higher.
- Your machine should have already installed the Word application (This snippet uses the Word application to open a file chooser).

## How to install

1. Double click to the file `/bin/gs10040w64.exe` to install Ghostscript 10.04.0

2. Copy the `filechooser.vbs` and `run.bat` files and put them in the same folder as the Ghostscript installed `bin` folder.
![image](https://github.com/glorynguyen/pdf-compressor/assets/9473156/b4b8fda2-317e-4e42-9803-6e0644c643cb)


3. Make a shortcut of the `run.bat` file and place it on the desktop

## How to compress the pdf file
1. Run the run.bat file and select your pdf file to compress (run as administrator)
![image](https://github.com/glorynguyen/pdf-compressor/assets/9473156/e830210b-e8a3-4203-99fe-474a12d9f175)

2. Wait until the Ghostscript finishes running (the time of running depends on the size of the selected PDF to compress). 
![image](https://github.com/glorynguyen/pdf-compressor/assets/9473156/547ba6ea-9448-42e9-b58e-7a471861acc3)

3. The compressed PDF file will be placed in the same folder as the selected input PDF file.
![image](https://github.com/glorynguyen/pdf-compressor/assets/9473156/a3710d09-3cc6-472e-9ee4-a24049128a8d)
