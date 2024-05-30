* /// <summary>
* /// 		Clase TextBox
* /// </summary>
DEFINE CLASS clTextBox as TextBox
	Alignment = 2
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 25
	TypeTextBox = .Null.
	
	* /// <summary>
	* /// 		Procedimiento Init: Inicialización de la clase
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nTop">Altura del Texbox</param>
	* /// 		<param Name="nType">Tipo de TextBox (Número = "0" o Texto = "1")</param>
	* /// 		<param Name="cInputMask">Mascara del input</param>
	* /// 		<param Name="bIsEnabled">Habilitado o Deshabilitado</param>
	* /// </paragramList>
	PROCEDURE Init( nTop As Number, nType AS Number, cInputMask AS Number, bIsEnabled AS Boolean )
		This.Top 		= nTop
		This.InputMask 	= cInputMask
		This.Enabled 	= bIsEnabled
		This.TypeTextBox = nType
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento KeyPress: Maneja el evento de tecla presionada
	* /// </summary>
	PROCEDURE KeyPress( nKeyCode AS Number, nShiftAltCtrl AS Number )
		ThisForm.oController.IsValidKeyCode(nKeyCode, This.TypeTextBox)
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento LostFocus: Maneja el evento Perdió el enfoque
	* /// </summary>
	PROCEDURE LostFocus()		
		ThisForm.oController.IsEmpty(This.Value)
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nError">		Número del error			</param>
	* /// 		<param Name="cMethod">	Nombre del Metodo			</param>
	* /// 		<param Name="nLine">		Número de la linea del error	</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE