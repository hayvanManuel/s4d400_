*&---------------------------------------------------------------------*
*& Report z18_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z18_objects.

CLASS lcl_airplane DEFINITION.
    PUBLIC SECTION.

        TYPES:  BEGIN OF ts_attribute,
                 attribute TYPE string,
                 value TYPE string,
                END OF ts_attribute,
                tt_attributes TYPE STANDARD TABLE OF ts_attribute
                    WITH NON-UNIQUE KEY attribute.

        METHODS:
         set_attributes
                 IMPORTING
                     iv_name TYPE string
                     iv_planetype TYPE saplane-planetype,

         get_atttributes
                 EXPORTING
                     et_attributes TYPE tt_attributes.

        CLASS-METHODS
            get_n_o_airplanes
                EXPORTING
                    ev_number TYPE I.




    PRIVATE SECTION.

        DATA: mv_name TYPE string,
              mv_planetype TYPE saplane-planetype.

        CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.



  METHOD get_atttributes.
       et_attributes = VALUE #( ( attribute = 'NAME' value = mv_name )
                              ( attribute = 'PLANETYPE' value = mv_planetype )
                               ).

  ENDMETHOD.

  METHOD get_n_o_airplanes.
    ev_number = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD set_attributes.
        mv_name = iv_name.
        mv_planetype = iv_planetype.

        gv_n_o_airplanes += 1.
  ENDMETHOD.

ENDCLASS.

DATA: go_airplane TYPE REF TO lcl_airplane,
      gt_airplanes TYPE STANDARD TABLE OF REF TO lcl_airplane.


START-OF-SELECTION.

DO 3 TIMES.
    go_airplane = new #( ).
    gt_airplanes = VALUE #( BASE gt_airplanes (  go_airplane ) ).
 ENDDO.
