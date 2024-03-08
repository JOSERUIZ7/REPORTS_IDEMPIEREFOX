Parameters XDATA,XCURSOR,XADD
 
*!*	XDATA = 'PRODUCTOSNEW'
*!*	XCURSOR = 'PRODUCTOSNEW2'
*!*	XADD = ''

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
		XCAD = 'ALTER TABLE ' + XDATA + ' ADD COLUMN '+  Alltrim(CAMPO) + ' ' + Alltrim(BDtIPO)  + ' ' + '('+ Alltrim(Str(LON))  + ',' +  Alltrim(Str(DEC)) +')'
	Else
		XCAD = XCAD + CHR(13) + 'ALTER TABLE ' + XDATA + ' ADD COLUMN '+ Alltrim(CAMPO) + ' ' + Alltrim(BDtIPO)  + ' ' + '('+ Alltrim(Str(LON))  + ',' +  Alltrim(Str(DEC)) +')'
	Endif

Endscan


Sele xBASED
Use
*Sele &XCURSOR
