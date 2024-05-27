* /// <summary>
* /// Clase Boton Cancelar
* /// </summary>
DEFINE CLASS clCancelButton as CommandButton
	Visible	= .t.
	Width	= 200
	Height 	= 30
	Left		= 50
	Top		= 195
	Caption 	= "Cancelar"

	* /// <summary>
	* /// Procedimiento Click: Maneja el evento Click del boton
	* /// </summary>
	PROCEDURE Click()
		ThisForm.oController.CloseSetupProcedures()
	ENDPROC
	
	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">	N�mero del error		</param>
	* /// 	<Param Name="cMethod">	Nombre del Metodo		</param>
	* /// 	<Param Name="nLine">	N�mero de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE