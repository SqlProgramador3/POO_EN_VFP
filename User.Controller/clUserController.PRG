* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clUserController.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Class user controller.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clUserController As Custom
	oForm = .Null.
	oContext = .Null.

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	* /// <paragramList>
	* ///       <param Name="oConnection">Object connection to the repository.</param>
	* /// </paragramList>
	PROCEDURE Init(oForm As Object, oConnection As Object)
		This.oForm = oForm
		This.oContext = CREATEOBJECT("clUserContext", oConnection)
	ENDPROC
	
	* /// <summary>
	* /// Get a user.
	* /// </summary>
	PROCEDURE GetUser()
		PRIVATE cValueCedula, oFoundUser
		cValueCedula = AllTRIM(This.oForm.oContainer.oTextBoxCedula.Value)
		oFoundUser = This.SearchUserByCedula(cValueCedula)
	ENDPROC
	
	* /// <summary>
	* /// Search for User with the value sent in the TextBox.
	* /// </summary>
	HIDDEN PROCEDURE SearchUserByCedula( cValue as String )
		LOCAL cQuery, oResult
		cQuery = "EXEC spGetUserByCedula @cedula = '"+ cValue +"';" 
		oResult = This.oContext.GetResultByQuery(cQuery)
		This.SetFullName(oResult)
	ENDFUNC

	* /// <summary>
	* /// Validates if the key code is allowed according to the type of textbox.
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nKeyCode">Key pressed.</param>
	* ///      <param Name="nType">Type of textbox.</param>
	* /// </paragramList>
	PROCEDURE IsValidKeyCode(nKeyCode As Number, nType As Number)
		PRIVATE bIsValid
		
		IF nType == 0
			bIsValid = This.ValidateIsNumber(nKeyCode)
		ELSE
			bIsValid = This.ValidateIsName(nKeyCode)
		ENDIF
		
		This.PrintKeyPress(bIsValid)
	ENDPROC
	
	* /// <summary>
	* /// Validate if it is a number.
	* /// </summary>
	* /// <Return Name="bIsValid">Returns .t. or .f. for validation of a number.</Return>
	HIDDEN FUNCTION ValidateIsNumber(nKeyCode As Number)
		LOCAL bIsValid
		bIsValid = .f.
		DO CASE
			CASE nKeyCode >= 48 AND nKeyCode <= 57
				bIsValid = .t.
			CASE INLIST(nKeyCode, 7, 127, 1, 6, 19, 4, 5, 24)
				bIsValid = .t.
		ENDCASE

		RETURN bIsValid
	ENDFUNC

	* /// <summary>
	* /// Validate if the keys are available for a name.
	* /// </summary>
	* /// <Return Name="bIsValid">Returns .t. or .f. for name validation.</Return>
	HIDDEN FUNCTION ValidateIsName(nKeyCode As Number)
		LOCAL bIsValid

		bIsValid = .t.

		RETURN bIsValid
	ENDFUNC
	
	* /// <summary>
	* /// Allows or does not copy in the input.
	* /// </summary>
	HIDDEN PROCEDURE PrintKeyPress(bIsValid As Boolean)
		IF !bIsValid
			NODEFAULT
		ENDIF
	ENDPROC
	
	* /// <summary>
	* /// Validates if the textbox is empty.
	* /// </summary>
	PROCEDURE IsEmpty(cValue As String)
		IF !EMPTY(cValue)
			This.EnableButton(.t.)
		ELSE 
			This.EnableButton(.f.)
		ENDIF
	ENDPROC
	
	* /// <summary>
	* /// Enable button.
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="bEnabled">Validation if the button is activated or not.</param>
	* /// </paragramList>
	HIDDEN PROCEDURE EnableButton(bEnabled As Boolean)
		This.oForm.oConfirmbutton.Enabled = bEnabled
	ENDPROC
	
	* /// <summary>
	* /// Sets the name of the user in the textbox.
	* /// </summary>
	* /// <paragramList>
	* ///       <param Name="oResult">Object resulting from the query.</param>
	* /// </paragramList>
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
	* /// Handle closing events.
	* /// </summary>
	PROCEDURE CloseForm()
		This.oContext.CloseConnection()
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