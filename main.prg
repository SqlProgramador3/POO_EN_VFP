* 1) SYS(16,0) Obtiene la ruta completa del archivo .prg que se está ejecutando. El "FullPath" ;
* 2) JUSTPATH() Obtiene solo la ruta del archivo .prg, el "Path";
* 3) SET DEFAULT TO Establece la ruta por defecto del aplicativo
SET DEFAULT TO (JUSTPATH(SYS(16,0)))

SET PROCEDURE TO "AppMain" ADDITIVE && Cargar la clase principal de la aplicación

oApp = CREATEOBJECT("clAppMain") && Crear la instancia de la aplicación principal
 
RELEASE PROCEDURE "AppMain" && Liberar procedimientos