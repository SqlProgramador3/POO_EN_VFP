* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="clExceptionHandlerExtension.prg" company="Opa SAS">
* ///      All rights reserved.
* /// </copyright>
* /// <summary>
* /// Handle errors at runtime.
* /// </summary>
* /// <paragramList>
* ///      <param Name="nError">Error number.</param>
* ///      <param Name="cMethod">Name of the method.</param>
* ///      <param Name="nLine">Line number.</param>
* ///      <param Name="cClassName">Name of the class.</param>
* /// </paragramList>
* /// --------------------------------------------------------------------------------------------------------------------

PARAMETERS nError, cMethod, nLine, cClassName
CREATEOBJECT("clExceptionHandlerExtension")

DEFINE CLASS clExceptionHandlerExtension AS Custom

	* /// <summary>
	* /// Class constructor.
	* /// </summary>
	PROCEDURE Init()
		LOCAL cMessage, cErrorMessage

		cErrorMessage = MESSAGE(nError)
		cMessage = ;
			"Error: " + TRANSFORM(nError) + CHR(13) + ;
			"Clase: " + cClassName + CHR(13) + ;
			"Método: " + cMethod + CHR(13) + ;
			"Línea: " + TRANSFORM(nLine) + " - " + cErrorMessage
		
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE

