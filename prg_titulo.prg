 PARAMETER xfrase001
 xlen001 = LEN(xfrase001)
 xfrase002 = SUBSTR(LOWER(xfrase001), 2)
 xfrase001 = SUBSTR(UPPER(xfrase001), 1, 1)+xfrase002
 RETURN xfrase001
ENDFUNC
**
