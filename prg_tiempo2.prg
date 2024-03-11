 PARAMETER z1
 x = DATETIME()-z1
 IF x<3600
    xd = x/60
    xt = ROUND(xd, 2)
    xent = INT(xt)
    xdec = (xt-xent)*100
    x1 = xdec*0.4 
    xdec = ROUND((xdec-x1), 2)
    xt = xent+xdec
    IF xent=0
       xent = '00'
    ELSE
       IF xent<10
          xent = '0'+ALLTRIM(STR(xent))
       ELSE
          xent = ALLTRIM(STR(xent))
       ENDIF
    ENDIF
    IF xdec<10
       xdec = '0'+ALLTRIM(STR(xdec))
    ELSE
       xdec = ALLTRIM(STR(xdec))
    ENDIF
    xt = '00:'+xent+':'+xdec
 ELSE
    xh = 0
    xm = 0
    xs = 0
    x1 = x/3600
    xh = INT(x1)
    x2 = (x1-xh)*100
    x2 = x2-(x2*0.40 )
    xm = INT(x2)
    x2 = (x2-INT(x2))*100
    x2 = x2-(x2*0.40 )
    xs = INT(x2)
    IF xh<10
       xh = '0'+ALLTRIM(STR(xh))
    ELSE
       xh = ALLTRIM(STR(xh))
    ENDIF
    IF xm<10
       xm = '0'+ALLTRIM(STR(xm))
    ELSE
       xm = ALLTRIM(STR(xm))
    ENDIF
    IF xs<10
       xs = '0'+ALLTRIM(STR(xs))
    ELSE
       xs = ALLTRIM(STR(xs))
    ENDIF
    xt = xh+':'+xm+':'+xs
 ENDIF
 RETURN xt
ENDFUNC
**
