* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clConfirmButton.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Confirm Button class.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clConfirmButton as CommandButton
	Visible	= .t.
	Enabled	= .f.
	Width	= 200
	Height 	= 30
	Left		= 50
	Top		= 155
	Caption 	= "Confirmar"
	MousePointer = 15

	* /// <summary>
	* /// Handles the Click event of the button.
	* /// </summary>
	PROCEDURE Click()
		ThisForm.oController.GetUser()
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