

Form:C1466.patient:=Form:C1466.ds.People.getNew("Patient")

Form:C1466.female:=1
Form:C1466.male:=0

Form:C1466.creation:=True:C214


OBJECT SET VISIBLE:C603(*; "CancelButton"; True:C214)

OBJECT SET VISIBLE:C603(*; "AsPatient@"; False:C215)

OBJECT SET ENABLED:C1123(*; "SearchPat"; False:C215)

//Disable the listbox
LISTBOX SELECT ROWS:C1715(*; "LBPatients"; Form:C1466.ds.People.newSelection(); lk replace selection:K53:1)

LISTBOX SET PROPERTY:C1440(*; "LBPatients"; lk selection mode:K53:35; lk none:K53:57)

