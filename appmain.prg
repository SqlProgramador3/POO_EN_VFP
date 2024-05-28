* /// <summary>
* /// Clase Inicial del aplicativo
* /// </summary>
DEFINE CLASS clAppMain AS Custom
	
	* /// <summary>
	* /// Procedimiento Init: Inicializaci�n de la clase
	* /// </summary>
	PROCEDURE Init()
		PRIVATE oConnectionSQL AS Object, oController AS Object, oForm AS Form
		This.SetPath()
		
		SET PROCEDURE TO ;
			"clUserController", ;
			"clConnectionSQL", ;
			"clError", ;
			"clForm" ;
		ADDITIVE
		
		oConnectionSQL = This.GetConnection()
		
		oController = CREATEOBJECT(;
			"clUserController", ; 	&& Referencia de mi Controlador
			oConnectionSQL;  	&& Conexi�n SQL
		)
		oForm = CREATEOBJECT(;
			"clForm", ;		&& Referencia de mi clase FORM
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
			"clError", ;
			"clForm"
	ENDPROC
	

	* /// <summary>
	* /// Procedimiento SetPath: Definir rutas
	* /// </summary>
	HIDDEN PROCEDURE SetPath()
		SET PATH TO ;
			"Context; " + ;
			"Controller; " + ;
			"Model\Entities; " + ;
			"Model\Business"s
	ENDPROC

	* /// <summary>
	* /// Funci�n GetConnection: Conexi�n BD SQL
	* /// </summary>
	HIDDEN FUNCTION GetConnection()
		LOCAL cConnectionString AS String
		cConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=POO_VFP;Data Source=OPA119\SQL2022"
		oConnectionSQL = CREATEOBJECT("clConnectionSQL", cConnectionString)
		oConnectionSQL.OpenConnection()
		return oConnectionSQL
	ENDFUNC

	* /// <summary>
	* /// Procedimiento Error: Maneja errores en tiempo de ejecuci�n
	* /// </summary>
	* /// <paragramList>
	* /// 	<param Name="nError">	N�mero del error	</param>
	* /// 	<param Name="cMethod">	Nombre del metodo	</param>
	* /// 	<param Name="nLine">	N�mero de linea		</param>
	* /// </paragramList>
	PROCEDURE Error(nError AS Number, cMethod AS String, nLine AS Number)
		className = This.Class
		Do clError With m.nError, m.cMethod, m.nLine, m.className, Program()
	ENDPROC
ENDDEFINE
