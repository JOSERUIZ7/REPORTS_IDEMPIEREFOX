
#Define _CR Chr(13)+Chr(10)

Lparameter M.t1

Local M.cSender, M.cReceiver
Pcount = 1
*!* M.cSender = "jhernancanom@hotmail.com"
m.cReceiver="ruizjose@gmail.com,ana.scarabellotto@coposa.com"
m.cSender = "jose.ruiz@coposa.com"
*!* M.cReceiver=M.cSender

Local oSmtp
oSmtp 			= Createobject("CsFoxySmtp")
*!* oSmtp.server	= "smtp.office365.com"
*!* oSmtp.server	= "smtp-mail.outlook.com"
*!* oSmtp.server	= "smtp.live.com"
*!* oSmtp.port 		= 587
*!* oSmtp.port 		= 25

*oSmtp.Server	= "smtp.gmail.com"

oSmtp.Server	= "correo.movistarcloud.com.ve"
oSmtp.port      = 587   && 25 &&587 && 465  && Antonio dice: el puerto debe ser 587.
oSmtp.ssl 		= .T.

oSmtp.User 		= M.cSender
oSmtp.Password 	= Alltrim(Inputbox("Digite la contraseņa:",'','jr.Coposa22')) && ok (contr apl)

oSmtp.From 		= M.cSender
oSmtp.subjet 	= vAsunto( (Pcount()>0) )  && "Asunto del Correo 1"
oSmtp.bodyHtml  = .T.
oSmtp.body 		= vMensaje() && "Cuerpo del mensaje de Correo"
*!* oSmtp.priority 	= 2
oSmtp.AddTo(M.cReceiver)
**If Pcount()>0
*?Fullpath(Forceext(Sys(16),'PRG'))
*	oSmtp.AddAttachments(Fullpath(Forceext(Sys(16),'PRG')))
**oSmtp.AddAttachments = "c:\desarrollo\reports_idempierefox\xborra.pdf"
oSmtp.AddAttachments("c:\desarrollo\reports_idempierefox\xborra.pdf")
*oSmtp.AddAttachments("c:\desarrollo\reports_idempierefox\sample-ameza-2021-06-29.prg")

**Endif


**?oSmtp.Smtp()

If oSmtp.Smtp()
	Wait Windows "Correo Enviado OK"
Else
	Messagebox(oSmtp.Error, 0+48, "Error")
Endif





Procedure vAsunto(M.t1)
Local M.cCad1
m.cCad1 = ''
If M.t1
	m.cCad1 = "Ejemplo de enviar emails con VFP y csFoxySmtp con adjunto"
Else
	m.cCad1 = "Ejemplo de enviar emails con VFP y csFoxySmtp sin adjunto"
Endif
*!* MessageBox(M.cCad1)
Return Alltrim(M.cCad1)


Procedure vMensaje
Local M.cCad
m.cCad = '<!DOCTYPE html> <html> <head> <title>Enviando emails con VFP y csFoxySmtp</title> </head> <body>'
m.cCad = M.cCad +_CR+ Repli('-',40)
m.cCad = M.cCad +_CR+ 'Enviando emails con VFP y csFoxySmtp!!!!!!!!!'
m.cCad = M.cCad +_CR+ Repli('-',40)
m.cCad = M.cCad +_CR+ 'Escenario: '
m.cCad = M.cCad +_CR+ Repli('-',40)
Local oSmtp
oSmtp = Createobject("CsFoxySmtp")
m.cCad = M.cCad +_CR+ 'csFoxySmtp: v'+Tran(oSmtp.Version )
m.cCad = M.cCad +_CR+ Repli('-',40)
m.cCad = M.cCad +_CR+ Version()
m.cCad = M.cCad +_CR+ Iif( Type("_WIN64")="L" .And. _WIN64 , '64 bits' , '32 bits' )
m.cCad = M.cCad +_CR+ Repli('-',40)
m.cCad = M.cCad +_CR+ ShowOS()
m.cCad = M.cCad +_CR+ Iif( 'WOW64' $ Upper(GetWow64()) , '64 bits' , '32 bits' )
m.cCad = M.cCad +_CR+ Repli('-',40)
m.cCad = M.cCad +_CR+ '</body> </html>'
**--
Messagebox(M.cCad)
Return Substr(M.cCad,2)


Procedure ShowOS(M.t1)

Local tt(15), _K, M.cWin
m.tt=''  &&
m.cWin=''  &&
Do Case
Case !Empty(M.t1)
	m.cWin = M.t1
Case !Empty(Getenv([ComSpec]))
	m.cWin = Alltrim(Getenv([ComSpec]))
Endcase

Do Case
Case !Empty(M.cWin) And File(M.cWin)
** Ok...
Case File('C:\windows\system32\win.com')
	m.cWin = 'C:\windows\system32\win.com'
Case File('C:\windows\system32\cmd.exe')
	m.cWin = 'C:\windows\system32\cmd.exe'
Endcase

If !Empty(M.cWin)
	=Agetfileversion(tt,M.cWin)
Endif

Local M.cCad2
m.cCad2 = ''
m.cCad2 = M.cCad2 +_CR+ M.cWin
m.cCad2 = M.cCad2 +_CR+ 'Product Name   : '+tt(10)
m.cCad2 = M.cCad2 +_CR+ 'File Version   : '+tt(04)
m.cCad2 = M.cCad2 +_CR+ 'Product Version: '+tt(11)

m.cCad2 = ''
m.cCad2 = M.cCad2 +_CR+tt(10)
m.cCad2 = M.cCad2 +_CR+tt(11)

*!* MessageBox(M.cCad2)

Return Substr(M.cCad2,2)
Endproc


Function GetWow64&& GetSpecialFolderPath
Lparameters M.tnCLSIDValue
If Pcount()=0 Or Empty( M.tnCLSIDValue)
	m.tnCLSIDValue = 0x29
Endif

Local M.lcReturn

m.lcReturn = Space(254)

Declare SHGetSpecialFolderPath In SHELL32.Dll ;
	long hwndOwner, ;
	string @cSpecialFolderPath, ;
	long nWhichFolder

SHGetSpecialFolderPath(0, @M.lcReturn, M.tnCLSIDValue)

Return M.lcReturn

Endfunc && GetSpecialFolderPath

**
