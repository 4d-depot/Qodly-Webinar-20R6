



var $text : Text

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		Form:C1466.searchPat:=""
		
		
	: (Form event code:C388=On After Keystroke:K2:26)
		
		$text:=Get edited text:C655
		
		Form:C1466.patients:=Form:C1466.mainPatients.search($text)
		
End case 
