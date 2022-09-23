*&---------------------------------------------------------------------*
*& Report z18_structure
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z18_structure.

TYPES: BEGIN OF ts_complete,
        carrid TYPE d400_struct_s1-carrid,
        connid TYPE d400_struct_s1-connid,
        cityfrom TYPE d400_struct_s1-cityfrom,
        cityto TYPE d400_struct_s1-cityto,
        fldate TYPE d400_s_flight-fldate,
        planetype TYPE d400_s_flight-planetype,
        seatsmax TYPE d400_s_flight-seatsmax,
        seatsocc TYPE d400_s_flight-seatsocc,
     END OF ts_complete.

DATA: gs_conn TYPE Z18_connection,
     gs_flight TYPE d400_s_flight,
     gs_complete TYPE ts_complete.

gs_conn = VALUE #( CARRID = 'LH'
                  CONNID = '0400'
                  CITYFROM = 'FRANKFURT'
                  CITYTO = 'NEW YORK').


CALL FUNCTION 'Z_00_GET_NEXT_FLIGHT'
    EXPORTING
        iv_carrid = gs_conn-CARRID
        iv_connid = gs_conn-CONNID
    IMPORTING
        es_flight = gs_flight
    EXCEPTIONS
        no_data.

gs_complete = CORRESPONDING #( BASE ( gs_complete ) gs_conn ).
gs_complete = CORRESPONDING #( BASE ( gs_complete ) gs_flight ).

WRITE: gs_complete-carrid,
       gs_complete-connid,
       gs_complete-cityfrom,
       gs_complete-cityto,
       gs_complete-fldate,
       gs_complete-planetype,
       gs_complete-seatsmax,
       gs_complete-seatsocc.
