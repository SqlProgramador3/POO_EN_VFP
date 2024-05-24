DEFINE CLASS clCommandButtonConfirm as CommandButton
	* Propiedades del CommandButton
	Visible	= .t.
	Enabled	= .f.
	Width	= 200
	Height 	= 30
	Left		= 25
	Top		= 105
	Caption 	= "Confirmar"
	
	* Método Click: Maneja el evento Click
	FUNCTION Click()
		ThisForm.oUserController.
		PRIVATE oUser, cValue, cMessage, cText
		
		* Valor del TextBox
		cValue = RTRIM(This.oTextBox.Value)
	
		* Usuario buscado
		oFoundUser = This.SearchValue(cValue)
		
		* Validar Información para el mensaje
		cMessage = This.ValidateUser(oFoundUser, cValue)
		
		* Crear Mensaje
		MESSAGEBOX(cMessage, 64, "Estado de la consulta")
	ENDFUNC
	
	
	
	

	* Método Error: Maneja errores en tiempo de ejecución
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		ThisForm.oHelper.HandleError(nError, cMethod, nLine, "clCommandButtonConfirm")
	ENDFUNC
ENDDEFINE