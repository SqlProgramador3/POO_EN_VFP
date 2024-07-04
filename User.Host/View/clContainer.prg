* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clContainer.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Container class.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clContainer as Container
	Visible	= .t.
	Width	= 250
	Height 	= 100
	Left		= 25
	Top		= 45

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	PROCEDURE Init
		This.AddObject("oTextBoxCedula", "clTextBox", 15, 0, "9999999999", .t.)
		This.AddObject("oTextBoxFullName", "clTextBox", 55, 1, "", .f.)
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