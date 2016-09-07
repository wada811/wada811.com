+++
date = "2016-09-07T19:15:11+09:00"
draft = false
title = "Concat PDF files using PowerShell"
tags = [
    "PowerShell",
    "PDF"
]

+++

大量の PDF ファイルを1ファイルに結合してまとめたいことはありませんか？<br>
PDF 結合ソフトでいちいちファイルを結合していたら日が暮れてしまいます。<br>
そんな面倒なことは自動化したいですね。<br>
そんな時は PowerShell で一気に変換しましょう。

```PowerShell
$outputPdfPath = "path\to\output.pdf";
$source1PdfPath = "path\to\source1.pdf";
$source2PdfPath = "path\to\source2.pdf";

$fs = New-Object System.IO.FileStream($outputPdfPath, [System.IO.FileMode]::OpenOrCreate);
$outputPdf = New-Object iTextSharp.text.pdf.PdfCopyFields($fs);
$outputPdf.Open();

$reader1 = New-Object iTextSharp.text.pdf.PdfReader($source1PdfPath);
$reader2 = New-Object iTextSharp.text.pdf.PdfReader($source2PdfPath);

$outputPdf.AddDocument($reader1);
$outputPdf.AddDocument($reader2);

$outputPdf.Close();
$fs.Close();
$reader1.Close();
$reader2.Close();
```

いちいちファイル名を指定してられるなら PDF 結合ソフトで十分ですね？
自動化したくなるのは階層状の各ディレクトリにPDFがあって、
結合していって1ファイルにまとめたいような時ですよね。

そんな時は結合したい Pdf ファイルがあるディレクトリで以下を実行すれば
一気に Pdf ファイルが結合されていきます。

```PowerShell
$iTextSharpDllPath = "C:\path\to\itextsharp.dll";

$directories = @(Get-ChildItem -recurse | Where-Object { $_.PsIsContainer } | Sort-Object { $_.FullName.Split("\\").Count } -descending)
$directoriesCount = $directories.Count
$directories | ForEach-Object -begin {
	$directoryIndex = 0;
	[System.Reflection.Assembly]::LoadFrom($iTextSharpDllPath);
} -process {
	$directory = $_
	$directoryIndex++;
	"Searching($directoryIndex/$directoriesCount): $($directory.FullName)";
	$targetPdfs = @(Get-ChildItem $directory.FullName | where-object { $_.Name.EndsWith(".pdf") })
	if($targetPdfs.Count -gt 0){
		$targetPdfs | ForEach-Object -begin {
			$concatIndex = 0;
			$outputPdfPath = $directory.FullName + ".pdf";
			"    Create: $outputPdfPath";
			$fs = New-Object System.IO.FileStream($outputPdfPath, [System.IO.FileMode]::OpenOrCreate);
			$outputPdf = New-Object iTextSharp.text.pdf.PdfCopyFields($fs);
			$outputPdf.Open();
			$readers = New-Object System.Collections.ArrayList
		} -process {
			$concatIndex++;
			"        Concat($concatIndex/$($targetPdfs.Count)): $($_.FullName)";
			$reader = New-Object iTextSharp.text.pdf.PdfReader($_.FullName);
			$outputPdf.AddDocument($reader);
			$size = $readers.Add($reader);
		} -end {
			"    Save: $outputPdfPath";
			$outputPdf.Close();
			$fs.Close();
			$readers | %{ $_.Close() }
		}
	}
}
```