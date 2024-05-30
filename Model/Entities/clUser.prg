* /// <summary>
* ///      Clase Usuario
* /// </summary>
DEFINE CLASS clUser AS Custom
	IdUser 	= 0
	Cedula    	= ""
	FullName 	= ""
	
	* /// <summary>
	* /// 		Procedimiento Init: Inicialización de la clase
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nId">ID del usuario</param>
	* ///      <param Name="cCedula">Número de cedula</param>
	* ///      <param Name="cFullName">Nombre completo</param>
	* /// </paragramList>
	PROCEDURE Init(nId AS Number, cCedula AS String, cFullName AS String)
		This.IdUser	= nId
		This.Cedula	= cCedula
		This.FullName	= cFullName
	ENDPROC
	
	* /// <summary>
	* /// 		Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nError">		Número del error			</param>
	* /// 		<param Name="cMethod">	Nombre del Metodo			</param>
	* /// 		<param Name="nLine">		Número de la linea del error	</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE