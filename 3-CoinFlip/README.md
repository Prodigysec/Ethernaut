# [Ethernaut: CoinFlip]([url](https://github.com/Prodigysec/Ethernaut/blob/main/3-CoinFlip/Contracts/CoinFlip.sol))

### Challenge Description
    Guess the correct outcome of a coin flip 10 times in a row

## Weakness
The weakness exists in the use of globaly accessible varibles to derive a random number.
```
function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
```
+ In the code snippet above, `blockValue` variable is predictable since block.number is a global variable that is publicly accessible.
+ `FACTOR` variable is a seed meant to increase randomness but that woun't be achieved since it is a constant.
+ With that in place, we are able to predict a correct coinflip with certainity.
