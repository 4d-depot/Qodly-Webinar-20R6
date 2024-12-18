

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.ds:=ds:C1482
		
		Form:C1466.mainPatients:=Form:C1466.ds.People.query("type = :1"; "Patient")
		Form:C1466.patients:=Form:C1466.mainPatients.orderBy("fullname")
		
		Form:C1466.searchPat:=""
		
		OBJECT SET VISIBLE:C603(*; "AsPatient@"; True:C214)
		
		LISTBOX SELECT ROW:C912(*; "LBPatients"; 1; lk replace selection:K53:1)
		
		If (Form:C1466.patients.length#0)
			Form:C1466.female:=Form:C1466.patients.first().gender="Female" ? 1 : 0
			Form:C1466.male:=Form:C1466.patients.first().gender="Male" ? 1 : 0
		End if 
		
End case 