# Ethernaut: Telephone

## Challenge description
    Claim ownership of the contract to complete the level.

## Terminologies:
   1. `msg.sender` → The immediate sender of the transaction.
   
   2. `tx.origin` → The original sender of a transaction. A chain of transactions (that occur as a result of a previous transaction) originate from a genesis transaction initiated by its msg.sender (`tx.origin` of the chain of transactions).

## Weakness
  - Use of tx.origin for authorization.
    - This leaves your contract vulnerable to a phishing-like attack, where an attacker contract can pose as a different contract to achieve a malicious transaction.

## Takeaways
  - Use `msg.sender` while checking for authorisation of ownership instead of `tx.origin`.
