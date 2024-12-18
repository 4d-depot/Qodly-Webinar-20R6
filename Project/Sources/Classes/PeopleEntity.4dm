Class extends Entity


exposed Function get fullname() : Text
	
	Case of 
			
		: (This:C1470.firstname=Null:C1517)
			If (This:C1470.lastname=Null:C1517)
				return ""
			Else 
				return This:C1470.lastname
			End if 
			
		: (This:C1470.lastname=Null:C1517)
			If (This:C1470.firstname=Null:C1517)
				return ""
			Else 
				return This:C1470.firstname
			End if 
			
		Else 
			return This:C1470.firstname+" "+This:C1470.lastname
			
	End case 
	
	
Function query fullname($event : Object)->$result : Object
	
	var $fullname; $operator; $query : Text
	var $parameters : Collection
	
	$fullname:=$event.value
	$operator:=$event.operator
	
	$parameters:=New collection:C1472($fullname)
	$query:="firstname = :1 or lastname= :1"
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)
	
	
Function orderBy fullname($event : Object)->$result : Text
	If ($event.descending)
		$result:="firstname desc, lastname desc"
	Else 
		$result:="firstname asc, lastname asc"
	End if 
	
	
	//
	// Last appointment for a patient - This = a patient
	//
exposed Function get lastAppAsPatient() : cs:C1710.AppointmentEntity
	
	var $apps : cs:C1710.AppointmentSelection
	
	$apps:=This:C1470.patientApps
	
	If ($apps.length#0)
		return $apps.query("when < :1"; Current date:C33()).orderBy("when desc").first()
	End if 
	
	
	//
	// Next appointment for a patient - This = a patient
	//
exposed Function get nextAppAsPatient() : cs:C1710.AppointmentEntity
	
	var $apps : cs:C1710.AppointmentSelection
	
	$apps:=This:C1470.patientApps
	
	If ($apps.length#0)
		return $apps.query("when >= :1"; Current date:C33()).orderBy("when").first()
	End if 