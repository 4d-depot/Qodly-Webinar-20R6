//%attributes = {"invisible":true}


var $patients; $doctors : cs:C1710.PeopleSelection
var $p : cs:C1710.PeopleEntity
var $yearOffSet; $dayOffSet : Integer
var $day : Integer

var $app : cs:C1710.AppointmentEntity

var $status : Object

$patients:=ds:C1482.People.query("type = :1"; "Patient")
$doctors:=ds:C1482.People.query("type = :1"; "Doctor")

var $hours:=New collection:C1472(?10:00:00?; ?11:00:00?; ?12:00:00?; ?13:00:00?; ?14:00:00?; ?15:00:00?; ?16:00:00?; ?17:00:00?; ?18:00:00?; ?19:00:00?; ?20:00:00?)


dropAppointments


For each ($p; $patients)
	$app:=ds:C1482.Appointment.new()
	$app.doctor:=$doctors[Random:C100%$doctors.length]
	$app.patient:=$p
	
	$yearOffSet:=(Random:C100%2)+1
	$dayOffSet:=(Random:C100%21)+5
	
	//Generate appointment in the past
	$app.when:=Add to date:C393(Current date:C33(); -$yearOffSet; 0; -$dayOffSet)
	$app.whatTime:=$hours[Random:C100%$hours.length]
	
	$status:=$app.save()
End for each 


For each ($p; $patients.slice(20; 30))
	$app:=ds:C1482.Appointment.new()
	$app.doctor:=$doctors[Random:C100%$doctors.length]
	$app.patient:=$p
	
	$day:=Day of:C23(Current date:C33)+1
	
	$dayOffSet:=(Random:C100%(31-$day))+1
	
	//Generate appointment this month
	$app.when:=Add to date:C393(Current date:C33(); 0; 0; $dayOffSet)
	$app.whatTime:=$hours[Random:C100%$hours.length]
	$status:=$app.save()
End for each 


For each ($p; $patients.slice(10; 20))
	$app:=ds:C1482.Appointment.new()
	$app.doctor:=$doctors[Random:C100%$doctors.length]
	$app.patient:=$p
	
	$day:=Day of:C23(Current date:C33)
	
	//Generate appointment next month
	$app.when:=Add to date:C393(Current date:C33(); 0; 1; -(Random:C100%$day+1))
	$app.whatTime:=$hours[Random:C100%$hours.length]
	$status:=$app.save()
End for each 

For each ($p; $patients.slice(0; 7))
	$app:=ds:C1482.Appointment.new()
	$app.doctor:=$doctors[Random:C100%$doctors.length]
	$app.patient:=$p
	
	$day:=Day of:C23(Current date:C33)-1
	
	//Generate appointment next month + 2
	$app.when:=Add to date:C393(Current date:C33(); 0; 2; -(Random:C100%$day+1))
	$app.whatTime:=$hours[Random:C100%$hours.length]
	$status:=$app.save()
End for each 
