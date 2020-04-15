# Possible Scanning Solution

## What does it do?
This (very) simple application should reduce the errors in the process of scanning barcodes. 

## How to Use
The way it works is simple:
* The operator will open the KTP scanning application as normal, and scan the first barcode and entering the correct data on the traceability sheet
* The operator will then open this application
* Scan the First and Last barcodes in the strip
* Click Submit and let it do its thing! The program will "scan" [type] each barcode and hit Enter. (First barcode is ommited as it has already been scanned)

# Possible Additions:
* Add a total number of barcodes on the UI so the operator can double check
* Find the actual scanning window's name so I don't have to rely on Alt+Tab

# Working Demo
![AppDemo](Demo.gif)

## Additional Info
This was made as an AHK script, then just converted to an executable. The script is fully readable in case of any issues with security.
