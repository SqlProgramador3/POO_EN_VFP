* /// <summary>
* /// Clase Boton Cancelar
* /// </summary>
DEFINE CLASS clCancelButton as CommandButton
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left	= 25
	Top		= 145
	Caption = "Cancelar"

	* /// <summary>
	* /// Procedimiento Click: Maneja el evento Click del boton
	* /// </summary>
	PROCEDURE Click()
		ThisForm.oUserController.CloseSetupProcedures()
	ENDPROC
	
	* /// <summary>
    * /// Procedimiento Error: Maneja errores
    * /// </summary>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
        oHelper.HandleError(nError, cMethod, nLine, "clCommandButtonCancel")
	ENDPROC
ENDDEFINE