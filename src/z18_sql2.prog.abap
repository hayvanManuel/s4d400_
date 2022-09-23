*&---------------------------------------------------------------------*
*& Report z18_sql2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z18_sql2.

DATA: gt_flights TYPE d400_t_flights,
      gv_carr TYPE s_carr_id,
      gv_conn TYPE s_conn_id.

PARAMETERS: p_carr TYPE s_carr_id,
            p_conn TYPE s_conn_id.

gv_carr = p_carr.
gv_conn = p_conn.

SELECT FROM SFLIGHT FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
    WHERE carrid = @gv_carr
    INTO TABLe @gt_flights.

TRY.
    cl_salv_table=>factory(
        IMPORTING
          r_salv_table = DATA(alv)
        CHANGING
          t_table = gt_flights
      ).
  CATCH cx_root.
ENDTRY.

alv->display( ).
