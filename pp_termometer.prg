 PARAMETER xalfa, xbeta, xgamma
 SET PROCEDURE TO pp_PROGRESS
 IF xalfa='FIN'
    deactthermo()
    RETURN
 ENDIF
 acttherm(xalfa)
 updtherm(xbeta, xgamma)
ENDPROC
**
