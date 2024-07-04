* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clCancelButton.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Cancel Button class
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clCancelButton as CommandButton
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 50
	Top		= 195
	Caption 	= "Cerrar Formulario"
	MousePointer = 15

	* /// <summary>
	* /// Handles the Click event of the button
	* /// </summary>
	PROCEDURE Click()
		ThisForm.oController.CloseForm()
		ThisForm.CloseSetupProcedures()
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