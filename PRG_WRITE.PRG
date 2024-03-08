Parameters XSTR ,XFILE,lAdditive

If Empty(XSTR)
	XSTR= 'TEST DE ESCRITURA'
Endif

If Empty(XFILE)
XO = .T.
	XFILE = 'ARCHIVOTEST.TXT'
	ELSE
	XO = .F.
Endif

If Empty(lAdditive)
	lAdditive = .F.
Endif


Strtofile(XSTR ,XFILE,lAdditive )

IF XO = .T.
MODIFY COMMAND ARCHIVOTEST.TXT
ENDIF