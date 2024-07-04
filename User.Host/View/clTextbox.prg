* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clTextBox.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// TextBox class.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clTextBox as TextBox
	Alignment = 2
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 25
	TypeTextBox = .Null.
	
	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nTop">Texbox Height.</param>
	* ///      <param Name="nType">Type of TextBox (Number = "0" or Text = "1").</param>
	* ///      <param Name="cInputMask">Input mask.</param>
	* ///      <param Name="bIsEnabled">Enabled or Disabled.</param>
	* /// </paragramList>
	PROCEDURE Init( nTop As Number, nType AS Number, cInputMask AS String, bIsEnabled AS Boolean )
		This.Top 		= nTop
		This.InputMask 	= cInputMask
		This.Enabled 	= bIsEnabled
		This.TypeTextBox = nType
	ENDPROC

	* /// <summary>
	* /// KeyPress Procedure: Handles the key pressed event.
	* /// </summary>
	PROCEDURE KeyPress( nKeyCode AS Number, nShiftAltCtrl AS Number )
		ThisForm.oController.IsValidKeyCode(nKeyCode, This.TypeTextBox)
	ENDPROC

	* /// <summary>
	* /// Procedure LostFocus: Handles the Lost Focus event.
	* /// </summary>
	PROCEDURE LostFocus()		
		ThisForm.oController.IsEmpty(This.Value)
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