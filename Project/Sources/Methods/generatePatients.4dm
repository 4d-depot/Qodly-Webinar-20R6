//%attributes = {}

var $p : cs:C1710.PeopleEntity
var $patients : cs:C1710.PeopleSelection

var $status : Object
var $coll : Collection

var $fcount; $mcount : Integer

var $myFile : 4D:C1709.File
var $myPhoto : Picture
var $femalePhotoFiles; $malePhotoFiles : Collection
var $fileContent : Text


dropPatients

$fileContent:=File:C1566("/RESOURCES/patients.json").getText("UTF-8")

$coll:=JSON Parse:C1218($fileContent)

$patients:=ds:C1482.People.fromCollection($coll)

$femalePhotoFiles:=Folder:C1567("/RESOURCES/femalefaces/").files()
$malePhotoFiles:=Folder:C1567("/RESOURCES/malefaces/").files()

$fcount:=$femalePhotoFiles.length
$mcount:=$malePhotoFiles.length


For each ($p; $patients)
	
	If ($p.gender="Female")
		$myFile:=$femalePhotoFiles[Random:C100%$fcount]
		READ PICTURE FILE:C678($myFile.platformPath; $myPhoto)
	Else 
		$myFile:=$malePhotoFiles[Random:C100%$mcount]
		READ PICTURE FILE:C678($myFile.platformPath; $myPhoto)
	End if 
	$p.photo:=$myPhoto
	
	$status:=$p.save()
	
End for each 