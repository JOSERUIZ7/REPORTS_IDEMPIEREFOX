*------------------------------------------------------------------------------------------------------------------
* Programita para verificar que PDF3.PRG funciona bien creando archivos .PDF
* Walter R. Ojeda Valiente
* 06/FEB/2020
*------------------------------------------------------------------------------------------------------------------
  
  CLOSE ALL
  CLEAR ALL
  
  DO SETS_INICIALES
  
  USE PRODUCTOS
  
  REPORT FORM INFORME_01 OBJECT PDF3() TO FILE "MiArchivo.PDF"
  
  USE
  
RETURN
*
*
PROCEDURE SETS_INICIALES
  
  SET TALK OFF
  
ENDPROC
*
*
