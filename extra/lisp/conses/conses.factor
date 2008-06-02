! Copyright (C) 2008 James Cash
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences accessors ;

IN: lisp.conses 

TUPLE: cons car cdr ;
: cons \ cons new ;
    
: uncons ( cons -- cdr car )
    [ cdr>> ] [ car>> ] bi ;

: null? ( cons -- ? )
    uncons and not ;

: <car> ( x -- cons )
    cons swap >>car ;

: seq>cons ( seq -- cons )
    <reversed> cons [ <car> swap >>cdr ] reduce ;
    
: (map-cons) ( acc cons quot -- seq )    
    over null? [ 2drop ] [ [ uncons ] dip [ call ] keep swapd [ suffix ] 2dip (map-cons) ] if ;
    
: map-cons ( cons quot -- seq )
    [ { } clone ] 2dip (map-cons) ;