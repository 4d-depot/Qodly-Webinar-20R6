Class extends DataClass




exposed Function appsStatistics() : Object
	
	var $result:={options: {xaxis: {categories: ["Current month"; "Month +1"; "Month +2"]}}}
	var $formula : Object
	var $currentMonthApps; $appsMonth1; $appsMonth2 : cs:C1710.AppointmentSelection
	var $date : Date
	
	
	$formula:=Formula:C1597((Month of:C24(This:C1470.when)=Month of:C24(Current date:C33)) & (Year of:C25(This:C1470.when)=Year of:C25(Current date:C33)))
	$currentMonthApps:=ds:C1482.Appointment.query($formula)
	
	
	$date:=Add to date:C393(Current date:C33(); 0; 1; 0)
	$formula:=Formula:C1597((Month of:C24(This:C1470.when)=Month of:C24($date)) & (Year of:C25(This:C1470.when)=Year of:C25($date)))
	$appsMonth1:=ds:C1482.Appointment.query($formula)
	
	
	$date:=Add to date:C393(Current date:C33(); 0; 2; 0)
	$formula:=Formula:C1597((Month of:C24(This:C1470.when)=Month of:C24($date)) & (Year of:C25(This:C1470.when)=Year of:C25($date)))
	$appsMonth2:=ds:C1482.Appointment.query($formula)
	
	$result.series:=[{name: "Appointments"; data: [$currentMonthApps.length; $appsMonth1.length; $appsMonth2.length]}]
	
	
	return $result
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//exposed Function appsStatistic_init() : Collection
	
	//var $result:=New collection()
	//var $formula : Object
	//var $currentMonthApps; $appsMonth1; $appsMonth2 : cs.AppointmentSelection
	
	
	//$formula:=Formula((Month of(This.when)=Month of(Current date)) & (Year of(This.when)=Year of(Current date)))
	//$currentMonthApps:=ds.Appointment.query($formula)
	
	//$formula:=Formula((Month of(This.when)=(Month of(Current date)+1)) & (Year of(This.when)=Year of(Current date)))
	//$appsMonth1:=ds.Appointment.query($formula)
	
	//$formula:=Formula((Month of(This.when)=(Month of(Current date)+2)) & (Year of(This.when)=Year of(Current date)))
	//$appsMonth2:=ds.Appointment.query($formula)
	
	//$result.push({x: "Current month"; y: $currentMonthApps.length})
	//$result.push({x: "Month +1"; y: $appsMonth1.length})
	//$result.push({x: "Month +2"; y: $appsMonth2.length})
	
	//return $result
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
Function event restrict() : cs:C1710.AppointmentSelection
	
	var $result : cs:C1710.AppointmentSelection
	
	$result:=Null:C1517
	
	If (Session:C1714#Null:C1517)
		
		If (Session:C1714.storage.role#Null:C1517)
			
			If ((Session:C1714.storage.role.name="Patient") || (Session:C1714.storage.role.name="Doctor"))
				$result:=Session:C1714.storage.myApps
			End if 
		End if 
	End if 
	
	return $result
	
	
exposed Function search($search : Text; $withPast : Boolean) : cs:C1710.AppointmentSelection
	
	$search:="@"+$search+"@"
	
	If ($withPast)
		return This:C1470.query("patient.fullname = :1 or doctor.fullname = :1"; $search).orderBy("when")
	Else 
		return This:C1470.query("(patient.fullname = :1 or doctor.fullname = :1) and when >= :2"; $search; Current date:C33()).orderBy("when")
	End if 
	
	
	
exposed Function selectApp() : cs:C1710.AppointmentEntity
	return This:C1470.get(Session:C1714.storage.selectedApp.ID)
	