* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clUserForm.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Form user class
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clUserForm AS Form
	Caption 		= "Usuario"
	Width		= 300
	Height		= 250
	oController 	= .Null.

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	* /// <paragramList>
	* /// <param Name="oConnection">Object connection to the repository.</param>
	* /// </paragramList>
	PROCEDURE Init(oConnection As Object)
		This.SetupProcedures()
		This.oController = CREATEOBJECT("clUserController", This, oConnection)
		This.AddObject("oLabel", "clLabel", "Consultar Usuario")
		This.AddObject("oContainer", "clContainer")
		This.AddObject("oConfirmbutton", "clConfirmButton")
		This.AddObject("oCancelButton", "clCancelButton")
	
		This.Show(1)
	ENDPROC

	* /// <summary>
	* /// Configuration procedures.
	* /// </summary>
	PROCEDURE SetupProcedures()
		SET PROCEDURE TO "clContainer", "clLabel", "clTextbox", "clConfirmButton", "clCancelButton", "clUserController", "clUserContext" ADDITIVE
	ENDPROC
	
	* /// <summary>
	* /// Close configuration procedures.
	* /// </summary>
	PROCEDURE CloseSetupProcedures()
		RELEASE PROCEDURE "clContainer", "clLabel", "clTextbox", "clConfirmButton", "clCancelButton", "clUserController", "clUserContext"
		Thisform.Hide()
		Thisform.Release()
	ENDPROC

	* /// <summary>
	* /// Handle errors at runtime.
	* /// </summary>
	* /// <paragramList>
	* /// <paragramList>
	* ///      <param Name="nError">Error number.</param>
	* ///      <param Name="cMethod">Name of the method.</param>
	* ///      <param Name="nLine">Line number.</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		DO clExceptionHandlerExtension WITH nError, cMethod, nLine, This.Class
	ENDPROC
ENDDEFINE