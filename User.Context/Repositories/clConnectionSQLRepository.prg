* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clConnectionSQLRepository.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// SQL connection class.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clConnectionSQLRepository AS CUSTOM
	oConn = .Null.
	cConnString = .Null.

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	PROCEDURE Init(cConnectionString AS String)
		This.cConnString = cConnectionString
		This.oConn = CREATEOBJECT("ADODB.Connection")
	ENDPROC

	* /// <summary>
	* /// Open the SQL connection.
	* /// </summary>
	* /// <Return Name="This.oConn.State">State when opening the SQL connection.</Return>
	FUNCTION OpenConnection()
		This.oConn.ConnectionString = This.cConnString
		This.oConn.Open()
		
		RETURN This.oConn.State
	ENDFUNC
	
	* /// <summary>
	* /// Closes the SQL connection.
	* /// </summary>
	PROCEDURE CloseConnection()
		This.oConn.Close()
	ENDPROC

	* /// <summary>
	* /// Handle errors at runtime.
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nError">Error number.</param>
	* ///      <param Name="cMethod">Name of the method.</param>
	* ///      <param Name="nLine">Line number.</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		DO clExceptionHandlerExtension WITH nError, cMethod, nLine, This.Class
	ENDPROC
ENDDEFINE