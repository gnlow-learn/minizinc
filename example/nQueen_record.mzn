include "all_different.mzn";

int: n = 8;

type Pos = record(var 1..n: x, var 1..n: y);

array [1..n] of var Pos: queens;

constraint all_different([queens[i].x | i in 1..n]);
constraint all_different([queens[i].y | i in 1..n]);
constraint all_different([queens[i].x + queens[i].y | i in 1..n]);
constraint all_different([queens[i].x - queens[i].y | i in 1..n]);

solve satisfy;

output [
    if j = 1 then "\n" else "" endif ++ 
    if exists(k in 1..n) (fix(queens[k].x) = j /\ fix(queens[k].y) = i)
      then " Q " 
      else " . " 
    endif
    | i in 1..n, j in 1..n 
];
