*&---------------------------------------------------------------------*
*& Report z18_karl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z18_karl.

INTERFACE animal.

  DATA:
       lv_name TYPE c LENGTH 20,
       lv_is_hungry TYPE abap_bool,
       lv_gender type c LENGTH 1,
       lv_color type c LENGTH 20,
       lt_food type STANDARD TABLE OF string with EMPTY KEY.

    METHODS:
        eat
            IMPORTING
                lv_food TYPE string
            RETURNING
                VALUE(failure) TYPE string,
        move,
        sleep.


ENDINTERFACE.










*DATA: gt_fEvents TYPE TABLE OF Z00_EVENTS,
*      gv_loDATE TYPE DATE,
*      gv_cEIS TYPE p DECIMALS 2,
*      gv_cHan TYPE p DECIMALS 2,
*      gv_cKar TYPE p DECIMALS 2,
*      gt_dEvents TYPE Z00_EVENTS.
*
*
*
*gv_loDATE = sy-datlo.
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_adult
*WHERE kind = 'EH'
*INTO @DATA(pEIS_Adult).
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_child
*WHERE kind = 'EH'
*INTO @DATA(pEIS_Child).
*
*gv_cEis = pEIS_Adult + 4 * pEIS_Child.
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_adult
*WHERE kind = 'HB'
*INTO @DATA(pHAN_Adult).
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_child
*WHERE kind = 'HB'
*INTO @DATA(pHAN_Child).
*
*gv_cHan = 2 * pEIS_Adult + pEIS_Child.
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_adult
*WHERE kind = 'KR'
*INTO @DATA(pKAR_Adult).
*
*SELECT SINGLE FROM Z00_EVENTS FIELDS price_child
*WHERE kind = 'KR'
*INTO @DATA(pKAR_Child).
*
*gv_cKar = 3 * pKar_Adult + 6 * pKar_Child.




*WRITE: gv_cEis,
*       gv_cHan,
*       gv_cKar.





*SELECT FROM Z00_EVENTS FIELDS *
*    WHERE event_date > @gv_loDate
*    INTO TABLE @gt_fEvents.


* TRY.
*    cl_salv_table=>factory(
*        IMPORTING
*          r_salv_table = DATA(alv)
*        CHANGING
*          t_table = gt_fEvents
*      ).
*  CATCH cx_root.
*ENDTRY.
*
*alv->display( ).
