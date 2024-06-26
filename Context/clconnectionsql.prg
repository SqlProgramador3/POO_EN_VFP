* /// <summary>
* /// 		Clase Conexi�n SQL
* /// </summary>
DEFINE CLASS clConnectionSQL AS CUSTOM
	oConn = .Null.
	cConnString = .Null.

	* /// <summary>
	* /// 		Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	PROCEDURE Init(cConnectionString AS String)
		This.cConnString = cConnectionString
		This.oConn = CREATEOBJECT("ADODB.Connection")
	ENDPROC

	* /// <summary>
	* /// 		Funci�n OpenConnection: Abre la conexi�n SQL
	* /// </summary>
	* /// <Return Name="This.oConn.State">Estado al abrir la conexi�n SQL</Return>
	FUNCTION OpenConnection()
		This.oConn.ConnectionString = This.cConnString
		This.oConn.Open()
		
		RETURN This.oConn.State
	ENDFUNC
	
	* /// <summary>
	* /// 		Procedimiento CloseConnection: Cierra la conexi�n SQL
	* /// </summary>
	PROCEDURE CloseConnection()
		This.oConn.Close()
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento Error: Maneja errores en tiempo de ejecuci�n
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nError">	N�mero del error	</param>
	* /// 		<param Name="cMethod">	Nombre del metodo	</param>
	* /// 		<param Name="nLine">	N�mero de linea		</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		LOCAL cMessage, cErrorMessage, cClassName
		
		*Nombre de la clase
		cClassName = This.Class
		
		* Texto de la linea donde ocurre el error
		cErrorMessage = MESSAGE(nError)
		
		* Crear mensaje
		cMessage = ;
			"Error: " + TRANSFORM(nError) + CHR(13) + ; 		&& N�mero de error
			"Clase: " + cClassName + CHR(13) + ;				&& Nombre de la clase
			"M�todo: " + cMethod + CHR(13) + ;				&& Metodo donde ocurre
			"L�nea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de c�digo
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE