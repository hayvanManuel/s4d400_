*&---------------------------------------------------------------------*
*& Report z18_peter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z18_peter.

PARAMETERS: p_input1 TYPE i,
            p_input2 TYPE c,
            p_input3 TYPE i.

DATA(erg) = 0.

IF p_input2 EQ '+'.
    erg = p_input1 + p_input3.
ELSEIF p_input2 EQ '-'.
    erg = p_input1 - p_input3.
ELSEIF p_input2 EQ '*'.
    erg = p_input1 * p_input3.
ELSEIF p_input2 EQ '/'.
    erg = p_input1 / p_input3.
ELSEIF p_input2 EQ '^'.

    DATA(i) = p_input3 - 1.
    erg = p_input1.

    WHILE i GT 0.

        erg *= p_input1.
        i -= 1.

    ENDWHILE.

ELSEIF p_input2 EQ '%'.

    DATA ergP TYPE s4d400_percentage.
    CALL FUNCTION 'S4D400_CALCULATE_PERCENTAGE'
        EXPORTING
            iv_int1 = p_input1
            iv_int2 = p_input3
        IMPORTING
            ev_result = ergP.

ELSE.
    WRITE 'ENTER VALID OPERATOR'.
ENDIF.

WRITE erg.
