    // int x = 0;
    // int y = 50;
    // while(x < 100) {
	// if (x < 50) {
	//     x = x + 1;
	// } else {
	//     x = x + 1;
	//     y = y + 1;
	// }
    // }
module GJ2007

imports IMP

syntax Id ::= "x" [token]
            | "y" [token]

// The main goal
claim
  <k>

    int x,  y ;
    x = 0;
    y = 50;
    while(x < 100) {
        if (x < 50) {
            x = x + 1;
        } else {
            x = x + 1;
            y = y + 1;
        }
    }
    =>
    .
  </k>
  <state>
    .Map =>
    x |-> 100
    y |-> 100
  </state>

// inductive invariant for loop 1
claim
    <k>
        while(x < 100) {
            if (x < 50) {
                x = x + 1;
            } else {
                x = x + 1;
                y = y + 1;
            }
        }
        => .
        ... // note we need these dots here to allow some unfinished computation
    </k>
    <state>
        x |-> (X:Int => 100)
        y |-> (Y:Int => 50 +Int Y)
    </state>
    requires X <Int 50

claim
    <k>
        while(x < 100) {
            if (x < 50) {
                x = x + 1;
            } else {
                x = x + 1;
                y = y + 1;
            }
        }
        => .
        ... // note we need these dots here to allow some unfinished computation
    </k>
    <state>
        x |-> (X:Int => 100)
        y |-> (Y:Int => 100 -Int X +Int Y)
    </state>
    requires X >=Int 50 andBool X <Int 100
endmodule
