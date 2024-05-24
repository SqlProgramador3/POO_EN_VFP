* /// <summary>
* /// Clase User Controller
* /// </summary>
DEFINE CLASS userController as Custom
	PROCEDURE Init()
		
	ENDPROC

	* /// <summary>
	* /// Método IsValidKeyCode: Valida si el código de la tecla es permitido segun el tipo de textbox
	* /// </summary>
	PRIVATE FUNCTION IsValidKeyCode(nKeyCode AS Number, nType AS Number)
		IF nType == 0
			RETURN validateIsNumber(nKeyCode)
		ELSE
			RETURN validateIsName(nKeyCode)
		ENDIF
	ENDFUNC

	* /// <summary>
	* /// Función validateIsNumber: Validar si las teclas estan disponibles para un numero
	* /// </summary>
	HIDDEN FUNCTION validateIsNumber(nKeyCode)
		LOCAL isValid

		isValid = .f.

		* Evaluo el campo
		DO CASE
			CASE nKeyCode >= 48 AND nKeyCode <= 57  && Números del 0 al 9
				isValid = .t.
			CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
				isValid = .t.
		ENDCASE

		RETURN isValid
	ENDFUNC

	* /// <summary>
	* /// Función validateIsName: Validar si las teclas estan disponibles para un Nombre
	* /// </summary>
	HIDDEN FUNCTION validateIsName(nKeyCode)
		LOCAL isValid

		isValid = .f.

		*!*	 * Evaluo el campo
		*!*	 DO CASE
		*!*	 	CASE nKeyCode >= 48 AND nKeyCode <= 57  && Números del 0 al 9
		*!*	 		isValid = .t.
		*!*	 	CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)  && Otras teclas permitidas
		*!*	 		isValid = .t.
		*!*	 ENDCASE

		RETURN isValid
	ENDFUNC
	

	* /// <summary>
	* /// Función ValidateUser: Validar si la información es correcta
	* /// </summary>
	PRIVATE FUNCTION ValidateUser(oUser AS Object, cValue AS String)
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
		cMessage = "La cédula:" + CHR(13) + ; 
				    cValue + CHR(13) + CHR(13) + ;
				    cText
	        
		RETURN cMessage 
	ENDFUNC

	* /// <summary>
	* /// Función IsEmpty: Valida si esta vacio
	* /// </summary>
	PRIVATE FUNCTION IsEmpty(valueTextBox AS String)
		LOCAL isValid
		
		isValid = .f. && Inicio en Falso
		
		* Si esta vacio
		IF !EMPTY(valueTextBox)
			isValid = .t.
		ENDIF
		
		RETURN isValid
	ENDFUNC

	* /// <summary>
	* /// Función SearchValue: Para buscar el valor enviado por el usuario
	* /// </summary>
	PRIVATE FUNCTION SearchValue(cValue as String)
		LOCAL oUser, i
		
		* Verificar si el Valor está en la lista
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
	* /// Procedimiento SetupProcedures: Manejar la configuración inicial
	* /// </summary>
	PRIVATE PROCEDURE SetupProcedures()
		SET PROCEDURE TO "clContainer" ADDITIVE
		SET PROCEDURE TO "clLabel" ADDITIVE
		SET PROCEDURE TO "clTextbox" ADDITIVE
		SET PROCEDURE TO "clCommandButtonConfirm" ADDITIVE
		SET PROCEDURE TO "clCancelButton" ADDITIVE
		SET PROCEDURE TO "clUserList" ADDITIVE
		SET PROCEDURE TO "clUser" ADDITIVE
		SET PROCEDURE TO "clError" ADDITIVE
	ENDPROC

	* /// <summary>
	* /// Procedimiento CloseSetupProcedures: Manejar los eventos al cerrar el formulario
	* /// </summary>
	PRIVATE PROCEDURE CloseSetupProcedures()
		SET PROCEDURE TO "clContainer" ADDITIVE
		SET PROCEDURE TO "clLabel" ADDITIVE
		SET PROCEDURE TO "clTextbox" ADDITIVE
		SET PROCEDURE TO "clCommandButtonConfirm" ADDITIVE
		SET PROCEDURE TO "clCommandButtonCancel" ADDITIVE
		SET PROCEDURE TO "clUserList" ADDITIVE
		SET PROCEDURE TO "clUser" ADDITIVE
		SET PROCEDURE TO "clError" ADDITIVE

		ThisForm.Release()
	ENDPROC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores en tiempo de ejecución
	* /// </summary>
	PRIVATE PROCEDURE HandleError(nError AS Number, cMethod AS String, nLine AS Number, cClassName AS String)
		LOCAL cMessage, cErrorMessage
			
			* Texto de la linea donde ocurre el error
			cErrorMessage = MESSAGE(nError)
			
			* Crear mensaje
			cMessage = "Error: " + TRANSFORM(nError) + CHR(13) + ; 	&& Número de error
			"Clase: " + cClassName + CHR(13) + ;				&& Nombre de la clase
			"Método: " + cMethod + CHR(13) + ;					&& Metodo donde ocurre
			"Línea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de código
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE