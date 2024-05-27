DEFINE CLASS clUser AS Custom
	UserId 		= ""
	UserName    = ""
	UserLastName = ""

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