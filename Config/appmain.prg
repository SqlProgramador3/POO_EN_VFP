return CREATEOBJECT("clAppMain")
* /// <summary>
* /// 		Clase Inicial del aplicativo
* /// </summary>
DEFINE CLASS clAppMain AS Custom
	oErrorController = .Null.
	oConnectionSQL = .Null.
	
	* /// <summary>
	* /// 		Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	PROCEDURE Init()
		PRIVATE oController AS Object, oForm AS Form
		
		This.SetPath()
		
		SET PROCEDURE TO ;
			"clUserController", ;
			"clConnectionSQL", ;
			"clErrorController", ;
			"clForm" ;
		ADDITIVE
		
		oConnectionSQL = This.GetConnection()
		
		oErrorController = CREATEOBJECT("clErrorController")
		
		oController = CREATEOBJECT(;
			"clUserController", ; 	&& Controladore Base
			oConnectionSQL, ;  	&& Conexi�n SQL
			oErrorController;		&& Control de errores
		)
		
		oForm = CREATEOBJECT(;
			"clForm", ;		&& Referencia de mi clase FORM Base
			oController;	&& Controlador
		)
		
		* Objetos del formulario
		oForm.AddObject("oLabel", "clLabel", "Consultar Usuario")
		oForm.AddObject("oContainer", "clContainer")
		oForm.AddObject("oConfirmbutton", "clConfirmButton")
		oForm.AddObject("oCancelButton", "clCancelButton")
		
		* Mostrar el formulario
		oForm.Show(1)
		
		* Liberar procedimientos
		RELEASE PROCEDURE;
			"clUserController", ;
			"clConnectionSQL", ;
			"clErrorController", ;
			"clForm"
	ENDPROC


	* /// <summary>
	* /// 		Funci�n GetConnection: Conexi�n BD SQL
	* /// </summary>
	* /// <Return Name="oConnectionSQL">Objeto con mi conexi�n abierta a mi base de datos</Return>
	HIDDEN FUNCTION GetConnection()
		LOCAL cConnectionString AS String
		
		cConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=POO_VFP;Data Source=OPA119\SQL2022"
		
		oConnectionSQL = CREATEOBJECT("clConnectionSQL", cConnectionString)
		
		oConnectionSQL.OpenConnection()
		
		return oConnectionSQL
	ENDFUNC
	
	* /// <summary>
	* /// 		Procedimiento SetPath: Definir rutas
	* /// </summary>
	HIDDEN PROCEDURE SetPath()
		SET PATH TO ;
			"Context; " + ;
			"Controllers; " + ;
			"Model\Entities; " + ;
			"Model\Business"
	ENDPROC

	* /// <summary>
	* /// 		Procedimiento Error: Maneja errores en tiempo de ejecuci�n
	* /// </summary>
	* /// <paragramList>
	* /// 		<param Name="nError">	N�mero del error	</param>
	* /// 		<param Name="cMethod">	Nombre del metodo	</param>
	* /// 		<param Name="nLine">	N�mero de linea		</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		This.oErrorController.HandleError(nError, cMethod, nLine, This.Class)
	ENDPROC
ENDDEFINE
