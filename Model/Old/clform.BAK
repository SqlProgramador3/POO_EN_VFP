DEFINE CLASS clForm AS Form
	* Propiedades del Formulario
	Caption = "Formulario Pruebas"
	Width    = 300
	Height   = 250
	
	* Método Init: Inicialización de la clase
	FUNCTION Init()
		This.SetupProcedures()
		
		* Crear la instancia de Helper en el método Init
		This.AddProperty("oHelper", CREATEOBJECT("clHelper"))
	ENDFUNC
	
	* Método SetupProcedures: Manejar la configuración inicial
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

	* Método Destroy: Manejar los eventos al cerrar el formulario
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
	
	* Método Error: Maneja errores en tiempo de ejecución
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
		* Llama a la función de manejo de errores en la clase clHelper
        This.oHelper.HandleError(nError, cMethod, nLine, "clForm")
	ENDFUNC
ENDDEFINE