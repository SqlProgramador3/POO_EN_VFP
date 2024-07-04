* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clUserContext.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Class User Context.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clUserContext As Custom
	oConnection = .Null.

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	* /// <paragramList>
	* /// <param Name="oConnection">Object connection to the repository.</param>
	* /// </paragramList>
	PROCEDURE Init(oConnection As Object)
		This.oConnection = oConnection
	ENDPROC
	
	* /// <summary>
	* /// Get the result of a query.
	* /// </summary>
	* /// <paragramList>
	* /// <param Name="cQuery">String with SQL query.</param>
	* /// </paragramList>
	* /// <Return Name="oResult">Returns an object with the result of the query.</Return>
	FUNCTION GetResultByQuery(cQuery AS String)
		PRIVATE oCmd
		LOCAL oResult
		oCmd = CREATEOBJECT("ADODB.Command")
		oCmd.ActiveConnection = This.oConnection.oConn
		oCmd.CommandText = cQuery
		oResult = oCmd.Execute()
		
		RETURN oResult
	ENDFUNC
	
	
	* /// <summary>
	* /// Closes the connection.
	* /// </summary>
	PROCEDURE CloseConnection()
		This.oConnection.CloseConnection()
	ENDPROC
ENDDEFINE