Class extends Entity


exposed Function get isPast() : Boolean
	
	var $result : Boolean
	
	$result:=This:C1470.when<=Current date:C33()
	
	return $result