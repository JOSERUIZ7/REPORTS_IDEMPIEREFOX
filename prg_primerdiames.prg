 PARAMETER xf
 xf = DATE()
 
 xd = '01'
 xm = ALLTRIM(STR(MONTH(xf)))
 xy = ALLTRIM(STR(YEAR(xf)))
 xd = xd+'/'+xm+'/'+xy
 
RETURN cTOd(xd)
 