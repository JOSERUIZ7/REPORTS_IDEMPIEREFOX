SELECT xdefinition 

loPDF = PDF3()

REPORT FORM xborra.FRX OBJECT loPDF TO FILE "xborra.PDF" 



	m.cSender = "jose.ruiz@coposa.com"
	m.cReceiver="ruizjose@gmail.com,ana.scarabellotto@coposa.com"
	m.server = "correo.movistarcloud.com.ve"
	m.port = 587
	m.ssl = .T.
	m.password = 'jr.Coposa22'
	m.attachments = "c:\desarrollo\reports_idempierefox\xborra.pdf"
	
prg_send_email(M.cSender, M.cReceiver, m.server,m.port,m.ssl,m.password ,m.attachments ,m.asunto)
