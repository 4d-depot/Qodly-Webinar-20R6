//%attributes = {"invisible":true}



var $notDropped : cs:C1710.PeopleSelection


$notDropped:=ds:C1482.People.query("type = :1"; "Patient").drop()
