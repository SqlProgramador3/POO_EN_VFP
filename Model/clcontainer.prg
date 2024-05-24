* /// <summary>
* /// Clase Contenedor
* /// </summary>
DEFINE CLASS clContainer as Container
	Visible	= .t.
	Width	= 250
	Height 	= 200
	Left	= 25
	Top		= 25

	* /// <summary>
    * /// Procedimiento Init: Inicialización de la clase
    * /// </summary>
	PROCEDURE Init()
		This.AddObject("oTextBoxCedula", "clTextBox")
		This.oTextBoxCedula.AddProperty("Type", 0)
		
		This.AddObject("oTextBoxFullName", "clTextBox")
		This.oTextBoxFullName.AddProperty("Type", 1)
	ENDPROC

	* /// <summary>
    * /// Procedimiento Error: Maneja errores
    * /// </summary>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
        ThisForm.oUserController.HandleError(nError, cMethod, nLine, "clContainer")
	ENDPROC
ENDDEFINE