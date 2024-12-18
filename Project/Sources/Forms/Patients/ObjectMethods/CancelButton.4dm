

LISTBOX SET PROPERTY:C1440(*; "LBPatients"; lk selection mode:K53:35; lk single:K53:58)
LISTBOX SELECT ROW:C912(*; "LBPatients"; 1; lk replace selection:K53:1)

Form:C1466.patients:=Form:C1466.mainPatients

Form:C1466.searchPat:=""
OBJECT SET ENABLED:C1123(*; "SearchPat"; True:C214)

OBJECT SET VISIBLE:C603(*; "CancelButton"; False:C215)

OBJECT SET VISIBLE:C603(*; "AsPatient@"; True:C214)

Form:C1466.creation:=False:C215

