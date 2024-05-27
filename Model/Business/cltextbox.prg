* /// <summary>
* /// Clase TextBox
* /// </summary>
DEFINE CLASS clTextBox as TextBox
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 25
	Top		= 55
	*InputMask = "9999999999"
	TypeTextBox = .Null.
	
	* /// <summary>
	* /// Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nType">Tipo de input (N�mero == "0" o Texto == "1")</param>
	* /// </ParagramList>
	PROCEDURE Init()
		LPARAMETERS nType AS Number
		This.TypeTextBox = nType
		ThisForm.oController.SetInputMask(This, nType)
	ENDPROC

	* /// <summary>
	* /// Procedimiento KeyPress: Maneja el evento de tecla presionada
	* /// </summary>
	PROCEDURE KeyPress(nKeyCode, nShiftAltCtrl)
		IF ThisForm.oController.IsValidKeyCode(nKeyCode, This.TypeTextBox)
			RETURN .T.
		ELSE 
			NODEFAULT
		ENDIF
	ENDPROC

	* /// <summary>
	* /// Procedimiento LostFocus: Maneja el evento de Perdi� el enfoque
	* /// </summary>
	PROCEDURE LostFocus()
		
		* Validar si el campo esta vaci� para habilitar o deshabilitar el boton continuar
		IF ThisForm.oController.IsEmpty(This.Value)
			This.oCommandButton.Enabled = .t.
		ELSE
			This.oCommandButton.Enabled = .f.
		ENDIF
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">		N�mero del error			</param>
	* /// 	<Param Name="cMethod">	Nombre del Metodo			</param>
	* /// 	<Param Name="nLine">		N�mero de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE