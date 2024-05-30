* /// <summary>
* ///      Clase error controller
* /// </summary>
DEFINE CLASS clErrorController AS Custom

	* /// <summary>
	* /// 		M�todo HandleError: maneja los errores
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nError">	N�mero de Error		</param>
	* ///      <param Name="cMethod">	Nombre del metodo	</param>
	* ///      <param Name="nLine">		N�mero de linea		</param>
	* ///      <param Name="cClassName">Nombre de la clase	</param>
	* /// </paragramList>
	* /// <Return Name=""></Return>
	PROCEDURE HandleError(nError, cMethod, nLine, cClassName)
		LOCAL cMessage, cErrorMessage
			
		* Texto de la linea donde ocurre el error
		cErrorMessage = MESSAGE(nError)
		
		* Crear mensaje
		cMessage = ;
			"Error: " + TRANSFORM(nError) + CHR(13) + ; 		&& N�mero de error
			"Clase: " + cClassName + CHR(13) + ;				&& Nombre de la clase
			"M�todo: " + cMethod + CHR(13) + ;				&& Metodo donde ocurre
			"L�nea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de c�digo
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE

