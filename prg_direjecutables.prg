 xexecutable = ALLTRIM(SYS(16, 0))
 xlen = LEN(xexecutable)
 xdir = ''
 FOR i = 1 TO xlen
    xl = SUBSTR(xexecutable, xlen-i, 1)
    IF xl='\'
       i = xlen-i
       xdir = SUBSTR(xexecutable, 1, i)
       IF SUBSTR(xdir, 2, 1)<>":"
          xdir = CURDIR()
       ENDIF
       RETURN xdir
       EXIT
    ENDIF
 ENDFOR
 IF EMPTY(xdir)
    xdir = CURDIR()
 ENDIF
 RETURN xdir
ENDFUNC
**
