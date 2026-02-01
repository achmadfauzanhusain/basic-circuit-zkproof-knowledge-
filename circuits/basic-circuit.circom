pragma circom 2.0.0;

template BasicCircuit() {
    signal input x;
    signal input y;
    signal output difference;
    signal output multiply;

    difference <== x - y;
    multiply <== x * y;
}

component main = BasicCircuit();