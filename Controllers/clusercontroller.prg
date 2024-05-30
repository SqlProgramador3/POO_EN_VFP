* /// <summary>
* /// Clase User Controller
* /// </summary>
DEFINE CLASS clUserController as Custom
	oForm = .Null.
	oConnection = .Null.
	oErrorController = .Null.

	* /// <summary>
	* /// 		Procedimiento Init: Inicialización de la clase
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="_oConnection">Conexión a la base de datos</param>
	* /// 		<param Name="_oErrorController">Controlador de errores</param>
	* /// </paragramList>
	PROCEDURE Init( _oConnection AS Object, _oErrorController AS Object )
		This.oConnection = _oConnection
		This.oErrorController = _oErrorController
	ENDPROC

	* /// <summary>
	* /// Método IsValidKeyCode: Valida si el código de la tecla es permitido segun el tipo de textbox
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nKeyCode">	Tecla presionada</param>
	* /// 		<param Name="nType">	Tipo de textbox	</param>
	* /// </paragramList>
	PROCEDURE IsValidKeyCode( nKeyCode AS Number, nType AS Number )
		PRIVATE bIsValid
		
		IF nType == 0
			bIsValid = This.ValidateIsNumber( nKeyCode )
		ELSE
			bIsValid = This.ValidateIsName( nKeyCode )
		ENDIF
		
		This.PrintKeyPress( bIsValid )
	ENDPROC
	
	* /// <summary>
	* /// 		Función ValidateIsNumber: Validar si es número
	* /// </summary>
	* /// <Return Name="bIsValid">Retorna .t. o .f. para la validación de un número</Return>
	HIDDEN FUNCTION ValidateIsNumber( nKeyCode As Number )
		LOCAL bIsValid

		bIsValid = .f.

		* Evaluo el campo
		DO CASE
			CASE nKeyCode >= 48 AND nKeyCode <= 57  && Números del 0 al 9
			
			bIsValid = .t.
				
			CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
			
			bIsValid = .t.
				
		ENDCASE

		RETURN bIsValid
	ENDFUNC

	* /// <summary>
	* /// 		Función ValidateIsName: Validar si las teclas estan disponibles para un Nombre
	* /// </summary>
	* /// <Return Name="bIsValid">Retorna .t. o .f. para la validación de un número</Return>
	HIDDEN FUNCTION ValidateIsName( nKeyCode AS Number )
		LOCAL bIsValid

		bIsValid = .t.

		*!*	 * Evaluo el campo
		*!*	 DO CASE
		*!*	 	CASE nKeyCode >= 48 AND nKeyCode <= 57  && Números del 0 al 9
		*!*	 		bIsValid = .t.
		*!*	 	CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
		*!*	 		bIsValid = .t.
		*!*	 ENDCASE

		RETURN bIsValid
	ENDFUNC
	
	* /// <summary>
	* /// 		Procedimiento PrintKeyPress: permite o no copiar en el input
	* /// </summary>
	HIDDEN PROCEDURE PrintKeyPress(bIsValid AS Boolean)
		IF !bIsValid
			NODEFAULT
		ENDIF
	ENDPROC
	
	* /// <summary>
	* /// 		Procedimiento IsEmpty: Valida si esta vacio el textbox
	* /// </summary>
	PROCEDURE IsEmpty(cValue AS String)
		* Si no esta vacio
		IF !EMPTY(cValue)
			This.EnableButton( .t. )
		ELSE 
			This.EnableButton( .f. )
		ENDIF
	ENDPROC
	
	* /// <summary>
	* /// 		Procedimiento EnableButton: Habilitar boton
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="bEnabled">Validación si se activa o no el boton</param>
	* /// </paragramList>
	HIDDEN PROCEDURE EnableButton(bEnabled  AS Boolean)
		This.oForm.oConfirmbutton.Enabled = bEnabled
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento GetUser: Obtener un usuario
	* /// </summary>
	PROCEDURE GetUser()
		PRIVATE cValueCedula, oFoundUser
		
		cValueCedula = RTRIM( This.oForm.oContainer.oTextBoxCedula.Value )
		
		oFoundUser = This.SearchUserByCedula( cValueCedula )
	ENDPROC

	* /// <summary>
	* /// 		Función SearchUserByCedula: Buscar Usuario con el valor enviado por el usuario
	* /// </summary>
	HIDDEN FUNCTION SearchUserByCedula( cValue as String )
		LOCAL cQuery, oResult
		
		cQuery = "EXEC spGetUserByCedula @cedula = '"+ cValue +"';" 
		
		oResult = This.GetResultByQuery( cQuery )
		
		This.SetFullName( oResult )
	ENDFUNC
	
	* /// <summary>
	* /// 		Función GetResultByQuery: Obtener el resultado de una consulta
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="cQuery">String con consulta SQL</param>
	* /// </paragramList>
	* /// <Return Name="oResult">Retorna un objecto con el resultado de la consulta</Return>
	HIDDEN FUNCTION GetResultByQuery( cQuery AS String )
		LOCAL oCmd
		
		oCmd = CREATEOBJECT("ADODB.Command")
		
		oCmd.ActiveConnection = This.oConnection.oConn
		
		oCmd.CommandText = cQuery
		
		oResult = oCmd.Execute()
		
		RETURN oResult
	ENDFUNC
	
	* /// <summary>
	* /// 		Procedimiento SetFullName: Establece el nombre del usuario en el textbos
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="oResult"></param>
	* /// </paragramList>
	* /// <Return Name=""></Return>
	HIDDEN PROCEDURE SetFullName(oResult AS Object)
		LOCAL cFullName
		
		IF NOT oResult.EOF
			cFullName	= oResult.Fields(0).value
		ELSE
			cFullName	= "No se encontraron resultados."
		ENDIF
		
		This.oForm.oContainer.oTextBoxFullName.Value = cFullName
	ENDFUNC

	* /// <summary>
	* /// 		Procedimiento SetupProcedures: Manejar la configuración inicial
	* /// </summary>
	PROCEDURE SetupProcedures()
		SET PROCEDURE TO ;
			"clContainer", ;
			"clLabel", ;
			"clTextbox", ;
			"clConfirmButton", ;
			"clCancelButton", ;
			"clUser";
		ADDITIVE
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento CloseSetupProcedures: Manejar los eventos al cerrar
	* /// </summary>
	PROCEDURE CloseSetupProcedures()
		RELEASE PROCEDURE ;
			"clContainer", ;
			"clLabel", ;
			"clTextbox", ;
			"clConfirmButton", ;
			"clCancelButton", ;
			"clUser"
		This.oConnection.CloseConnection()
		This.oForm.Release()
	ENDPROC
	
	* /// <summary>
	* /// 		Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nError">	Número del error			</param>
	* /// 		param Name="cMethod">	Nombre del Metodo			</param>
	* /// 		<param Name="nLine">	Número de la linea del error</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		This.oErrorController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE