Sub CopyAndUpdateYear(previousYearKeywords As Variant, currentYearKeywords As Variant)

  Dim sourceWorkbook As Workbook
  Dim targetWorkbook As Workbook
  Dim ws As Worksheet
  Dim cell As Range
  Dim i As Long

  ' Set the source workbook to the active workbook
  Set sourceWorkbook = ActiveWorkbook

  ' Create a new workbook
  Set targetWorkbook = Workbooks.Add

  ' Copy all sheets from the source workbook to the target workbook
  sourceWorkbook.Sheets.Copy Before:=targetWorkbook.Sheets(1)

  ' Loop through each worksheet in the target workbook
  For Each ws In targetWorkbook.Sheets

    ' Update sheet names with keywords
    For i = LBound(previousYearKeywords) To UBound(previousYearKeywords)
        ws.Name = Replace(ws.Name, previousYearKeywords(i), currentYearKeywords(i))
    Next i

    ' Loop through each cell in the worksheet
    For Each cell In ws.UsedRange

      ' Check if the cell contains a date value without a formula
      If IsDate(cell.Value) And Not cell.HasFormula Then
        ' Update the year of the date value
        cell.Value = DateSerial(Year(Now()), Month(cell.Value), Day(cell.Value))
      End If

    Next cell

  Next ws

  ' Optionally, save the new workbook
  ' targetWorkbook.SaveAs "Path\NewWorkbookName.xlsx"

End Sub

Sub TestCopyAndUpdateYear()
    Dim prevYearKeywords As Variant
    Dim currYearKeywords As Variant

    ' Define arrays of keywords for replacement
    prevYearKeywords = Array("2023", ".2021") ' Example keywords
    currYearKeywords = Array("2024", ".2024") ' Corresponding keywords

    Call CopyAndUpdateYear(prevYearKeywords, currYearKeywords)
End Sub
