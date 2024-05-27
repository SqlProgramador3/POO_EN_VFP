* /// <summary>
* /// Clase User Controller
* /// </summary>
DEFINE CLASS clUserController as Custom
	oForm = .Null.
	
	PROCEDURE Init(_oForm AS Object)
		This.oForm = _oForm
	ENDPROC

	* /// <summary>
	* /// M�todo IsValidKeyCode: Valida si el c�digo de la tecla es permitido segun el tipo de textbox
	* /// </summary>
	PROTECTED FUNCTION IsValidKeyCode(nKeyCode AS Number, nType AS Number)
		IF nType == 0
			RETURN validateIsNumber(nKeyCode)
		ELSE
			RETURN validateIsName(nKeyCode)
		ENDIF
	ENDFUNC

	* /// <summary>
	* /// Funci�n validateIsNumber: Validar si las teclas estan disponibles para un numero
	* /// </summary>
	HIDDEN FUNCTION validateIsNumber(nKeyCode)
		LOCAL isValid

		isValid = .f.

		* Evaluo el campo
		DO CASE
			CASE nKeyCode >= 48 AND nKeyCode <= 57  && N�meros del 0 al 9
				isValid = .t.
			CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
				isValid = .t.
		ENDCASE

		RETURN isValid
	ENDFUNC

	* /// <summary>
	* /// Funci�n validateIsName: Validar si las teclas estan disponibles para un Nombre
	* /// </summary>
	PROTECTED FUNCTION validateIsName(nKeyCode)
		LOCAL isValid

		isValid = .f.

		*!*	 * Evaluo el campo
		*!*	 DO CASE
		*!*	 	CASE nKeyCode >= 48 AND nKeyCode <= 57  && N�meros del 0 al 9
		*!*	 		isValid = .t.
		*!*	 	CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
		*!*	 		isValid = .t.
		*!*	 ENDCASE

		RETURN isValid
	ENDFUNC
	
	
	* /// <summary>
	* /// Funci�n SetInputMask: Establecer mascara de entrada
	* /// </summary>
	* /// <ParagramList>
	* ///  <Param Name="oTextBox">	Objeto TextBox									</param>
	* ///  <Param Name="nType">		Tipo de TextBox (N�mero == "0" o Texto == "1")	</param>
	* /// </ParagramList>
	* /// <Return Name=""></Return>
	PROTECTED FUNCTION SetInputMask(oTextBox AS Object, nType AS Number)
		IF nType == 0
			oTextBox.InputMask = "9999999999"
		ELSE
			oTextBox.InputMask = ""
		ENDIF
	ENDFUNC
	

	* /// <summary>
	* /// Funci�n ValidateUser: Validar si la informaci�n es correcta
	* /// </summary>
	PROTECTED FUNCTION ValidateUser(oUser AS Object, cValue AS String)
		LOCAL cText
		
		* Si no es NULL
		IF !ISNULL(oUser)
			cText = "Corresponde a:"	+ CHR(13) + ;
			oUser.UserName	+ " " + oUser.UserLastName 
		
		* Si es NULL
		ELSE
			cText = "No existe en la lista"
		ENDIF
		
		* Creo mi mensaje
		cMessage = "La c�dula:" + CHR(13) + ; 
				    cValue + CHR(13) + CHR(13) + ;
				    cText
	        
		RETURN cMessage 
	ENDFUNC

	* /// <summary>
	* /// Funci�n IsEmpty: Valida si esta vacio
	* /// </summary>
	PROTECTED FUNCTION IsEmpty(valueTextBox AS String)
		LOCAL isValid
		
		isValid = .f. && Inicio en Falso
		
		* Si esta vacio
		IF !EMPTY(valueTextBox)
			isValid = .t.
		ENDIF
		
		RETURN isValid
	ENDFUNC

	* /// <summary>
	* /// Funci�n SearchValue: Para buscar el valor enviado por el usuario
	* /// </summary>
	PROTECTED FUNCTION SearchValue(cValue as String)
		LOCAL oUser, i
		
		* Verificar si el Valor est� en la lista
		FOR i = 1 TO This.oUserList.Count
			
			* Usuario
			oUser = This.oUserList.Item(i)
			
			* Si los ID coinciden
			IF oUser.UserId == cValue
				RETURN oUser
			ENDIF
		ENDFOR
	        
		RETURN .NULL.
	ENDFUNC

	* /// <summary>
	* /// Procedimiento SetupProcedures: Manejar la configuraci�n inicial del formulario
	* /// </summary>
	PROCEDURE SetupProcedures()
		SET PROCEDURE TO ;
			"clContainer", ;
			"clLabel", ;
			"clTextbox", ;
			"clConfirmButton", ;
			"clCancelButton", ;
			"clUserList", ;
			"clUser";
		ADDITIVE
	ENDPROC

	* /// <summary>
	* /// Procedimiento CloseSetupProcedures: Manejar los eventos al cerrar el formulario
	* /// </summary>
	PROCEDURE CloseSetupProcedures()
		RELEASE PROCEDURE "clContainer", "clLabel", "clTextbox", "clConfirmButton", "clCancelButton", "clUserList", "clUser"
		
		ThisForm.Release()
	ENDPROC

	* /// <summary>
	* /// Procedimiento HandleError: Maneja errores en tiempo de ejecuci�n
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">		N�mero del error	</param>
	* /// 	<Param Name="cMethod">		Nombre del metodo	</param>
	* /// 	<Param Name="nLine">		N�mero de linea		</param>
	* /// 	<Param Name="cClassName">	Nombre de la clase	</param>
	* /// </ParagramList>
	PROCEDURE HandleError(nError AS Number, cMethod AS String, nLine AS Number, cClassName AS String)
		LOCAL cMessage AS String, cErrorMessage AS String
			
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