* /// <summary>
* /// Clase TextBox
* /// </summary>
DEFINE CLASS clTextBox as TextBox
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left	= 25
	Top		= 55
	InputMask = "9999999999"
	
    * /// <summary>
    * /// Procedimiento KeyPress: Maneja el evento de tecla presionada
    * /// </summary>
	PROCEDURE KeyPress(nKeyCode, nShiftAltCtrl)
		IF ThisForm.oUserController.IsValidKeyCode(nKeyCode, This.Type)
			RETURN .T.
		ELSE 
			NODEFAULT
		ENDIF
	ENDPROC
	
    * /// <summary>
    * /// Procedimiento LostFocus: Maneja el evento de Perdió el enfoque
    * /// </summary>
	PROCEDURE LostFocus()
		
		* Validar si el campo esta vació para habilitar o deshabilitar el boton continuar
		IF This.IsEmpty(This.Value)
			This.oCommandButton.Enabled = .t.
		ELSE
			This.oCommandButton.Enabled = .f.
		ENDIF
	ENDPROC
	
	* /// <summary>
    * /// Procedimiento Error: Maneja errores
    * /// </summary>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
        ThisForm.oUserController.HandleError(nError, cMethod, nLine, "clTextBox")
	ENDPROC
	
ENDDEFINE