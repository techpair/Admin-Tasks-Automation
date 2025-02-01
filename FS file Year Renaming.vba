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
	
	if InStr(1,ws.Name, previousYearKeywords(i), vbTextCompare)>0 Then
			
		ws.Name = Replace(ws.Name, previousYearKeywords(0), currentYearKeywords(0))
			
	End if
	
    ' Loop through each cell in the worksheet
    For Each cell In ws.UsedRange

      ' Check if the cell contains a date value without a formula
      If Not cell.HasFormula Then
        ' Update the year of the date value
		
		if InStr(1,cell.value, previousYearKeywords(i), vbTextCompare)>0 Then
			
			if InStr(1,cell.value, previousYearKeywords(i), vbTextCompare)>0 Then
				cell.Value = "'" & Replace(cell.value, previousYearKeywords(0), currentYearKeywords(0))
			Else
				cell.Value = Replace(cell.value, previousYearKeywords(0), currentYearKeywords(0))
			end if
		End if
		
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
    prevYearKeywords = Array("2021", ".2021") ' Example keywords
    currYearKeywords = Array("2024", ".2024") ' Corresponding keywords

    Call CopyAndUpdateYear(prevYearKeywords, currYearKeywords)
End Sub
