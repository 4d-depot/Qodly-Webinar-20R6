Class extends EntitySelection



exposed Function search($search : Text) : cs:C1710.PeopleSelection
	
	$search:="@"+$search+"@"
	
	return This:C1470.query("fullname = :1"; $search)
	
	
	