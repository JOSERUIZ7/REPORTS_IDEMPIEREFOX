*** 
*** ReFox XI+  #HP130192  pc08.inf  EMBRACE [VFP70]
***
 SET EXCLUSIVE OFF
 _SCREEN.visible = .F.
 xbeg = pp_begin()
 IF xbeg=.F.
    RETURN
 ENDIF
 PUBLIC salir, xcheck, varcolor
 *y = pp_conexion()
 y = .t.
 _SCREEN.visible = .T.
 _SCREEN.tag = 'REPORTES'
 varcolor = .T.
 CLOSE DATABASES ALL
 _SCREEN.caption = "Modulo de REPORTES"
  prg_versionscreen()
 varcolor = .T.
    salir = .t.
 IF y
    PUBLIC vnivel
    xcalidad = .T.
*    DO FORM pp_presentaventas
 ELSE
    salir = .F.
 ENDIF
 DO prg_error
 CLOSE DATABASES ALL
*!*	 USE siStema
*!*	 xsuc = ALLTRIM(sucursal)
*!*	 xempre = ALLTRIM(empresa)
 CLOSE DATABASES ALL
* _SCREEN.caption = "Sistema de NOMINA "+xempre+"..."+xsuc
 _SCREEN.caption = "Modulo de REPORTES"
prg_ver_versionscreen('REPORTES.EXE')

 CLOSE DATABASES ALL
 IF salir=.T.
*    DO menu
*    fp_menus1()
	DO menu.mpr
*	prg_conex_load()

 *   DO FORM PP_PANTALLAPRESENTACION
	READ EVENTS
 ENDIF
ENDPROC
**
*** 
*** ReFox - todo no se pierde 
***
