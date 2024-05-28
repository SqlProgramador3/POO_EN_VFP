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
		This.AddObject(;
			"oTextBoxCedula", ;	&& Nombre
			"clTextBox", ;		&& Nombre de la clase referenciada
			15, ;				&& Top
			0, ;				&& Tipo
			"9999999999", ;		&& InputMask
			.t.;				&& Activo - Inactivo
		)
		This.AddObject(;
			"oTextBoxFullName", ; && Nombre
			"clTextBox", ;		&& Nombre de la clase referenciada
			55, ;				&& Top
			1, ;				&& Tipo
			"", ;				&& InputMask
			.f.;				&& Activo - Inactivo
		)
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <paragramList>
	* /// 	<param Name="nError">		Número del error			</param>
	* /// 	<param Name="cMethod">	Nombre del Metodo			</param>
	* /// 	<param Name="nLine">		Número de la linea del error	</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE