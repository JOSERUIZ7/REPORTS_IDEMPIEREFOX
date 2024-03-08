*------------------------------------------------------------------------------------------------------------------
* Programita para verificar que PDF3.PRG funciona bien creando archivos .PDF
* Walter R. Ojeda Valiente
* 06/FEB/2020
*------------------------------------------------------------------------------------------------------------------
  
  CLOSE ALL
  CLEAR ALL

  LOCAL loPDF
    
  DO SETS_INICIALES
  
  USE PRODUCTOS
  
  loPDF = PDF3()
  
  REPORT FORM MiInforme1 OBJECT loPDF NOEJECT
  REPORT FORM MiInforme2 OBJECT loPDF NOEJECT
  REPORT FORM MiInforme3 OBJECT loPDF TO FILE "MiOtroArchivo.PDF" PREVIEW
  
  USE
  
RETURN
*
*
PROCEDURE SETS_INICIALES
  
  SET TALK OFF
  
ENDPROC
*
*


