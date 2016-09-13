dim zpProgID, opObj, state
zpProgID=""
state = vbOK
while state=vbOK
	zpProgID = InputBox("Please enter the ProgID","ProgID Request", zpProgID)
	if zpProgID <> "" then
			
		err.Clear
		on error resume next
		set opObj = CreateObject(zpProgID)
		if err.number<>0 then
			state = MsgBox("Object creation failed: " & vbNewLine & err.Description & vbNewLine & "Try Again?", vbOKCancel)
		else
			Message = ""
			CLSID = ""
			CurrentVersion = ""
			Description = ""

			Message = "Object creation successful: " & zpProgID

			Set WSHShell = CreateObject("WScript.Shell")
			
			Description = WSHShell.RegRead("HKCR\" & zpProgID & "\")
			If Description <> "" Then
				Message = Message & vbNewLine & "Description: " &Description
			End If
			
			Message = Message & vbNewLine
			
			CurrentVersion = WSHShell.RegRead("HKCR\" & zpProgID & "\CurVer\")

			If CUrrentVersion <> "" Then
				Message = Message & vbNewLine & "Current Version ProgID: " & CurrentVersion
				CLSID = WSHShell.RegRead("HKCR\" & CurrentVersion & "\CLSID\")
			Else
				CLSID = WSHShell.RegRead("HKCR\" & zpProgID & "\CLSID\")
			End If
			
			If CLSID <> "" Then
				InProcServer = WSHShell.RegRead("HKCR\CLSID\" & CLSID & "\InProcServer32\")
				Message = Message & vbNewLine & InProcServer
			End If

			state = MsgBox(Message & vbNewLine & "Try again?", vbOKCancel)
		end if
	else
		state = vbCancel
	end if
wend
