Parameters XDATA,XCURSOR,XADD,XCURSOR2
 
If Empty(XDATA)
	XDATA = 'PASE_CONTABILIDAD'
	XCURSOR = 'PASE_CONTABILIDAD2'
	XADD = ''
	XCURSOR2 = ''
Endif

Create Cursor xBASED ;
	(CAMPO C(30), BDtIPO C(1) , LON N(3), DEC N(1))

Sele &XDATA
Go Top
gnFieldcount = Afields(EJEMPLO)  && Crea la matriz

Sele xBASED
For nCuenta = 1 To gnFieldcount
	Appe Blank
	Replace CAMPO With   EJEMPLO(nCuenta,1)
	Replace BDtIPO With  EJEMPLO(nCuenta,2)
	Replace LON With  EJEMPLO(nCuenta,3)
	Replace DEC With  EJEMPLO(nCuenta,4)

Endfor

XCAD = ''
Go Top
Scan While .T.
	If Empty(XCAD)
		XCAD = Alltrim(CAMPO) &&+ ' ' + ALLTRIM(BDtIPO)  + ' ' + '('+ ALLTRIM(STR(LON))  + ',' +  ALLTRIM(STR(DEC)) +')'
		MXCAD = 'M.'+ Alltrim(CAMPO) &&+ ' ' + ALLTRIM(BDtIPO)  + ' ' + '('+ ALLTRIM(STR(LON))  + ',' +  ALLTRIM(STR(DEC)) +')'
	Else
		XCAD = XCAD + ', ' + Alltrim(CAMPO)
		MXCAD =  MXCAD + ', ' + 'M.' + Alltrim(CAMPO)
	Endif

Endscan


If Empty(XADD)
	XCAD = 'SELECT  ' +  ' ' + XCAD + ' '
Else
	XCAD = ',' + XCURSOR + ' ' + XCAD + XADD + ' '
Endif
CLEAR

XCAD = XCAD + ' FROM '  +  XDATA 

Sele xBASED
USE 
*Use
*Sele &XCURSOR
