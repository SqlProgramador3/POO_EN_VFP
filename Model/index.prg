* PATH
SET PATH TO "D:\Proyectos\proyectoArquitecturaMiguel_Clase2\"
SET PATH TO "D:\Proyectos\proyectoArquitecturaMiguel_Clase2\programas"

* Procedimiento
SET PROCEDURE TO "clForm" ADDITIVE

* Variables
PRIVATE oForm

oForm = CREATEOBJECT("clForm")			&& Creo mi Objeto usando mi clase Form
oForm.AddObject("oLabel", "clLabel")
oForm.AddObject("oContainer", "clContainer")	&& Añadir Objeto
oForm.AddObject("oButtonConfirm", "clCommandButtonConfirm")
oForm.AddObject("oButtonConfirm", "clCommandButtonCancel")
oForm.Show(1)							&& Hacer visible

* Destruyo el objeto y libero los recursos asociados
RELEASE oForm

* Liberar Procedimiento
RELEASE PROCEDURE "clForm"