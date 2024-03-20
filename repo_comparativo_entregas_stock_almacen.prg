
xdate = DATE()
*xprim_dia = prg_primerdiames(xdate)

**xd1 = ALLTRIM(STR(YEAR(xprim_dia))) + '-' + iif(LEN(ALLTRIM(STR(MONTH(xprim_dia))))=1 , "0" + ALLTRIM(STR(MONTH(xprim_dia))) , ALLTRIM(STR(MONTH(xprim_dia))) )+ '-' + ALLTRIM(STR(DAY(xprim_dia))) 
*xd2 = ALLTRIM(STR(YEAR(xdate))) + '-' + ALLTRIM(STR(MONTH(xdate))) + '-' + ALLTRIM(STR(DAY(xdate)))

*xd1 = ALLTRIM(STR(YEAR(xprim_dia))) + '-' + iif(LEN(ALLTRIM(STR(MONTH(xprim_dia))))=1 , "0" + ALLTRIM(STR(MONTH(xprim_dia))) , ALLTRIM(STR(MONTH(xprim_dia))) )+ '-' + iif(LEN(ALLTRIM(STR(day(xprim_dia))))=1 , "0" + ALLTRIM(STR(day(xprim_dia))) , ALLTRIM(STR(day(xprim_dia))) )
*xd2 = ALLTRIM(STR(YEAR(xdate))) + '-' + iif(LEN(ALLTRIM(STR(MONTH(xdate))))=1 , "0" + ALLTRIM(STR(MONTH(xdate))) , ALLTRIM(STR(MONTH(xdate))) )+ '-' + iif(LEN(ALLTRIM(STR(day(xdate))))=1 , "0" + ALLTRIM(STR(day(xdate))) , ALLTRIM(STR(day(xdate))) )


**= "'2023-08-15'"


*!*	xf_ini = "'" + xd1 + "'" 
*!*	xf_fin = "'" + xd2 + "'" 


*!*		xf_ini = "'2023-03-01'" 
*!*		xf_fin = "'2023-03-17'"

*!*	?	xf_ini , 	xf_fin 

A1 = "select a.fecha_movimiento ,a.docstatus ,a.codigo ,a.m_product_id , "
A2 = "		a.producto ,a.cantidad ,a.documentos ,c.name warehouse_n , "
A3 = "		b.value location_n ,x.qtyonhand  ,a.ad_client_id, now() time_report "
A4 = "from (select a.fecha_movimiento,a.docstatus ,a.codigo,a.m_product_id ,a.producto,sum(a.cantidad) cantidad , "
A5 = "		STRING_AGG(a.requisicion_interna,' - ' order by a.requisicion_interna ) documentos , max(a.ad_client_id ) ad_client_id  "
A6 = "	from rv_requisitions_internal a  "
A7 = "	where a.fecha_movimiento = now()::date and a.docstatus = 'CO' "
A8 = "	group by a.fecha_movimiento,a.docstatus ,a.codigo ,a.m_product_id ,a.producto  "
A9 = "	order by a.codigo) as a "
A10 = "	left join 	(select m_product_id,m_locator_id ,	sum(qtyonhand) qtyonhand ,ad_client_id  "
A11 = "					from m_storageonhand ms "
A12 = "					where qtyonhand > 0 group by ad_client_id,m_product_id,	m_locator_id  "
A13 = "		) as x on x.ad_client_id = a.ad_client_id and  x.m_product_id = a.m_product_id	 "
A14 = "		left join m_locator b on b.m_locator_id = x.m_locator_id "
A15 = "		left join m_warehouse c on c.m_warehouse_id = b.m_warehouse_id order by a.codigo	 "


xsql3 = 	A1 +	A2 +	A3 +	A4 +	A5 +	A6 +	A7 +	A8 +	A9 + ;
	A10 +	A11 +	A12 + a13 + a14 + a15 
	
*!*		+ a12_4 + 	A13 + a13_1 + a13_2 + a13_3 + a13_4 + a13_5 + a13_6 + a13_7 + a13_8 + ;	
*!*		A14 +	A15 +	A16 +	A17 +	A18 +	A19 + a19_1 + a19_2 + a19_3 + ;
*!*		A20 +	A21 +	A22 +	A23 +	A24 +	A25 +	A26 +	A27 +	A28 +	A29 + ;
*!*		A30 + 	A31 +	A32 +	A33 + A33_1 + A33_2 + A33_3 + 	A34 +	A35 +	A36 +	A37 +	A38 +	A39 + ;
*!*		A40 + 	A41 +	A42 +	A43 +	A44 + A44_1 + A44_2 + A44_3+ 	A45 +	A46 +	A47 +	A48 +	A49 + A50 
	
	
*!*		+ 	A51 +	A52 +	A53 +	A54 +	A55 +	A56 +	A57 +	A58 +	A59 + ;
*!*		A60 + 	A61 +	A62 +	A63 +	A64 +	A65 +	A66 +	A67 +	A68 +	A69 + ;
*!*		A70 + 	A71 +	A72 +	A73 +	A74 +	A75 +	A76 +	A77 +	A78 +	A79 + ;
	A80 + 	A81 +	A82 +	A83 +	A84


*!*	CREATE CURSOR mm2 (mm m(8))
*!*	SELECT mm2
*!*	APPEND BLANK 
*!*	REPLACE mm WITH xsql3
*!*	BROWSE
*!*	RETURN

	Set Message Off
	Set Notify Off
x1 = Datetime()
*!*	Set Exclusive On

pp_termometer('15 %', 100, 10)

Close Databases All
XRUTA = fp_leerdsn('dsn.TXT')
XCURSOR = 'CURSOR'

*?XRUTA
PRG_OPENCONNE_SERVER_NEW(XRUTA)

*xsql2 = "select * from cop_rv_c_invoiceline "
*!*	SELECT * FROM mm WHERE id = '8'
*!*	xsql2 = ALLTRIM(mm)




xresul =  PRG_OPENTABLE_NEW(XCURSOR ,xsql3)
SELECT &xcursor

*?	xresul

pp_termometer('40 %', 100, 10)

*!*	CREATE CURSOR mm (mm m(8))
*!*	SELECT mm
*!*	APPEND BLANK 
*!*	REPLACE mm WITH xsql2
*!*	RETURN

CREATE CURSOR xdefinition (FECHA_MOVIMIENTO T (8,0) NULL , DOCSTATUS C (2,0) NULL ,;
 CODIGO C (40,0) NULL , M_PRODUCT_ID N (12,0) NULL , PRODUCTO c (240,0) NULL , CANTIDAD N (20,1) NULL ,;
  DOCUMENTOS c (240,0) NULL , WAREHOUSE_N C (60,0) NULL , LOCATION_N C (40,0) NULL , QTYONHAND N (20,6) NULL ,;
   AD_CLIENT_ID N (20,0) NULL , TIME_REPORT T (8,0)  NULL )

 
PRG_APPE_ACURSOR('CURSOR','xdefinition')




Select  xdefinition

pp_termometer('50 %', 100, 10)

Select xdefinition
Go Top
pp_termometer('60 %', 100, 10)

Copy To COMPARATIVO_ENTREGAS_STOCK_ALMACEN.Xls Type Xl5


loPDF = PDF3()
Select xdefinition
*DELETE FOR ISNULL(m_product_n)
GO top
Report Form COMPARATIVO_ENTREGAS_STOCK_ALMACEN.FRX Object loPDF To File "COMPARATIVO_ENTREGAS_STOCK_ALMACEN.PDF"


pp_termometer('70 %', 100, 10)

m.cSender = "jose.ruiz@coposa.com"
m.cReceiver="ruizjose@gmail.com,ana.scarabellotto@coposa.com,alejandra.alvarez@coposa.com,jeffery.evies@coposa.com"
*m.cReceiver="ruizjose@gmail.com,ana.scarabellotto@coposa.com,alejandra.alvarez@coposa.com"

**m.cReceiver="ruizjose@gmail.com"
m.server = "correo.movistarcloud.com.ve"
m.port = 587
m.ssl = .T.
m.password = 'jr.Coposa22'

xrutfile = prg_direjecutables() + 'COMPARATIVO_ENTREGAS_STOCK_ALMACEN.pdf'
xrutfile2 = prg_direjecutables() + 'COMPARATIVO_ENTREGAS_STOCK_ALMACEN.xls'

m.attachments = xrutfile
m.attachments2 = xrutfile2

m.asunto = "Reporte COMPARATIVO ENTREGAS STOCK ALMACEN  " + Alltrim(Ttoc(Datetime()))
pp_termometer('90 %', 100, 10)

prg_send_email(M.cSender, M.cReceiver, m.server,m.port,m.ssl,m.password ,m.attachments ,m.attachments2,m.asunto)

pp_termometer('100 %', 100, 10)
pp_termometer('FIN', 100, 20)
prg_tiempo2(x1)

**escribir en idempiere en tabla x





	
		
	
