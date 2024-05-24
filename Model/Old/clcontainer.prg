DEFINE CLASS clContainer as Container
	* Propiedades del Container
	Visible	= .t.
	Width	= 250
	Height 	= 200
	Left		= 25
	Top		= 25

	* Constructor
	FUNCTION Init()
		
		* TextBox
		This.AddObject("oTextBox", "clTextBox")
		This.AddObject("oTextBox", "clTextBox")

		* Lista de Usuarios
		*This.AddObject("cUserList", "clUserList")
	
		* Pasar la referencia del CommandButton al TextBox
		This.oTextBox.AddProperty("oCommandButton", This.oCommandButton1)
		
		* Pasar la referencia del TextBox al CommandButton
		This.oCommandButton1.AddProperty("oTextBox", This.oTextBox)
		
		* Pasar el objeto Lista de Usuarios al CommandButton
		This.oCommandButton1.AddProperty("oUserList", This.cUserList.oUserList)
	ENDFUNC

	* Método Error: Maneja errores en tiempo de ejecución
	FUNCTION Error(nError AS Number, cMethod AS String, nLine AS Number)
        		ThisForm.oHelper.HandleError(nError, cMethod, nLine, "clContainer")
	ENDFUNC
ENDDEFINE