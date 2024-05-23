DEFINE CLASS clForm AS Form
	* Propiedades del Formulario
	Caption = "Formulario Pruebas"
	Width    = 300
	Height   = 250
	
	* M�todo Init: Inicializaci�n de la clase
	FUNCTION Init()
		This.SetupProcedures()
		
		* Crear la instancia de Helper en el m�todo Init
		This.AddProperty("oHelper", CREATEOBJECT("clHelper"))
	ENDFUNC
	
	* M�todo SetupProcedures: Manejar la configuraci�n inicial
	HIDDEN FUNCTION SetupProcedures()
		SET PROCEDURE TO "clContainer" ADDITIVE
		SET PROCEDURE TO "clLabel" ADDITIVE
		SET PROCEDURE TO "clTextbox" ADDITIVE
		SET PROCEDURE TO "clCommandButtonConfirm" ADDITIVE
		SET PROCEDURE TO "clCommandButtonCancel" ADDITIVE
		SET PROCEDURE TO "clUserList" ADDITIVE
		SET PROCEDURE TO "clUser" ADDITIVE
		SET PROCEDURE TO "clError" ADDITIVE
	ENDFUNC

	* M�todo Destroy: Manejar los eventos al cerrar el formulario
	FUNCTION Destroy()
		* Liberar los procedimientos al destruir el contenedor
		RELEASE PROCEDURE "clContainer"
		RELEASE PROCEDURE "clLabel"
		RELEASE PROCEDURE "clTextbox"
		RELEASE PROCEDURE "clCommandButtonConfirm"
		RELEASE PROCEDURE "clCommandButtonCancel"
		RELEASE PROCEDURE "clUserList"
		RELEASE PROCEDURE "clUser"
		RELEASE PROCEDURE "clHelper"
	ENDFUNC
	
	* M�todo Error: Maneja errores en tiempo de ejecuci�n
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
		* Llama a la funci�n de manejo de errores en la clase clHelper
        This.oHelper.HandleError(nError, cMethod, nLine, "clForm")
	ENDFUNC
ENDDEFINE