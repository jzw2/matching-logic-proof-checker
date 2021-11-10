
    // int i,j,k;
    // i = 0;
    // k = 9;
    // j = -100;
    // while (i <= 100) {
	// i = i + 1;
	// while (j < 20) {
	//     j = i + j;
	// }
	// k = 4;
	// while (k <= 3) {
	//     k = k + 1;
	// }
    // }
    // __VERIFIER_assert(k == 4);

module CGGMP2005B

imports IMP

syntax Id ::= "i" [token]
            | "j" [token]
            | "k" [token]

// The main goal
claim
  <k>
    int i, j, k ;
    i = 0;
    k = 9;
    j = -100;
    while (i <= 100) {
        i = i + 1;
        while (j < 20) {
            j = i + j;
        }
        k = 4;
        while (k <= 3) {
            k = k + 1;
        }
    }
    =>
    .
  </k>
  <state>
    .Map =>
    i |-> 101
    j |-> 20
    k |-> 4
  </state>

claim
  <k>
    while (i <= 100) {
        i = i + 1;
        while (j < 20) {
            j = i + j;
        }
        k = 4;
        while (k <= 3) {
            k = k + 1;
        }
    }
    =>
    . ...
  </k>
  <state>
    i |-> (I:Int => 101 )
    k |-> (J:Int => 20)
    k |-> (K:Int => 4)
  </state>
  requires I ==Int 1 andBool J <Int 20

claim
  <k>
    while (i <= 100) {
        i = i + 1;
        while (j < 20) {
            j = i + j;
        }
        k = 4;
        while (k <= 3) {
            k = k + 1;
        }
    }
    =>
    . ...
  </k>
  <state>
    i |-> (I:Int => 101 )
    k |-> (J:Int => 20)
    k |-> (K:Int => 4)
  </state>
  requires I >Int 1 andBool I <=Int 100 andBool J ==Int 20

endmodule
