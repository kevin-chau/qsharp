namespace QuantumOneQubitHadamardMeasure {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation main() : Result {
        use q = Qubit();
        H(q);
        let c = M(q);
        return c;
    }
}