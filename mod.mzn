var 0..1000: s;
var 0..1000: p;

constraint 3*s + 2*p <= 200;
constraint s >= 10;
constraint p <= 60;

solve maximize 10000*s + 7000*p;

output [
    show(s), "\n",
    show(p), "\n",
    show(10000*s + 7000*p), "\n",
]
