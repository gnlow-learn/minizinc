include "all_different.mzn";

int: n = 8;

array [1..n] of var 1..n: q;

constraint all_different(q);
constraint all_different([q[i] + i | i in 1..n]);
constraint all_different([q[i] - i | i in 1..n]);

solve satisfy;

output [ 
  if j = 1 then "\n" else "" endif ++ 
  if fix(q[j]) = i then " Q " else " . " endif 
  | i in 1..n, j in 1..n 
];
