# [Ethernaut: Fallback]([url](https://github.com/Prodigysec/Ethernaut/new/main/1.%20Fallback/README.md#Ethernaut:%20Fallback))

### Challenge Description
You will beat this level if:

	 1. you claim ownership of the contract
	 2. you reduce its balance to 0

### Key Terminologies
1. **Fallback function**
    - Is a function that is executed when the specified function does not exist or when a trasaction is sent without any data. It is a public function, meaning it can be called from outside the contract and has no name. Its signature is an empty set of parentheses.

2. **Constructor function**
    - Is a function  used to initialize the state variables of the contract and perform any other setup that is required before the contract can be used.
    - It is executed only once; at the time of contract deployment


3. **receive function**
    - Special function that is automatically called when a contract receives a payment of Ether without any specific function call
    - is a function that is executed when a contract receives a transaction that does not match any of its defined functions
   
        
4. **Modifiers**
    - code snippets that can be used to change the behaviour of functions, or to add functionality to a contract
    - Are added to functions, if the condition is met, the func is executed
    
## Weakness
