namespace QuantumOneQubit {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation main() : Result {
        use q = Qubit();
        let c = M(q);
        return c;
    }
}