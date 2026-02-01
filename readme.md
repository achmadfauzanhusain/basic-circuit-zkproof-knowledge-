CIRCUIT STEP BY STEP
- compile circuit : circom circuits/[circuit-name].circom --r1cs --wasm --sym -o outputs
- install pot10.ptau : curl -L https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_10.ptau -o outputs/pot10.ptau
- setup zkey : npx snarkjs groth16 setup outputs/[circuit-name].r1cs outputs/pot10.ptau outputs/[circuit-name]-final.zkey
- setup verification-key.json : npx snarkjs zkey export verificationkey outputs/[circuit-name]-final.zkey outp
uts/verification-key.json
- setup witness : node outputs/[circuit-name]_js/generate_witness.js outputs/[circuit-name]_js/[circuit-name].wasm inputs/input.json outputs/witness.wtns
- this prove later can make file proof.json & public.json : npx snarkjs groth16 prove outputs/[circuit-name]-final.zkey outputs/witness.wtns outputs/proof.json outputs/public.json
- verify : npx snarkjs groth16 verify outputs/verification-key.json outputs/public.json outputs/proof.json