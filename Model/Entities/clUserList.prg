DEFINE CLASS clUserList AS Custom
	* Constructor
	FUNCTION Init()
		* Crear la colección
		This.AddProperty("oUserList", CREATEOBJECT("Collection"))
		This.CreateListUser()
	ENDFUNC

	* Método CreateListUser: Crea una lista de usuarios para pruebas
	HIDDEN FUNCTION CreateListUser()
		LOCAL nNumBase, nNumberUsers, nAddToId, cUserID, cUserName, cUserLastName
		* Configuración
		nNumBase = 1047971438 	&& ID Base
		nNumberUsers = 10		&& Número de usuarios creados
		nAddToId = 1			&& Suma que se realiza al ID Base
		
		* Numero de ciclos y usuarios que seran asignados a la lista
		FOR i = 1 TO nNumberUsers
			cUserID = TRANSFORM(nNumBase)				&& ID
			cUserName = "Prueba Nom " + TRANSFORM(i)		&& Nombre
			cUserLastName = "Prueba Ape " + TRANSFORM(i)	&& Apellido
			
			* Añadir Usuario a la lista
			This.AddUser(cUserID, cUserName, cUserLastName)
			
			* Aumento del ID para un nuevo usuario
			nNumBase = (nNumBase + nAddToId)
		ENDFOR
	ENDFUNC

	* Método AddUser: Agregar un elemento a la colección
	HIDDEN FUNCTION AddUser(cID AS String, cName AS String, cLastName AS String)
		LOCAL oUser
		* Crear Usuario
		oUser = CREATEOBJECT("clUser")
		
		* Almaceno los datos
		oUser.UserId = cID
		oUser.UserName  = cName
		oUser.UserLastName = cLastName
		
		* Añadir a la lista
		This.oUserList.Add(oUser)
	ENDFUNC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">		Número del error			</param>
	* /// 	<Param Name="cMethod">	Nombre del Metodo			</param>
	* /// 	<Param Name="nLine">		Número de la linea del error	</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		ThisForm.oController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE