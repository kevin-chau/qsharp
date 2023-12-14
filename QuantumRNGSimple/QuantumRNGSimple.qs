namespace ComputationalMindset.QuantumExperiments
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    operation RandomNumberGenerator() : Int
    {
        use q = Qubit[5]
        {
            H(q[0]);
            H(q[1]);
            H(q[2]);
            H(q[3]);
            H(q[4]);

            let result = [M(q[0]), M(q[1]), M(q[2]), M(q[3]), M(q[4])];

            ResetAll(q);
            return ResultArrayAsInt(result);
        }
    }

    @EntryPoint()
    operation Main() : Int {
        Message($"Generating a random 5-bit number: ");
        return RandomNumberGenerator();
    }
}