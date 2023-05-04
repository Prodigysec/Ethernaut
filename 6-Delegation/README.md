# Ethernaut: Delegation

## Challenge description
    Claim ownership of the given instance
 
## Terminologies
   - **Method IDs** (function selectors) → are unique function identifiers used in contract function calls.
      - When a contract function is called, solidity compiler generates a four-byte method ID based on the function’s name and input parameters. used to identify the function.
      - In Soldity, the `Method Id` can be obtained by using the built-in `keccak256` function which calculates the SHA-3 hash of the input value which results to a 32-byte value. This can then be casted to `bytes4` to get the function’s Method ID (first 4 bytes).
   - **bytes4** → Fixed sized array that reps a four-byte value. Commonly used to store method IDs.
   - **Delegatecall** function → Function that causes code at a callee contract to be executed in context of the calling contract.
       - This allows for code reuseability.
       - When a function is executed with `delegatecall` function the following remain constant:
         + address 
         + msg.sender
         + msg.value
## Weaknesses
  
