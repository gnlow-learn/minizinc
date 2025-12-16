include "all_different.mzn";
include "lex_lesseq.mzn";

int: n = 4;
array[1..n] of var 1..n: s;

constraint all_different(s);

array[1..n] of var 1..n: s_reverse =
    [s[n-i+1] | i in 1..n];

constraint lex_lesseq(s, s_reverse);

solve satisfy;

output [
    show(s),
];
