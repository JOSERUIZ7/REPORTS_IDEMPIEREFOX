Close Databases All
Select 1
Use cambioimpuesto

XRUTA = fp_leerdsn('dsn.TXT')
XCURSOR = 'terceros'
PRG_FREE_AREA('terceros')

PRG_OPENCONNE_SERVER_NEW(XRUTA)

Select 1
Go Top
Scan While .T.
	xr = Alltrim(Upper(rif))
	xciu = ALLTRIM(id)
	xC_BPartner_ID = C_BPartner 

	a = "update c_bpartner set LCO_ISIC_ID = "  + xciu  + " WHERE c_bpartner_id = " + xC_BPartner_ID + ""
	
	xsql = a
	prg_write(xsql,'ARCHIVOTEST.TXT')
	xresul =  PRG_OPENTABLE_NEW(XCURSOR,xsql)
*!*		Select terceros
*!*		xC_BPartner_ID = ALLTRIM(STR(C_BPartner_ID))
	Select cambioimpuesto
*	Replace C_BPartner With xC_BPartner_ID
? xsql 	
Endscan


	Select cambioimpuesto
BROWSE
