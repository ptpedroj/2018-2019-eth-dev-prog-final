# Design Pattern Decisions
## Circuit Breaker
The circuit breaker pattern is implemented by having all contracts inherit the OpenZeppelin Pausable contract. The contract provides a robust mechanism by which to apply modifiers that disable or enable contract functions by whether they can act during a paused state or not. In other words, a contract should be paused when no state changes should generally be allowed, while emergency actions can be setup to operate only when the contract is paused (e.g. paying out a reward, etc.).

## Pull Over Push Payments
The Pull Over Push Payments pattern is implemented by inheriting the PullPayment OpenZeppelin contract. It is used in the Bounty contract, since that is where a "Bounty Poster" can approve a submission and allow the "Bounty Hunter" to collect payment.

## Fail Early and Fail Loud
This is mainly implemented by inheriting the Ownable OpenZeppelin contract. It is used to restrict access to certain key functions to the set owner of the contracts, e.g. the Bounty Poster over the approval and rejection methods of the Bounty contract, or the Bounty Hunter updating their submission. These methods will fail immediately if someone other than the owner account attempts to call them.

## Restricting Access
No state variables in any of the contracts are public. All must be read and set view contract methods.

## Mortal
It seems that Mortal has lost favor in lieu of using the Circuit Breaker to disable a contract. One reason is that ether is not lost if anyone accidently pays the disabled contract; it would be irretrievable if sent to a killed contract.