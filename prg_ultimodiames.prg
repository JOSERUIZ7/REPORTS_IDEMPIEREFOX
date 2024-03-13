 PARAMETER xf
 xd = '01'
 xm = ALLTRIM(STR(MONTH(xf)))
 xy = ALLTRIM(STR(YEAR(xf)))
 xd = xd+'/'+xm+'/'+xy
 xd = GOMONTH(CTOD(xd), 1)
 xd = xd-1
 IF EMPTY(xd)
    xd = xf
 ENDIF
 RETURN xd
ENDFUNC
**
