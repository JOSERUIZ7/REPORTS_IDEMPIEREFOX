Parameters xexecutable
If Empty(xexecutable)
	xexecutable = 'ETIQUETAS.EXE'
Endif

xlen = Len(xexecutable)
xs = xlen-2
If Substr(xexecutable, xs, 3)<>'EXE'
	Return
Endif
Dimension afiles[1]
Agetfileversion(afiles, xexecutable)
xversion = afiles(4)
_Screen.Caption = _Screen.Caption+'  -  Version: '+xversion
Release All
Endproc
