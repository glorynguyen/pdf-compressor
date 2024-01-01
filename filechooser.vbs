' Create a Word.Application object
Set objWord = CreateObject("Word.Application")
' Set its Visible property to False
objWord.Visible = False

' Create a FileDialog object of type msoFileDialogFilePicker
Set objDialog = objWord.Application.FileDialog(3)

' Set the properties of the FileDialog object
objDialog.Title = "Select a PDF file to convert"
objDialog.InitialFileName = "C:\Program Files\gs\gs10.02.1\bin"
objDialog.Filters.Clear
objDialog.Filters.Add "PDF Files", "*.pdf"

' Show the dialog and get the user's selection
intResult = objDialog.Show
If intResult = 0 Then
WScript.Quit
Else
' Get the full path of the selected file
strFilePath = objDialog.SelectedItems(1)
' Echo the file path
WScript.Echo strFilePath
End If

' Quit the Word.Application object
objWord.Quit
' Release the resources
Set objDialog = Nothing
Set objWord = Nothing