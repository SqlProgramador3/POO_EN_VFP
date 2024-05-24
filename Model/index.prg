* PATH
SET PATH TO "D:\Proyectos\POO_EN_VFP\Controller"
SET PATH TO "D:\Proyectos\POO_EN_VFP\Model"

* Procedimiento
SET PROCEDURE TO "userController" ADDITIVE
SET PROCEDURE TO "clForm" ADDITIVE

* Variables
PRIVATE oForm

oForm = CREATEOBJECT("clForm")			&& Creo mi Objeto usando mi clase Form
oForm.AddObject("oLabel", "clLabel")    && Añadir a mi Objeto
oForm.AddObject("oContainer", "clContainer")
oForm.AddObject("oButtonConfirm", "clCommandButtonConfirm")
oForm.AddObject("oButtonConfirm", "clCommandButtonCancel")
oForm.AddObject("oUserController", "consultUserController")
oForm.Show(1)							&& Hacer visible

* Destruyo el objeto y libero los recursos asociados
RELEASE oForm

* Liberar Procedimiento
RELEASE PROCEDURE "clForm"