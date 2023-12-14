OPENQASM 2.0;
include "qelib1.inc";
qreg q[32];
creg c[32];
Sampling a random number between 0 and 50: 
h q[0];
measure q[0] -> c[0];
h q[0];
measure q[0] -> c[0];
h q[0];
measure q[0] -> c[0];
h q[0];
measure q[0] -> c[0];
h q[0];
measure q[0] -> c[0];
h q[0];
measure q[0] -> c[0];
0
