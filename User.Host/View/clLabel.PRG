* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clLabel.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Label class.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

DEFINE CLASS clLabel as Label 
	Visible	= .t.
	Width	= 230
	Height	= 50
	FontSize	= 12
	Left		= 40
	Top		= 15
	Alignment	= 2
	
	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="cTitle">Text for the caption.</param>
	* /// </paragramList>
	PROCEDURE Init( cTitle AS Strign )
		This.Caption = cTitle
	ENDPROC
ENDDEFINE