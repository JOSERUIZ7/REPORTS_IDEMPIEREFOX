PARAMETERS XDATA,XCURSOR,XADD
 

CREATE CURSOR xBASED ;
	(CAMPO C(30), BDtIPO C(1) , LON N(3), DEC N(1))

SELE &XDATA
GO top
gnFieldcount = AFIELDS(EJEMPLO)  && Crea la matriz

SELE xBASED
FOR nCuenta = 1 TO gnFieldcount
	APPE blank
	REPLACE CAMPO with   EJEMPLO(nCuenta,1)
	REPLACE BDtIPO with  EJEMPLO(nCuenta,2)
	REPLACE LON with  EJEMPLO(nCuenta,3)
	REPLACE DEC with  EJEMPLO(nCuenta,4)

ENDFOR

XCAD = ''
GO TOP
SCAN WHILE .T.
	IF EMPTY(XCAD)
		XCAD = ALLTRIM(CAMPO) + ' ' + ALLTRIM(BDtIPO)  + ' ' + '('+ ALLTRIM(STR(LON))  + ',' +  ALLTRIM(STR(DEC)) +')'
	ELSE
		XCAD = XCAD + ', ' + ALLTRIM(CAMPO) + ' ' + ALLTRIM(BDtIPO)  + ' ' + '('+ ALLTRIM(STR(LON))  + ',' +  ALLTRIM(STR(DEC)) +')'
	ENDIF

ENDSCAN

IF EMPTY(XADD)
	XCAD = 'CREATE CURSOR ' + XCURSOR + ' (' + XCAD + ' )'
ELSE
	XCAD = 'CREATE CURSOR ' + XCURSOR + ' (' + XCAD + XADD + ' )'
ENDIF
&XCAD
SELE XBASED
USE
SELE &XCURSOR
