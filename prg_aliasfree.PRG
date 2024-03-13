xnum_alias = 1

Do While .T.

	xalias = Alias(xnum_alias)
	If !Empty(xalias)
		xnum_alias = xnum_alias + 1
	Else

		Xalias01 = "SELECT " +  Alltrim(Str(xnum_alias))
		&Xalias01
		Return xnum_alias
		Exit
	Endif

Enddo
