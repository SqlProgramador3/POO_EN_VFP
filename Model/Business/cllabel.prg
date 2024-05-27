* /// <summary>
* /// Clase Label
* /// </summary>
DEFINE CLASS clLabel as Label 
	Visible	= .t.
	Width	= 230
	Height	= 50
	FontSize	= 12
	Left		= 40
	Top		= 15
	Alignment	= 2
	
	* /// <summary>
	* /// Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="cTitle">Texto para el caption</param>
	* /// </ParagramList>
	PROCEDURE Init
		LPARAMETERS cTitle AS String
		This.Caption = cTitle
	ENDPROC
	
	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">	  N�mero del error			</param>
	* /// 	<Param Name="cMethod">Nombre del Metodo		</param>
	* /// 	<Param Name="nLine">	  N�mero de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE