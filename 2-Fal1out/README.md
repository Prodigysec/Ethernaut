# [Ethernaut: Fal1out]([url](https://github.com/Prodigysec/Ethernaut/edit/main/2-Fal1out/README.md#ethernaut:%20Fal1out))

### Challenge Description
    Claim ownership of the contract

## Weakness
The weakness exists in the implementaion of the constructor function as shown in code below:
  ```
  /* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }
  ```
  +  The constructor function has  not been explicitly set, therefore state variables will have default values
  +  Calling the Fal1out function using an address other than the address used to deploy the contract results to the address being set as the owner. This results to an account takeover.

## Solution
1. Deploy smart contract.
2. Allocate some `ether`, check allocatorBalance and view owner’s address.
3. Call the Fal1out function, which sets the owner state variable to your address.
4. Check the owner of the contract. This time the owner of the contract is set to your address.

## Takeaways
- Before Solidity versions <0.5.0 it was best practice to ensure that your constructor had the same name as the contract name. That way the EVM knew what constructor name to use.

## Real case scenario
+ [Rubixi Hack](https://hackenproof.com/vulnerabilities/5bd1ac7a75fa7418019cf8e1)
  
