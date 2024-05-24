DEFINE CLASS clHelper AS CUSTOM
	* Método para manejar errores
	FUNCTION HandleError(nError AS Number, cMethod AS String, nLine AS Number, cClassName AS String)
		LOCAL cMessage, cErrorMessage
			
			* Texto de la linea donde ocurre el error
			cErrorMessage = MESSAGE(nError)
			
			* Crear mensaje
			cMessage = "Error: " + TRANSFORM(nError) + CHR(13) + ; 	&& Número de error
			"Clase: " + cClassName + CHR(13) + ;					&& Nombre de la clase
			"Método: " + cMethod + CHR(13) + ;					&& Metodo donde ocurre
			"Línea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de código
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDFUNC
ENDDEFINE