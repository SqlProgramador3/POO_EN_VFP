* /// <summary>
* /// Clase Formulario
* /// </summary>
DEFINE CLASS clForm AS Form
	Caption 	= "Consultar usuario"
	Width	= 300
	Height	= 250
	oController = .Null.
	oConnectionSQL = .Null.

	* /// <summary>
	* /// Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="_oConnectionSQL">	Conexi�n SQL	</param>
	* /// 	<Param Name="_oController">		Controlador	</param>
	* /// </ParagramList>
	PROCEDURE Init(_oController AS Object, _oConnectionSQL AS Object)
		This.oController = _oController
		This.oConnectionSQL = _oConnectionSQL
		This.oController.SetupProcedures()
	ENDPROC

	* /// <summary>
	* /// Procedimiento Destroy: Manejar los eventos al cerrar el formulario
	* /// </summary>
	HIDDEN PROCEDURE Destroy()
		This.oController.CloseSetupProcedures()
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">	N�mero del error		</param>
	* /// 	<Param Name="cMethod">	Nombre del Metodo		</param>
	* /// 	<Param Name="nLine">	N�mero de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE