* /// <summary>
* /// Clase Formulario
* /// </summary>
DEFINE CLASS clForm AS Form
	Caption = "Formulario Pruebas"
	Width    = 300
	Height   = 250
	
    * /// <summary>
    * /// Procedimiento Init: Inicialización de la clase
    * /// </summary>
	PROCEDURE Init()
        This.oUserController.SetupProcedures()
	ENDPROC	

	* /// <summary>
    * /// Procedimiento Destroy: Manejar los eventos al cerrar el formulario
    * /// </summary>
	HIDDEN PROCEDURE Destroy()
        This.oUserController.CloseSetupProcedures()
    ENDPROC
	
	* /// <summary>
    * /// Procedimiento Error: Maneja errores
    * /// </summary>
	HIDDEN PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
        ThisForm.oUserController.HandleError(nError, cMethod, nLine, "clForm")
	ENDPROC
ENDDEFINE