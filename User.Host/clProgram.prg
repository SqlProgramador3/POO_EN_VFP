* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clProgram.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Initial class
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

return CREATEOBJECT("clProgram")

DEFINE CLASS clProgram AS Custom
	
	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	PROCEDURE Init()
		SET PROCEDURE TO "User.Host\clStarUp" ADDITIVE
		
		CREATEOBJECT("clStarUp")
		
		RELEASE PROCEDURE "User.Host\clStarUp"
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