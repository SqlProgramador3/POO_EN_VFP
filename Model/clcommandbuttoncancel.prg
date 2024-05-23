DEFINE CLASS clCommandButtonCancel as CommandButton
	* Propiedades del CommandButton
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 25
	Top		= 145
	Caption 	= "Cancelar"
		
	* M�todo Click: Maneja el evento Click del boton
	FUNCTION Click()
		
		* Cerrar Formulario
		ThisForm.Release()
	ENDFUNC
	
	* M�todo Error: Maneja errores en tiempo de ejecuci�n
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		oHelper.HandleError(nError, cMethod, nLine, "clCommandButtonCancel")
	ENDFUNC
ENDDEFINE