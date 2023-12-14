OPENQASM 2.0;
include "qelib1.inc";
qreg q[32];
creg c[32];
x q[0];
y q[0];
z q[0];
h q[0];
t q[0];
s q[0];
Unhandled exception. System.InvalidCastException: Unable to cast object of type 'QSharpCommunity.Simulators.OpenQasmExporter.Exporter' to type 'Microsoft.Quantum.Intrinsic.Interfaces.IIntrinsicR'.
 ---> Microsoft.Quantum.Intrinsic.R on /Users/kevinchau/EECS/EECS254/Project/qsharpcode/QuantumAllGates/D:\a\1\s\submodules\qsharp-runtime\src\Simulation\TargetDefinitions\Intrinsic\R.qs:line 0
   at Microsoft.Quantum.Intrinsic.Rx on /Users/kevinchau/EECS/EECS254/Project/qsharpcode/QuantumAllGates/D:\a\1\s\submodules\qsharp-runtime\src\Simulation\TargetDefinitions\Decompositions\Rx.qs:line 0
   at QuantumAllGates.main on /Users/kevinchau/EECS/EECS254/Project/qsharpcode/QuantumAllGates/QuantumAllGates.qs:line 0

