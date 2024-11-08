VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "WECC Form"
   ClientHeight    =   11670
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   20415
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim updateRow As Integer
Dim criterion


Private Sub cmdAddNew_Click()

Dim wks As Worksheet
Dim AddNew As Range

Set wks = Sheet1
Set AddNew = wks.Range("A65356").End(xlUp).Offset(1, 0)

AddNew.Offset(0, 0).Value = "=Row()+5088"
AddNew.Offset(0, 1).Value = txtFirstname.Text
AddNew.Offset(0, 2).Value = txtSurname.Text
AddNew.Offset(0, 3).Value = txtAddress.Text
AddNew.Offset(0, 4).Value = txtPostCode.Text
AddNew.Offset(0, 5).Value = txtTelephone.Text
AddNew.Offset(0, 6).Value = txtDataReg.Text
AddNew.Offset(0, 7).Value = txtProve.Text
AddNew.Offset(0, 8).Value = txtMemberType.Text
AddNew.Offset(0, 9).Value = txtMemberFees.Text

TheDisplay.ColumnCount = 11
TheDisplay.RowSource = "A1:J65356"

'Call Refresh_Data

End Sub

Private Sub cmdDelete_Click()
If Me.txtRef.Value = "" Then
MsgBox "Double click on a row and delete."
Exit Sub
End If

Dim sh As Worksheet
Set sh = ThisWorkbook.Sheets("Sheet1")
Dim Selected_Row As Long
Selected_Row = Application.WorksheetFunction.Match(CLng(Me.txtRef.Value), sh.Range("A:A"), 0)
'----------------------------------------------
sh.Range("A" & Selected_Row).EntireRow.Delete
'----------------------------------------------

Me.txtRef.Value = ""
Me.txtFirstname.Value = ""
Me.txtSurname.Value = ""
Me.txtAddress.Value = ""
Me.txtPostCode.Value = ""
Me.txtTelephone.Value = ""
Me.txtDataReg.Value = ""
Me.txtProve.Value = ""
Me.txtMemberType.Value = ""
Me.txtMemberFees.Value = ""

'Call Refresh_Data

End Sub

Private Sub cmdExit_Click()
Dim iExit As VbMsgBoxResult
iExit = MsgBox("Confirm to exit.", vbQuestion + vbYesNo, "Search System")
If iExit = vbYes Then
Unload Me
End If
End Sub

Private Sub cmdPrint_Click()
Application.Dialogs(xlDialogPrinterSetup).Show
ThisWorkbook.Sheets("Sheet1").PrintOut copies:=1
End Sub


Private Sub cmdReset_Click()
Dim txt
    For Each txt In Frame2.Controls
        If TypeOf txt Is MSForms.TextBox Then
            txt.Text = ""
        End If
    Next txt
    
    txtSearch.Text = ""
    ComboBoxCriteria.Text = ""
End Sub


Private Sub cmdUpdate_Click()
If Me.txtRef.Value = "" Then
MsgBox "Select a record to update"
Exit Sub
End If

Dim sh As Worksheet
Set sh = ThisWorkbook.Sheets("Sheet1")
Dim Selected_Row As Long
Selected_Row = Application.WorksheetFunction.Match(CLng(Me.txtRef.Value), sh.Range("A:A"), 0)


sh.Range("B" & Selected_Row).Value = Me.txtFirstname.Value
sh.Range("C" & Selected_Row).Value = Me.txtSurname.Value
sh.Range("D" & Selected_Row).Value = Me.txtAddress.Value
sh.Range("E" & Selected_Row).Value = Me.txtPostCode.Value
sh.Range("F" & Selected_Row).Value = Me.txtTelephone.Value
sh.Range("G" & Selected_Row).Value = Me.txtDataReg.Value
sh.Range("H" & Selected_Row).Value = Me.txtProve.Value
sh.Range("I" & Selected_Row).Value = Me.txtMemberType.Value
sh.Range("J" & Selected_Row).Value = Me.txtMemberFees.Value
sh.Range("K" & Selected_Row).Value = Now
'------------------------------------------------------------------------


Me.txtFirstname.Value = ""
Me.txtSurname.Value = ""
Me.txtAddress.Value = ""
Me.txtPostCode.Value = ""
Me.txtTelephone.Value = ""
Me.txtDataReg.Value = ""
Me.txtProve.Value = ""
Me.txtMemberType.Value = ""
Me.txtMemberFees.Value = ""


'Call Refresh_Data


End Sub

Private Sub ComboBoxCriteria_Change()
Dim c As Integer
Dim column_headers
column_headers = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")

For c = 1 To 11
If Sheet1.Cells(1, c).Value = Me.ComboBoxCriteria.Value Then
criterion = column_headers(c - 1)
End If
Next
Sheet1.Cells(1, "M").Value = criterion

Me.txtSearch.Value = ""
Me.txtSearch.SetFocus



End Sub


Private Sub SpinButton1_Change()
Dim c1, c2

If SpinButton1.Value > 1 Then
c2 = SpinButton1.Value

c1 = "A" & c2
txtRef.ControlSource = c1
c1 = "B" & c2
txtFirstname.ControlSource = c1
c1 = "C" & c2
txtSurname.ControlSource = c1
c1 = "D" & c2
txtAddress.ControlSource = c1
c1 = "E" & c2
txtPostCode.ControlSource = c1
c1 = "F" & c2
txtTelephone.ControlSource = c1
c1 = "G" & c2
txtDataReg.ControlSource = c1
c1 = "H" & c2
txtProve.ControlSource = c1
c1 = "I" & c2
txtMemberType.ControlSource = c1
c1 = "J" & c2
txtMemberFees.ControlSource = c1

End If
End Sub

Private Sub TheDisplay_DblClick(ByVal Cancel As MSForms.ReturnBoolean)

'--------------By doble clock on a row, it will bring it up ----------------
Me.txtRef.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 0)
Me.txtFirstname.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 1)
Me.txtSurname.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 2)
Me.txtAddress.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 3)
Me.txtPostCode.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 4)
Me.txtTelephone.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 5)
Me.txtDataReg.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 6)
Me.txtProve.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 7)
Me.txtMemberType.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 8)
Me.txtMemberFees.Value = Me.TheDisplay.List(Me.TheDisplay.ListIndex, 9)

'---------------------------------------------------------------------------

End Sub

Private Sub txtSearch_Change()
On Error Resume Next

If Me.txtSearch.Text = "" Then
Me.TheDisplay.Clear
Exit Sub
End If

Me.TheDisplay.Clear
Dim a As Integer
Dim r, last_row As Integer
last_row = Sheet1.Range("A10000").End(xlUp).Row
For r = 2 To last_row
    a = Len(Me.txtSearch.Text)
    If UCase(Left(Sheet1.Cells(r, criterion).Value, a)) = UCase(Me.txtSearch.Text) Then
    With Me.TheDisplay

    .AddItem Sheet1.Cells(r, "A").Value
    .List(.ListCount - 1, 1) = Sheet1.Cells(r, "B").Value
    .List(.ListCount - 1, 2) = Sheet1.Cells(r, "C").Value
    .List(.ListCount - 1, 3) = Sheet1.Cells(r, "D").Value
    .List(.ListCount - 1, 4) = Sheet1.Cells(r, "E").Value
    .List(.ListCount - 1, 5) = Sheet1.Cells(r, "F").Value
    .List(.ListCount - 1, 6) = Sheet1.Cells(r, "G").Value
    .List(.ListCount - 1, 7) = Sheet1.Cells(r, "H").Value
    .List(.ListCount - 1, 8) = Sheet1.Cells(r, "I").Value
    .List(.ListCount - 1, 9) = Sheet1.Cells(r, "J").Value
    .List(.ListCount - 1, 10) = Sheet1.Cells(r, "K").Value
    End With
    End If
    Next

End Sub

Private Sub UserForm_Activate()
'Call Refresh_Data
End Sub


'Sub Refresh_Data()

'Dim sh As Worksheet
'Set sh = ThisWorkbook.Sheets("Sheet1")
'Dim last_row As Long
'last_row = Application.WorksheetFunction.CountA(sh.Range("A:A"))

'With Me.TheDisplay
        '.ColumnHeads = True
        '.ColumnCount = 11
        '.ColumnWidths = "60,60,60,80,60,60,60,60,60,60,80"
        
        'If last_row = 1 Then
        '.RowSource = "Sheet1!A2:K2"
        'Else
        '.RowSource = "Sheet1!A2:K" & last_row
        'End If
        
'End With
        
'End Sub


Private Sub UserForm_Initialize()
Dim c As Integer
For c = 1 To 11

Me.ComboBoxCriteria.AddItem Sheet1.Cells(1, c).Value
Next

With Me.TheDisplay
        .ColumnHeads = True
        .ColumnCount = 11
        .ColumnWidths = "60,60,60,80,60,60,60,60,60,60,80"

        
End With

End Sub
