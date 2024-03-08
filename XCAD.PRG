Parameters xtabla
Public xcad
 
*Use VENDEDORES
If Empty(xtabla )
	xtabla = Alias()
Endif
*CLOSE DATABASES all

Sele &xtabla

xtabla2 = xtabla + '2'
Wait Window xtabla2 NOWAIT
pp_cursor(xtabla,xtabla2)


Create Cursor mm ;
	(mm m(8))


Append Blank
Replace mm With xcad
pp_CAMPOS(xtabla,xtabla2)
Select mm
Append Blank
Replace mm With xcad

pp_ALTER(xtabla,xtabla2)
Select mm
Append Blank
Replace mm With xcad



pp_insert(xtabla,xtabla2)
Select mm
Append Blank
Replace mm With xcad

pp_sql(xtabla,xtabla2)
Select mm
Append Blank
Replace mm With xcad

BROWSE

