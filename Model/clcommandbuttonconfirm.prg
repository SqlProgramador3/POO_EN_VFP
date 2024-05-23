DEFINE CLASS clCommandButtonConfirm as CommandButton
	* Propiedades del CommandButton
	Visible	= .t.
	Enabled	= .f.
	Width	= 200
	Height 	= 30
	Left		= 25
	Top		= 105
	Caption 	= "Confirmar"
	
	* M�todo Click: Maneja el evento Click
	FUNCTION Click()
		PRIVATE oUser, cValue, cMessage, cText
		
		* Valor del TextBox
		cValue = RTRIM(This.oTextBox.Value)
	
		* Usuario buscado
		oFoundUser = This.SearchValue(cValue)
		
		* Validar Informaci�n para el mensaje
		cMessage = This.ValidateUser(oFoundUser, cValue)
		
		* Crear Mensaje
		MESSAGEBOX(cMessage, 64, "Estado de la consulta")
	ENDFUNC
	
	* M�todo SearchValue: Para buscar el valor enviado por el usuario
	HIDDEN FUNCTION SearchValue(cValue as String)
		LOCAL oUser, i
		
		* Verificar si el Valor est� en la lista
		FOR i = 1 TO This.oUserList.Count
			
			* Usuario
			oUser = This.oUserList.Item(i)
			
			* Si los ID coinciden
			IF oUser.UserId == cValue
				RETURN oUser
			ENDIF
		ENDFOR
	        
	        RETURN .NULL.
	ENDFUNC
	
	* M�todo ValidateUser: Validar si la informaci�n es correcta
	HIDDEN FUNCTION ValidateUser(oUser AS Object, cValue AS String)
		LOCAL cText
		
		* Si no es NULL
		IF !ISNULL(oUser)
			cText = "Corresponde a:"	+ CHR(13) + ;
				      oUser.UserName	+ " " + oUser.UserLastName 
		
		* Si es NULL
		ELSE
			cText = "No existe en la lista"
		ENDIF
		
		* Creo mi mensaje
		cMessage = "La c�dula:" + CHR(13) + ; 
				    cValue + CHR(13) + CHR(13) + ;
				    cText
	        
	        RETURN cMessage 
	ENDFUNC

	* M�todo Error: Maneja errores en tiempo de ejecuci�n
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		ThisForm.oHelper.HandleError(nError, cMethod, nLine, "clCommandButtonConfirm")
	ENDFUNC
ENDDEFINE