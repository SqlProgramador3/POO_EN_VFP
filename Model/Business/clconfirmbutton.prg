* /// <summary>
* /// Clase Boton confirmar
* /// </summary>
DEFINE CLASS clConfirmButton as CommandButton
	Visible	= .t.
	Enabled	= .f.
	Width	= 200
	Height 	= 30
	Left		= 50
	Top		= 155
	Caption 	= "Confirmar"

	* /// <summary>
	* /// Procedimiento Click: Maneja el evento Click del boton
	* /// </summary>
	PROCEDURE Click()

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
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">		Número del error			</param>
	* /// 	<Param Name="cMethod">	Nombre del Metodo			</param>
	* /// 	<Param Name="nLine">		Número de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE