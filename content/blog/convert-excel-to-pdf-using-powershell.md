---
date: "2016-09-05T19:13:22+09:00"
draft: false
title: "Convert Excel to PDF using PowerShell"
tags: [
    "PowerShell",
    "Microsoft Office",
    "Excel",
    "PDF"
]

---

大量の Excel ファイルを PDF に変換したいことはありませんか？<br>
いちいちファイルを開いて PDF に変換していたら日が暮れてしまいます。<br>
そんな面倒なことは自動化したいですね。<br>
そんな時は 以下の PowerShell スクリプトで一気に変換しましょう。

`Convert-ExcelToPdf.ps1`
```PowerShell
function Convert-ExcelToPdf([string]$path)
{
    $xlFixedFormat = "Microsoft.Office.Interop.Excel.xlFixedFormatType" -as [type]

    # Excelオブジェクトの作成
    $objExcel = New-Object -ComObject Excel.Application
    $objExcel.Visible = $False

    $workbook = $objExcel.workbooks.Open($path)
    $workbook.Saved = $True

    # PDFとして保存する
    $workbook.ExportAsFixedFormat($xlFixedFormat::xlTypePDF, $path + ".pdf")

    # Excelの終了
    $objExcel.Workbooks.Close()
    [void]$objExcel.Quit
}
$fileName = $Args[0]
$path = Convert-Path($fileName)
Convert-ExcelToPdf($path)
```

変換したい Excel ファイルがあるディレクトリで以下を実行すれば<br>
一気に Excel ファイルが PDF に変換されていきます。

```PowerShell
$items = @(Get-ChildItem -Recurse -include *.xlsx)
$count = $items.Count
$items | ForEach-Object -begin { $index = 0 } -process {
	$index++;
	"Converting($index/$count): $($_.FullName)";
	if(Test-Path $($_.FullName + ".pdf")){
		# If pdf file Already exists, it do nothing.
	}else{
		.\Convert-ExcelToPdf.ps1 $_.FullName;
	}
}
```