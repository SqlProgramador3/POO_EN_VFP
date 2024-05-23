DEFINE CLASS clUserList AS Custom
	* Constructor
	FUNCTION Init()
		* Crear la colecci�n
		This.AddProperty("oUserList", CREATEOBJECT("Collection"))
		This.CreateListUser()
	ENDFUNC
	
	* M�todo CreateListUser: Crea una lista de usuarios para pruebas
	HIDDEN FUNCTION CreateListUser()
		LOCAL nNumBase, nNumberUsers, nAddToId, cUserID, cUserName, cUserLastName
		* Configuraci�n
		nNumBase = 1047971438 	&& ID Base
		nNumberUsers = 10		&& N�mero de usuarios creados
		nAddToId = 1			&& Suma que se realiza al ID Base
		
		* Numero de ciclos y usuarios que seran asignados a la lista
		FOR i = 1 TO nNumberUsers
			cUserID = TRANSFORM(nNumBase)				&& ID
			cUserName = "Prueba Nom " + TRANSFORM(i)		&& Nombre
			cUserLastName = "Prueba Ape " + TRANSFORM(i)	&& Apellido
			
			* A�adir Usuario a la lista
			This.AddUser(cUserID, cUserName, cUserLastName)
			
			* Aumento del ID para un nuevo usuario
			nNumBase = (nNumBase + nAddToId)
		ENDFOR
	ENDFUNC

	* M�todo AddUser: Agregar un elemento a la colecci�n
	HIDDEN FUNCTION AddUser(cID AS String, cName AS String, cLastName AS String)
		LOCAL oUser
		* Crear Usuario
		oUser = CREATEOBJECT("clUser")
		
		* Almaceno los datos
		oUser.UserId = cID
		oUser.UserName  = cName
		oUser.UserLastName = cLastName
		
		* A�adir a la lista
		This.oUserList.Add(oUser)
	ENDFUNC

	* M�todo Error: Maneja errores en tiempo de ejecuci�n
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		ThisForm.oHelper.HandleError(nError, cMethod, nLine, "clUserList")
	ENDFUNC
ENDDEFINE