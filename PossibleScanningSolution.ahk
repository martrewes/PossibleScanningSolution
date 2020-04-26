;Preface: I am by no means a professional programmer. Far from it!
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
Menu, tray, Icon , 01.ico, 1, 1
;Define the GUI
Gui -MinimizeBox -MaximizeBox
Gui Add, Edit, vFirst x16 y48 w120 h21
Gui, Add, UpDown
Gui Add, Edit, vLast x16 y96 w120 h21
Gui, Add, UpDown
Gui Add, Text, x16 y24 w120 h23 +0x200, 1st Serial No.
Gui Add, Text, x16 y72 w120 h23 +0x200, Last Serial No.
Gui Add, Button, x16 y128 w121 h23, &Submit
Gui Add, GroupBox, x8 y8 w137 h151, Insert Serials
Gui Add, Button, x86 y160 w60 h23, &Help?
Gui Add, Button, x115 y71 w23 h23, &/\|\/
Gui Show,x750 y700 w153 h196, Insert Serials
Return

ButtonHelp?: ;A general Help button
MsgBox,,Help, Ensure you have scanned the 1st Barcode, and have filled in all of the required information. Once complete, click on that window then immediately click on this one after. Scan your first and last serial number then click submit. The program will return to focus once it is complete.
Return

Button/\|\/:
Gui, Submit, NoHide
gFirst = %Last%
gLast = %First%
GuiControl,, First, %gFirst%
GuiControl,, Last, %gLast%
Return

ButtonSubmit: ;Main Submit button
Gui, Submit, NoHide
;Assign the variables
intFirst = %First% 
intLast = %Last%
if (intFirst >= intLast) {    ;Catch any invalid input
    MsgBox ,,Error,Please ensure the serial numbers are the correct way around
    Return
}

else {
    intTotal := 1 + intLast - intFirst

    MsgBox,4,Confirm,You are about to process %intTotal% labels. Are you sure?
    
    IfMsgBox, No
        Return

        intFirst++ ;The first barcode has already been scanned, so omit that one
        Send, {ALT DOWN}{TAB}{ALT UP} ;Alt+Tab to the window
        while (intFirst <= intLast){ ;Start the loop
        Sleep 100 ;Allow things to settle
        Send, %intFirst%{enter} ;Type the barcode number followed by *Enter*
        intFirst++ ;Add 1 to the barcode number
        Sleep, 200 ;Sleep for 1/5 Second just in case of unstability

    }
    Send, {ALT DOWN}{TAB}{ALT UP} ;Alt+Tab back to the program window
    Return   
}


GuiEscape:
GuiClose:
    ExitApp
