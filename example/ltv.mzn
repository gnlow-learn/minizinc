int: N = 8;
array[1..N] of int: S = [1, 0, 1, 5, 36, 329, 3655, 47844];

int: MAX_PARAM = 5;
int: MAX_COEFF_VAL = 20;

var -MAX_PARAM..MAX_PARAM: alpha_A;
var -MAX_PARAM..MAX_PARAM: beta_A;

var -MAX_PARAM..MAX_PARAM: alpha_B;
var -MAX_PARAM..MAX_PARAM: beta_B;

var -MAX_PARAM..MAX_PARAM: alpha_C;
var -MAX_PARAM..MAX_PARAM: beta_C;

var -MAX_PARAM..MAX_PARAM: alpha_D;
var -MAX_PARAM..MAX_PARAM: beta_D;

constraint forall(n in 4..N) (
    let {
        var int: A_n = alpha_A * n + beta_A;
        var int: B_n = alpha_B * n + beta_B;
        var int: C_n = alpha_C * n + beta_C;
        var int: D_n = alpha_D * n + beta_D;
    } in 
    A_n >= -MAX_COEFF_VAL /\ A_n <= MAX_COEFF_VAL /\
    B_n >= -MAX_COEFF_VAL /\ B_n <= MAX_COEFF_VAL /\
    C_n >= -MAX_COEFF_VAL /\ C_n <= MAX_COEFF_VAL /\

    S[n] = A_n * S[n-1] + B_n * S[n-2] + C_n * S[n-3] + D_n
);

var int: total_complexity = abs(alpha_A) + abs(beta_A) + 
                            abs(alpha_B) + abs(beta_B) + 
                            abs(alpha_C) + abs(beta_C) +
                            abs(alpha_D) + abs(beta_D);

solve minimize total_complexity;

output [
  "--- 최적화 결과 (매개변수) ---\n",
  "A_n (s_{n-1} 계수): alpha=\(alpha_A), beta=\(beta_A)\n",
  "B_n (s_{n-2} 계수): alpha=\(alpha_B), beta=\(beta_B)\n",
  "C_n (s_{n-3} 계수): alpha=\(alpha_C), beta=\(beta_C)\n",
  "D_n (상수항): alpha=\(alpha_D), beta=\(beta_D)\n",
  "\n--- 추정된 점화식 (n >= 4) ---\n"
] ++ 
[
  "n=\(n): S[\(n)] = (\(alpha_A)*\(n) + \(beta_A))*S[\(n-1)] + (\(alpha_B)*\(n) + \(beta_B))*S[\(n-2)] + ... = \(S[n])\n"
  | n in 4..N
];
