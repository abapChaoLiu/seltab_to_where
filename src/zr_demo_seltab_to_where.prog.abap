*&---------------------------------------------------------------------*
*& Report ZR_DEMO_SELTAB_TO_WHERE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zr_demo_seltab_to_where.

DATA: lt_seltab      TYPE zcl_abap_seltab_to_where=>tt_named_seltables,
      lt_rng_carrid  TYPE RANGE OF sflight-carrid,
      lt_rng_initial TYPE RANGE OF sflight-carrid.

lt_rng_carrid = VALUE #(
sign = 'I' option = 'EQ' ( low = 'ABC' )
sign = 'I' option = 'NE' ( low = 'ABC' )
sign = 'I' option = 'GT' ( low = 'ABC' )
sign = 'I' option = 'LT' ( low = 'ABC' )
sign = 'I' option = 'GE' ( low = 'ABC' )
sign = 'I' option = 'LE' ( low = 'ABC' )
sign = 'I' option = 'BT' ( low = 'ABC' high = 'ABC' )
sign = 'E' option = 'EQ' ( low = 'ABC' )
sign = 'E' option = 'NE' ( low = 'ABC' )
sign = 'E' option = 'GT' ( low = 'ABC' )
sign = 'E' option = 'LT' ( low = 'ABC' )
sign = 'E' option = 'GE' ( low = 'ABC' )
sign = 'E' option = 'LE' ( low = 'ABC' )
sign = 'E' option = 'BT' ( low = 'ABC' high = 'ABC' )
).

lt_rng_initial = VALUE #(
sign = 'I' option = 'BT' ( low = 'ABC' high = 'ABC' )
).

lt_seltab = VALUE #(
( name = 'CARRID' dref = REF #( lt_rng_carrid ) )
( name = 'CARRID_INITIAL' dref = REF #( lt_rng_initial ) )

).

DATA(lv_where) = zcl_abap_seltab_to_where=>combine_seltabs(
                   it_named_seltabs  = lt_seltab
                   ).

cl_demo_output=>new(
 )->begin_section( 'KKW'
 )->end_section(
  )->write_data( lv_where
  )->display( ).
