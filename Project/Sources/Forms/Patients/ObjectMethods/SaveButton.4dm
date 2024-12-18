

var $status : Object

If (Form:C1466.creation=True:C214)
	
	Form:C1466.patient.gender:=Form:C1466.female=1 ? "Female" : "Male"
	
	$status:=Form:C1466.patient.save()
	
	Form:C1466.patients:=Form:C1466.patients.copy()
	Form:C1466.patients.add(Form:C1466.patient)
	
	Form:C1466.patients:=Form:C1466.patients.orderBy("fullname")
	
	Form:C1466.creation:=False:C215
	
	LISTBOX SET PROPERTY:C1440(*; "LBPatients"; lk selection mode:K53:35; lk single:K53:58)
	
	LISTBOX SELECT ROW:C912(*; "LBPatients"; Form:C1466.patient.indexOf(Form:C1466.patients)+1; lk replace selection:K53:1)
	
	OBJECT SET SCROLL POSITION:C906(*; "LBPatients"; Form:C1466.patient.indexOf(Form:C1466.patients)+1)
	
	OBJECT SET VISIBLE:C603(*; "CancelButton"; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "AsPatient@"; True:C214)
	
	
Else 
	Form:C1466.patient.gender:=Form:C1466.female=1 ? "Female" : "Male"
	$status:=Form:C1466.patient.save()
End if 

OBJECT SET ENABLED:C1123(*; "SearchPat"; True:C214)

