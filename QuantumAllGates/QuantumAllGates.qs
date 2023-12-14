namespace QuantumAllGates {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    
    @EntryPoint()
    operation main() : Int {
        use q = Qubit[3];

        X(q[0]);
        Y(q[0]);
        Z(q[0]);
        H(q[0]);
        T(q[0]);
        S(q[0]);
        Rx(PI(),q[0]);
        Ry(PI(),q[0]);
        Rz(PI(),q[0]);

        CNOT(q[0],q[1]);
        CCNOT(q[0],q[1],q[2]);

        ResetAll(q);

        return 0;
    }
}
