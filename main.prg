* /// --------------------------------------------------------------------------------------------------------------------
* /// <copyright file="main.prg" company="Opa SAS">
* ///      All rights reserved
* /// </copyright>
* /// <summary>
* ///       Es el inicializador de mi proyecto
* /// </summary>
* /// --------------------------------------------------------------------------------------------------------------------

* 1) SYS(16,0) Obtiene la ruta completa del archivo .prg que se est� ejecutando. El "FullPath" ;
* 2) JUSTPATH() Obtiene solo la ruta del archivo .prg, el "Path";
* 3) SET DEFAULT TO Establece la ruta por defecto del aplicativo
SET DEFAULT TO ( JUSTPATH( SYS( 16,0 ) ) )

SET PROCEDURE TO "Config\AppMain" ADDITIVE && Cargar la clase principal de la aplicaci�n

oApp = CREATEOBJECT( "clAppMain" ) && Crear la instancia de la aplicaci�n principal
 
RELEASE PROCEDURE "Config\AppMain" && Liberar procedimientos