**
FUNCTION acttherm
 LPARAMETERS m.text, m.prompt
 LOCAL m.prompt
 PUBLIC m.g_thermwidth
 IF EMPTY(m.prompt)
    m.prompt = SPACE(55)
 ELSE
    m.prompt = PADR(m.prompt, 49)
 ENDIF
 IF TXTWIDTH(m.prompt, "MS Sans Serif", 8.000 , "B")>49
    DO WHILE TXTWIDTH(m.prompt+"...", "MS Sans Serif", 8.000 , "B")>49
       m.prompt = LEFT(m.prompt, LEN(m.prompt)-1)
    ENDDO
    m.prompt = m.prompt+"..."
 ENDIF
 DEFINE WINDOW thermomete AT INT((SROWS()-((5.615 *FONTMETRIC(1, "MS Sans Serif", 8.000 , "B"))/FONTMETRIC(1, WFONT(1, ""), WFONT(2, ""), WFONT(3, ""))))/2), INT((SCOLS()-((63.833 *FONTMETRIC(5.615 , "MS Sans Serif", 8.000 , "B"))/FONTMETRIC(6, WFONT(1, ""), WFONT(2, ""), WFONT(3, ""))))/2) SIZE   5.615 ,  63.833  FONT "MS Sans Serif", 8.000  STYLE "B" NOFLOAT NOCLOSE NONE COLOR RGB(0,0,0,192,192,192)
 MOVE WINDOW thermomete CENTER
 ACTIVATE WINDOW NOSHOW thermomete
 @   0.500 , 3 SAY m.text FONT "MS Sans Serif", 8.000  STYLE "B"
 @   1.500 , 3 SAY m.prompt FONT "MS Sans Serif", 8.000  STYLE "B"
 @   0.000 ,   0.000  TO   0.000 ,  63.833  COLOR RGB(255,255,255,255,255,255)
 @   0.000 ,   0.000  TO   5.615 ,   0.000  COLOR RGB(255,255,255,255,255,255)
 @   0.385 ,   0.667  TO   5.231 ,   0.667  COLOR RGB(128,128,128,128,128,128)
 @   0.308 ,   0.667  TO   0.308 ,  63.167  COLOR RGB(128,128,128,128,128,128)
 @   0.385 ,  63.000  TO   5.308 ,  63.000  COLOR RGB(255,255,255,255,255,255)
 @   5.231 ,   0.667  TO   5.231 ,  63.167  COLOR RGB(255,255,255,255,255,255)
 @   5.538 ,   0.000  TO   5.538 ,  63.833  COLOR RGB(128,128,128,128,128,128)
 @   0.000 ,  63.667  TO   5.615 ,  63.667  COLOR RGB(128,128,128,128,128,128)
 @   3.000 ,   3.333  TO   4.231 ,   3.333  COLOR RGB(128,128,128,128,128,128)
 @   3.000 ,  60.333  TO   4.308 ,  60.333  COLOR RGB(255,255,255,255,255,255)
 @   3.000 ,   3.333  TO   3.000 ,  60.333  COLOR RGB(128,128,128,128,128,128)
 @   4.231 ,   3.333  TO   4.231 ,  60.500  COLOR RGB(255,255,255,255,255,255)
 m.g_thermwidth = 56.269 
 SHOW WINDOW TOP thermomete
 RETURN ""
 SET STEP ON
ENDFUNC
**
FUNCTION updtherm
 LPARAMETERS lntotal, lnvalor, m.prompt
 LOCAL m.nblocks, lntotal, lnvalor, m.percent, m.prompt
 m.percent = (lnvalor/lntotal)*100
 IF  .NOT. WEXIST("thermomete")
    RETURN
 ENDIF
 ACTIVATE WINDOW thermomete
 m.percent = MIN(m.percent, 100)
 IF EMPTY(m.prompt)
    m.prompt = SPACE(55)
 ELSE
    m.prompt = PADR(m.prompt, 49)
 ENDIF
 m.nblocks = (m.percent/100)*(m.g_thermwidth)
 IF TXTWIDTH(m.prompt, "MS Sans Serif", 8.000 , "B")>49
    DO WHILE TXTWIDTH(m.prompt+"...", "MS Sans Serif", 8.000 , "B")>49
       m.prompt = LEFT(m.prompt, LEN(m.prompt)-1)
    ENDDO
    m.prompt = m.prompt+"..."
 ENDIF
 @   1.500 , 3 SAY m.prompt FONT "MS Sans Serif", 8.000  STYLE "B"
 @   3.000 ,   3.333  TO   4.231 , m.nblocks+3.333  PATTERN 1 COLOR RGB(128,128,128,128,128,128)
 RETURN ""
ENDFUNC
**
FUNCTION deactthermo
 RELEASE m.g_thermwidth
 IF WEXIST("thermomete")
    RELEASE WINDOW thermomete
 ENDIF
 RETURN ""
ENDFUNC
**
