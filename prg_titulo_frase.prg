 PARAMETER xfras
 IF EMPTY(xfras)
    RETURN ''
 ENDIF
 xl01 = LEN(xfras)
 xp01 = ''
 xfras01 = ''
 FOR i = 1 TO xl01
    xl01 = SUBSTR(xfras, i, 1)
    IF xl01=' '
       xfras01 = xfras01+prg_titulo(xp01)+' '
       xl01 = ''
       xp01 = ''
    ELSE
       xp01 = xp01+xl01
    ENDIF
 ENDFOR
 xfras01 = xfras01+prg_titulo(xp01)+' '
 xfras01 = ALLTRIM(xfras01)
 RETURN xfras01
ENDFUNC
**
