DEFINE CLASS clTextBox as TextBox
	* Propiedades del TextBox
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 25
	Top		= 55
	InputMask = "9999999999"
	
	* M�todo KeyPress: Maneja el evento de tecla presionada
	FUNCTION KeyPress(nKeyCode, nShiftAltCtrl)
		
		* Validar tecla presionada
		IF This.IsValidKeyCode(nKeyCode)
			RETURN .T.
		ELSE 
			NODEFAULT
		ENDIF
	ENDFUNC
	
	* M�todo IsValidKeyCode: Valida si el c�digo de la tecla es permitido
	HIDDEN FUNCTION IsValidKeyCode(nKeyCode AS Number)
		LOCAL isValid
		
		isValid = .f. && Inicio en Falso
		
		* Evaluo el campo
		DO CASE
			CASE nKeyCode >= 48 AND nKeyCode <= 57  && N�meros del 0 al 9
				isValid = .t.
			CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
				isValid = .t.
		ENDCASE

		RETURN isValid
	ENDFUNC
	
	* M�todo LostFocus: Maneja el evento de Perdi� el enfoque
	FUNCTION LostFocus()
		
		* Validar si el campo esta vaci� para habilitar o deshabilitar el boton continuar
		IF This.IsEmpty(This.Value)
			This.oCommandButton.Enabled = .t.
		ELSE
			This.oCommandButton.Enabled = .f.
		ENDIF
	ENDFUNC
	
	* M�todo IsEmpty: Valida si esta vacio
	HIDDEN FUNCTION IsEmpty(valueTextBox AS String)
		LOCAL isValid
		
		isValid = .f. && Inicio en Falso
		
		* Si esta vacio
		IF !EMPTY(valueTextBox)
			isValid = .t.
		ENDIF
		
		RETURN isValid
	ENDFUNC
	
	* M�todo Error: Maneja errores en tiempo de ejecuci�n
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		ThisForm.oHelper.HandleError(nError, cMethod, nLine, "clTextBox")
	ENDFUNC
	
ENDDEFINE