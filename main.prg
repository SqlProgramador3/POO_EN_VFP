* 1) SYS(16,0) Obtiene la ruta completa del archivo .prg que se est� ejecutando. El "FullPath" ;
* 2) JUSTPATH() Obtiene solo la ruta del archivo .prg, el "Path";
* 3) SET DEFAULT TO Establece la ruta por defecto del aplicativo
SET DEFAULT TO (JUSTPATH(SYS(16,0)))

* Cargar la clase principal de la aplicaci�n
SET PROCEDURE TO "AppMain" ADDITIVE

* Crear la instancia de la aplicaci�n principal
oApp = CREATEOBJECT("clAppMain")

* Liberar procedimientos
RELEASE PROCEDURE "AppMain"