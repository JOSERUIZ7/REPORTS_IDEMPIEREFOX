Select xalfa
Go Top
Scan While .T.

	Xd_week = Alltrim(d_week)
	Xd_column = Alltrim(d_column)

	Update xdefinition Set &Xd_column = invoiceopen Where d_week = Xd_week
Endscan
