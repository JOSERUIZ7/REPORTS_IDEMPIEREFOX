 PUBLIC salir
 xconexion = .T.
 ON ERROR DO errores
 xorigen = ALLTRIM(SYS(5)+CURDIR())
 xdirejecutable = SYS(5)+CURDIR()+'PV_CONEXION.MEM'
 DO WHILE .T.
    IF FILE(xdirejecutable)
       RESTORE FROM &xdirejecutable ADDITIVE
       xconexion = .T.
       WAIT WINDOW NOWAIT "Conectando a Servidor"
       SET DEFAULT TO " "+xdirpred
       IF  .NOT. xconexion
          salir = .F.
          RETURN .F.
          EXIT
       ENDIF
       WAIT WINDOW NOWAIT "Conectado"
       _SCREEN.tag = xorigen
       ON ERROR
       EXIT
    ELSE
       xdirpred = GETDIR("C:\", "Seleccione El Servidor")
       IF LASTKEY()=27 .OR. EMPTY(xdirpred)
          RETURN .F.
          EXIT
       ENDIF
       WAIT WINDOW NOWAIT "Conectando a Servidor"
       SET DEFAULT TO " "+xdirpred
       IF  .NOT. FILE("PLANTAS.dbf")
          x = MESSAGEBOX("Servidor No Localizado Reintentelo de Nuevo", 037, "Alerta Del Sistema")
          IF x=4
             LOOP
          ELSE
             RETURN .F.
             EXIT
          ENDIF
       ELSE
          WAIT WINDOW NOWAIT "Conectado"
          _SCREEN.tag = xorigen
          ON ERROR
          SAVE TO &xdirejecutable
          EXIT
       ENDIF
    ENDIF
 ENDDO
 ON ERROR
 IF  .NOT. xconexion
    salir = .F.
    RETURN .F.
 ENDIF
ENDFUNC
**
FUNCTION ERRORES
 IF ERROR()=202
    MESSAGEBOX("La Ubicacion de La Data en El Servidor No A Sido Localizada, Posiblemente fue Movida O El Servidor Esta Apagado; El Programa Se Apagara, Reinicielo Y Localice La Ubicacion Del Servidor En La Red", 64, "Alerta Del Sistema")
    xdirejecutable = SYS(5)+CURDIR()+'PV_CONEXION.MEM'
    ON ERROR
    xconexion = .F.
    RETURN .F.
 ENDIF
ENDFUNC
**
