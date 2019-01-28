# Avoiding Common Attacks
## External Calls
The only contract that could be considered to make an external call is Bounty, and that's through the use of the battle-tested PullPayment OpenZeppelin contract that it inherits from. No other external calls are implemented.

## Integer Overflow / Underflow
Integer overflow and underflow is prevented by the use of the SafeMath OpenZeppelin contract in place for uint256 and using uint256 exclusively for all integer values.

## Denial Of Service
Implementing the withdrawal pattern by inheriting from the PullPayment OpenZeppelin contract, denial of service attacks are mitigated.

## Reentrancy
This is also mitigated by the use of the PullPayment contract.