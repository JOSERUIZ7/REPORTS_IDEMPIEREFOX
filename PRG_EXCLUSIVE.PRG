parameters XTABLA
public Xmerror

*SI UNA TABLA PUEDE SER ABIERTA EXCLUSIVE LA ABRE Y RETORNA .T. SI NO RETORNA .F.

Xmerror = 0
on error do Perrhand with  error( )

if empty(XTABLA)
	clear
	XTABLA = 'COMPRA1'
endif

if used(XTABLA)
	select &XTABLA
else
	prg_aliasfree()
	use &XTABLA
	if Xmerror = 1705
		on error
		return .f.
	endif
endif

reindex
if Xmerror = 110
	select &XTABLA
	use
	prg_aliasfree()
	use &XTABLA exclusive
	if Xmerror = 1705
		on error
		return .f.
	endif
endif

on error
return .t.

procedure Perrhand
parameter merror
Xmerror = merror
