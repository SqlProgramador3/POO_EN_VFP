* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="main.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Initializer class of my project.
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

CREATEOBJECT("main")

DEFINE CLASS main As Custom
	
	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	PROCEDURE Init()
		SET DEFAULT TO ( JUSTPATH( SYS( 16,0 ) ) )

		SET PROCEDURE TO "User.Host\clProgram" ADDITIVE

		oApp = CREATEOBJECT("clProgram")

		RELEASE PROCEDURE "User.Host\clProgram"
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
		DO "User.Host\Extensions\clExceptionHandlerExtension" WITH nError, cMethod, nLine, This.Class
	ENDPROC
ENDDEFINE