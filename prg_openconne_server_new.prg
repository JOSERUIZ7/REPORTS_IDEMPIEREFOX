Parameters XRUTA

Public xOBJCONN

XRUTA = Alltrim(XRUTA)


xOBJCONN=Sqlstringconnect(XRUTA)
If xOBJCONN = -1
	Wait Window 'ERROR DE CONEXION'
	RESULT = .F.
	RETURN .F.
	ELSE
	RESULT = .T.
Endif

= SQLSETPROP(xOBJCONN, 'asynchronous', .F.)
*= SQLSETPROP(xOBJCONN, 'PacketSize',18192)
= SQLSETPROP(xOBJCONN, 'PacketSize',36384)


Return xOBJCONN 

 