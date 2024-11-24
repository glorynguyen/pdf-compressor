# PDF Compressor

This batch file uses Ghostscript to compress PDF files on Windows 10 and higher. The process is simple and allows you to reduce the size of your PDF files quickly.

## Prerequisites

Before you begin, ensure the following:

- This solution is supported on **Windows 10** and higher.
- You must have **Microsoft Word** installed, as the script uses Word's file chooser dialog to select PDF files.

## Installation Instructions

1. **Install Ghostscript:**
   - Double-click the file `gs10040w64.exe` located in the `/bin/` folder to install Ghostscript version 10.04.0 on your system.

2. **Setup Files:**
   - Copy the following files into the same folder where Ghostscript was installed (the `bin` folder):
     - `filechooser.vbs`
     - `run.bat`
   - These files are required for running the PDF compression.

3. **Create Shortcut:**
   - Make a shortcut of the `run.bat` file and place it on your **desktop** for easy access.

## How to Compress a PDF File

Follow these steps to compress your PDF files:

1. **Run the Compressor:**
   - Double-click the `run.bat` file to launch the compression tool.
   - You may need to run the script **as Administrator** for proper permissions.
   - A file chooser dialog will appear (this uses Microsoft Word to select your file).

   ![Running the Script](https://github.com/glorynguyen/pdf-compressor/assets/9473156/e830210b-e8a3-4203-99fe-474a12d9f175)

2. **Select the PDF:**
   - Choose the PDF file you want to compress. The script will start processing the file.

3. **Wait for Compression:**
   - The compression process may take a few minutes, depending on the size of the PDF file. Wait until the process finishes.
   
   ![Compression in Progress](https://github.com/glorynguyen/pdf-compressor/assets/9473156/547ba6ea-9448-42e9-b58e-7a471861acc3)

4. **Access the Compressed File:**
   - Once the process is complete, the compressed PDF file will be saved in the same folder as the original PDF.
   
   ![Compressed File](https://github.com/glorynguyen/pdf-compressor/assets/9473156/a3710d09-3cc6-472e-9ee4-a24049128a8d)

## Notes

- The script uses **Ghostscript** to perform the PDF compression. The quality of the output PDF depends on the settings you use in Ghostscript.
- Make sure that your PDF files are not encrypted or password-protected, as the script may not be able to process them.

## License

This project is licensed under the MIT License.
