 CLOSE DATABASES ALL
 RELEASE ALL EXTENDED
 xdirvar = _SCREEN.tag+'PV_Variables.MEM'
 RESTORE FROM &xdirvar
 PUBLIC xempresa, xsistema, xplanta, xañoinicial, xciclocosecha, xactiva, xcentro, xañocosecha, xusuario, xnom_usuario, xnivel, xid_usuario, xrif, xnit, xcond_pago, xauto_liqui
 xempresa = vempresa
 xcond_pago = vcond_pago
 xrif = vrif
 xnit = vnit
 xsistema = vsistema
 xplanta = vplanta
 xañocosecha = vañocosecha
 xciclocosecha = vciclocosecha
 xactiva = vactiva
 xcentro = vcentro
 xusuario = vusuario
 xnom_usuario = vnom_usuario
 xnivel = vnivel
 xid_usuario = vid_usuario
 xauto_liqui = vauto_liqui
ENDPROC
**
