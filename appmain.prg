* /// <summary>
* /// Clase Inicial del aplicativo
* /// </summary>
DEFINE CLASS clAppMain AS Custom
	
	* /// <summary>
	* /// Procedimiento Init: Inicialización de la clase
	* /// </summary>
	PROCEDURE Init()
		PRIVATE oForm AS Form, oController AS Object, oConnectionSQL AS Object, cConnectionString AS String
		
		* Definir rutas y configuración inicial
		SET PATH TO ;
			"Context; " + ;
			"Controller; " + ;
			"Model\Entities; " + ;
			"Model\Business"

		* Cargar procedimientos
		SET PROCEDURE TO ;
			"clUserController", ;
			"clConnectionSQL", ;
			"clForm" ;
		ADDITIVE

		* Conexión con mi base de datos
		cConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=projectCrud;Data Source=OPA119\SQL2022"
		oConnectionSQL = CREATEOBJECT("clConnectionSQL", cConnectionString)
		
		* Controlador
		oController = CREATEOBJECT("clUserController")
		
		* Formulario
		oForm = CREATEOBJECT(;
			"clForm", ;		 && Referencia de mi clase FORM
			oController, ;	 && Controlador
			oConnectionSQL; && Conexión SQL
		)
		
		* Objetos del formulario
		oForm.AddObject("oLabel", "clLabel", "Consultar Usuario")
		oForm.AddObject("oContainer", "clContainer")
		oForm.AddObject("oButtonConfirm", "clConfirmButton")
		oForm.AddObject("oCancelButton", "clCancelButton")

		* Mostrar el formulario
		oForm.Show(1)

		* Liberar procedimientos
		RELEASE PROCEDURE ;
			"clForm", ;
			"clUserController"
	ENDPROC
	
	* /// <summary>
	* /// Procedimiento HandleError: Maneja errores en tiempo de ejecución
	* /// </summary>
	* /// <ParagramList>
	* /// 	<Param Name="nError">	Número del error	</param>
	* /// 	<Param Name="cMethod">	Nombre del metodo	</param>
	* /// 	<Param Name="nLine">	Número de linea		</param>
	* /// </ParagramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		LOCAL cMessage AS String, cErrorMessage AS String, cClassName AS String
		*Nombre de la clase
		cClassName = This.Class
		
		* Texto de la linea donde ocurre el error
		cErrorMessage = MESSAGE(nError)
		
		* Crear mensaje
		cMessage = ;
			"Error: " + TRANSFORM(nError) + CHR(13) + ; 		&& Número de error
			"Clase: " + cClassName + CHR(13) + ;				&& Nombre de la clase
			"Método: " + cMethod + CHR(13) + ;				&& Metodo donde ocurre
			"Línea: " + TRANSFORM(nLine) + " - " + cErrorMessage	&& Linea de código
		
		* Imprimir mensaje
		MESSAGEBOX(cMessage, 16, "Error en " + cClassName)
	ENDPROC
ENDDEFINE
