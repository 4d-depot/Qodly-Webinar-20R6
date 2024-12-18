Class extends DataClass


exposed Function getNew($type : Text) : cs:C1710.PeopleEntity
	var $p : cs:C1710.PeopleEntity
	
	$p:=This:C1470.new()
	$p.type:=$type
	
	return $p