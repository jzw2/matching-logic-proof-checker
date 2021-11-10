
// #include "assert.h"

// int main() {
//     int i,j;
//     i = 1;
//     j = 10;
//     while (j >= i) {
//         i = i + 2;
//         j = -1 + j;
//     }
//     __VERIFIER_assert(j == 6);
//     return 0;
// }
//


module CGGMP2005

imports IMP

syntax Id ::= "i" [token]
            | "j" [token]

// The main goal
claim
  <k>
    int i, j ;
    i = 1 ;
    j = 10 ;

    // equiv to y += x; x = 0;
    while (i <= j) {
        i = i + 2 ;
        j = -1 + j ;
    }
    =>
    .
  </k>
  <state>
    .Map =>
    i |-> 9
    j |-> 6
  </state>

// inductive invariant for loop 1
claim
    <k>
        while (i <= j) {
            i = i + 2 ;
            j = -1 + j ;
        }
        => .
        ... // note we need these dots here to allow some unfinished computation
    </k>
    <state>
        i |-> (I:Int => (J -Int I +Int 3) /Int 3 *Int 2 +Int I)
        j |-> (J:Int => J -Int ((J -Int I +Int 3) /Int 3))
    </state>
    requires I <=Int J

// inductive invariant for loop 2

endmodule
