function convertDocToPDF(){
  
  //Document ID
  const template = DriveApp.getFileById('templateID');
  
  //Document ID of Folder
  const destinationFolder = DriveApp.getFolderById('FolderID')
  
  //Initialize sheet variables
  const sheet = SpreadsheetApp
  .getActiveSpreadsheet()
  .getSheetByName('SheetName')

  //Convert to array
  const rows = sheet.getDataRange().getValues();

  rowLimit = 10;

  //Loop through each of the rows
  rows.forEach(function(row, index) {
    if (index === 0) return;
    if (row[rowLimit]) return;
    const copy = template.makeCopy(`${row[rowLimit-10]}, ${row[rowLimit-9]}, ${row[rowLimit-8]}, ${row[rowLimit-7]}`, destinationFolder)
    const doc = DocumentApp.openById(copy.getId())
    const body = doc.getBody();
  
    body.replaceText('{{ColName Sample}}', row[rowLimit-2]);
    body.replaceText('{{ColName Sample2}}', row[rowLimit-10]);
    
    doc.saveAndClose();

    const url = doc.getUrl();
    sheet.getRange(index + 1, rowLimit).setValue(url)
    
    const pdf = convertToPdf_(doc, destinationFolder);
    const url = pdf.getUrl();
    sheet.getRange(index + 1, rowLimit).setValue(url);
    const docFile = DriveApp.getFileById(doc.getId());
    docFile.setTrashed(true);

  })
  
}

function convertToPdf_(doc, Folder){
  const blob = doc.getAs('application/pdf');
  const file = Folder.createFile(blob);
  return file;
}
