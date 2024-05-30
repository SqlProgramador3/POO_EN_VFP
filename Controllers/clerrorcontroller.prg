* /// <summary>
* ///      Clase error controller
* /// </summary>
DEFINE CLASS clErrorController AS Custom

	* /// <summary>
	* /// 		Método HandleError: maneja los errores
	* /// </summary>
	* /// <paragramList>
	* ///      <param Name="nError">	Número de Error		</param>
	* ///      <param Name="cMethod">	Nombre del metodo	</param>
	* ///      <param Name="nLine">		Número de linea		</param>
	* ///      <param Name="cClassName">Nombre de la clase	</param>
	* /// </paragramList>
	* /// <Return Name=""></Return>
	PROCEDURE HandleError(nError, cMethod, nLine, cClassName)
		LOCAL cMessage, cErrorMessage
			
		* Texto de la linea donde ocurre el error
		cErrorMessage = MESSAGE(nError)
		
		* Crear mensaje
		cMessage = ;
			"Error: " + TRANSFORM(nError) + CHR(13) + ; 		&& Número de error
			"Clase: " + cClassName + CHR(13) + ;				&& Nombre de la clase
			"Método: " + cMethod + CHR(13) + ;				&& Metodo donde ocurre
			"Línea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de código
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE

