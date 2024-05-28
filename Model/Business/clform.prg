* /// <summary>
* /// Clase Formulario
* /// </summary>
DEFINE CLASS clForm AS Form
	Caption 		= "Usuario"
	Width		= 300
	Height		= 250
	oController 	= .Null.

	* /// <summary>
	* /// Procedimiento Init: Inicialización de la clase
	* /// </summary>
	* /// <paragramList>
	* /// 	<param Name="_oController">		Controlador	</param>
	* /// </paragramList>
	PROCEDURE Init(_oController AS Object)
		This.oController = _oController		&& Asigna el controlador 
		This.oController.oForm = This		&& Establece referencia del formulario en el controlador
		This.oController.SetupProcedures()	&& Configura los procedimientos.
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <paragramList>
	* /// 	<param Name="nError">	Número del error		</param>
	* /// 	<param Name="cMethod">	Nombre del Metodo		</param>
	* /// 	<param Name="nLine">	Número de la linea del error	</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE