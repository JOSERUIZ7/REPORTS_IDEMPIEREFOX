
Close Databases All
XRUTA = fp_leerdsn('dsn.TXT')
XCURSOR = 'CURSOR'

*?XRUTA
PRG_OPENCONNE_SERVER_NEW(XRUTA)

xsql2 = "select * from cop_plan_payment"

*? 	xsql2

xresul =  PRG_OPENTABLE_NEW(XCURSOR ,xsql2)

*?	xresul
*BROWSE


Create Cursor xdefinition (PARTNER C (50,0), COP_PAYGROUP_N C (60,0), C_INVOICE_ID N (12,0),;
	C_BPARTNER_ID N (12,0), COP_PAYGROUP_ID N (12,0), DOCUMENTNO C (30,0), ORIGINAL_AMOUNT N (20,6),;
	PAYMENT N (20,6), INVOICEOPEN N (20,6) , DATEINVOICED d (8,0), DUEDATE_D d (8,0), EXPIRATION_DAY I (4,0)  ,;
	T_WEEK N (12,2), T_YEAR  N (12,2),  DATE_INI d (8,0), DATE_END d (8,0), D_WEEK C (22), CURRENCY_DET I (4,0),;
	_a1 N (12,2) , _a2 N (12,2) , _a3 N (12,2) , _a4 N (12,2) , _a5 N (12,2) , _a6 N (12,2) , _a7 N (12,2) , _a8 N (12,2) , _a9 N (12,2) , _a10 N (12,2),;
	_b1 C (25) , _b2 C (25), _b3 C (25) , _b4 C (25) , _b5 C (25) , _b6 C (25) , _b7 C (25) , _b8 C (25) , _b9 C (25) , _b10 C (25))


PRG_APPE_ACURSOR('CURSOR','xdefinition')

Select  xdefinition
Delete For Empty(INVOICEOPEN)

prg_free_area('xalfa')
Select 0000 T_WEEK,00000 T_YEAR,D_WEEK ,"                "  d_column,"                "  d_columnb  From xdefinition Group By D_WEEK Into Cursor xalfa Readwrite
Select xalfa
Replace T_WEEK With Week(Ctod(Substr(D_WEEK,9,2) + '/' + Substr(D_WEEK,6,2) + '/' + Substr(D_WEEK,1,4)) ) For .T.
Replace T_YEAR With Year(Ctod(Substr(D_WEEK,9,2) + '/' + Substr(D_WEEK,6,2) + '/' + Substr(D_WEEK,1,4)) ) For .T.
**Replace d_column With '_' + ((Substr(D_WEEK,9,2) + '' + Substr(D_WEEK,6,2) + '' + Substr(D_WEEK,1,4)) ) For .T.

Replace d_column With "_A" + Alltrim(Str(Recno())) For .T.
Replace d_columnb With "_b" + Alltrim(Str(Recno())) For .T.

Select xalfa
Go Top
Scan While .T.
	Xd_week = Alltrim(D_WEEK)
	Xd_column = Alltrim(d_column)
	Update xdefinition Set  &Xd_column = INVOICEOPEN Where D_WEEK = Xd_week
Endscan


Select xalfa
Go Top
Scan While .T.

	Xd_week = D_WEEK
	Xd_columnb = Alltrim(d_columnb)

	Update xdefinition Set &Xd_columnb  = Xd_week

Endscan

Select xdefinition
Go Top

loPDF = PDF3()

REPORT FORM xborra.FRX OBJECT loPDF TO FILE "ReportePlanPago.PDF" 

	m.cSender = "jose.ruiz@coposa.com"
	m.cReceiver="ruizjose@gmail.com,ana.scarabellotto@coposa.com,alejandra.alvarez@coposa.com"
	m.server = "correo.movistarcloud.com.ve"
	m.port = 587
	m.ssl = .T.
	m.password = 'jr.Coposa22'
	m.attachments = "c:\desarrollo\reports_idempierefox\ReportePlanPago.pdf"
	m.asunto = "Reporte de Planificacion de Pago Semanal " + Alltrim(Ttoc(Datetime()))

prg_send_email(M.cSender, M.cReceiver, m.server,m.port,m.ssl,m.password ,m.attachments ,m.asunto)


**escribir en idempiere en tabla x