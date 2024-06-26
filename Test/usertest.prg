* Llamar a la funci�n principal
DO RunAllTests

* Definici�n de la clase clUser
DEFINE CLASS clUser AS Custom
	IdUser = 0
	Cedula = ""
	FullName = ""

	PROCEDURE Init(nId AS Number, cCedula AS String, cFullName AS String)
		This.IdUser = nId
		This.Cedula = cCedula
		This.FullName = cFullName
	ENDPROC

	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE

* Funci�n de prueba para Init
FUNCTION TestClUserInit
	LOCAL oUser, nId, cCedula, cFullName, lPass

	* Valores esperados
	nId = 1
	cCedula = "1234567890"
	cFullName = "Juan Perez"

	* Crear instancia de la clase clUser
	oUser = CREATEOBJECT("clUser", nId, cCedula, cFullName)

	* Verificar que las propiedades se inicializaron correctamente
	lPass = .T.
	IF oUser.IdUser <> nId
		lPass = .F.
		? "Fallo: IdUser. Esperado: " + TRANSFORM(nId) + " Obtenido: " + TRANSFORM(oUser.IdUser)
	ENDIF

	IF oUser.Cedula <> cCedula
		lPass = .F.
		? "Fallo: Cedula. Esperado: " + cCedula + " Obtenido: " + oUser.Cedula
	ENDIF

	IF oUser.FullName <> cFullName
		lPass = .F.
		? "Fallo: FullName. Esperado: " + cFullName + " Obtenido: " + oUser.FullName
	ENDIF

	IF lPass
		? "TestClUserInit pas�."
	ELSE
		? "TestClUserInit fall�."
	ENDIF
ENDPROC

* Funci�n principal para ejecutar todas las pruebas
FUNCTION RunAllTests
	? "Ejecutando pruebas..."
	DO TestClUserInit
	? "Todas las pruebas finalizadas."
ENDPROC