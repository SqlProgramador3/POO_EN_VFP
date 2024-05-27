* /// <summary>
* /// Clase Contenedor
* /// </summary>
DEFINE CLASS clContainer as Container
	Visible	= .t.
	Width	= 250
	Height 	= 100
	Left		= 25
	Top		= 45

	* /// <summary>
	* /// Procedimiento Init: Inicialización de la clase
	* /// </summary>
	PROCEDURE Init
		*This.AddObject("oTextBoxCedula", "clTextBox", 0)
		*This.AddObject("oTextBoxFullName", "clTextBox", 1)
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