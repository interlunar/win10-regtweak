' Created by: Shawn Brink
' http://www.sevenforums.com
' Tutorial: http://www.sevenforums.com/tutorials/268478-icon-cache-size-change-windows.html


If WScript.Arguments.Count = 0 Then
     Set objShell = CreateObject("Shell.Application")
     objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " Run", , "runas", 1
Else
     const HKEY_LOCAL_MACHINE = &H80000002
     strComputer = "."
     Set objReg=GetObject( _
         "winmgmts:{impersonationLevel=impersonate}!\\" & _
         strComputer & "\root\default:StdRegProv")
     strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
     strValueName = "Max Cached Icons"
Call Reset

Sub Reset
Reset1 = MsgBox ("Would you like to reset the icon cache size back to default?" & vbNewLine & vbNewLine & "(Yes=Reset   No=Change   Cancel=Close)", VBYesNoCancel, "Reset Icon Cache Size?") 
If IsEmpty(Reset1) Then 
     WScript.Quit
ElseIf Reset1 = vbYes then
     objReg.DeleteValue HKEY_LOCAL_MACHINE,_
     strKeyPath,strValueName
     Call Restart
ElseIf Reset1 = vbNo then
Change1 = MsgBox ("Would you like to set a custom icon cache size?" & vbNewLine & vbNewLine & "(Yes=Set Size   No=Reset   Cancel=Close)", VBYesNoCancel, "Change Icon Cache Size?")
If IsEmpty(Change1) Then 
     WScript.Quit
ElseIf Change1 = vbNo then
    Call Reset
ElseIf Change1 = vbYes then
    Call Input
End if
End if
End sub


Sub Input
Input1 = InputBox("Enter a number for how many kilobytes you would like the icon cache size to be. (1024 KB = 1 MB)", "Set Icon Cache Size")
Input2 = Input1
If IsEmpty(Input1) Then 
     WScript.Quit
ElseIf Len(Input1) = 0 Then 
  Call Input
End if
verify3 = MsgBox ("Is this the correct size in kilobytes?" & vbNewLine & vbNewLine & Input1 & "   (1024 KB = 1 MB)", VBYesNo, "Verify Icon Cache Size")
If verify3 = vbNo then
    Call Input
ElseIf verify3 = vbYes then
 objReg.SetStringValue HKEY_LOCAL_MACHINE,_
     strKeyPath,strValueName,Input2
Call Restart
End if
End sub


Sub Restart
Restart1 = MsgBox ("Please Restart computer now to apply.", VBYesNo, "Successfully Finished")
If Restart1 = vbNo then
    MsgBox "Please Restart computer soon to apply."
    WScript.Quit
ElseIf Restart1 = vbYes then 
   WScript.CreateObject("WScript.Shell").Run "shutdown.exe -R -F -T 0"
End if
End sub

End if