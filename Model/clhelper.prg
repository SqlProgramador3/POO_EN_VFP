DEFINE CLASS clHelper AS CUSTOM
	* M�todo para manejar errores
	FUNCTION HandleError(nError AS Number, cMethod AS String, nLine AS Number, cClassName AS String)
		LOCAL cMessage, cErrorMessage
			
			* Texto de la linea donde ocurre el error
			cErrorMessage = MESSAGE(nError)
			
			* Crear mensaje
			cMessage = "Error: " + TRANSFORM(nError) + CHR(13) + ; 	&& N�mero de error
			"Clase: " + cClassName + CHR(13) + ;					&& Nombre de la clase
			"M�todo: " + cMethod + CHR(13) + ;					&& Metodo donde ocurre
			"L�nea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de c�digo
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDFUNC
ENDDEFINE