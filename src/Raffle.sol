// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title A Raffle Smrat Contract
 * @author Muhammad Abdullah
 * @notice This contract is for creating a raffle
 * @dev Immmplements Chainlink VRFv2.5
 */

contract Raffle {
    //Errors:
    error Raffle__SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        //require(msg.value >= i_entranceFee, "SendMoreToEnterRaffle");
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
    }

    function pickWinner() public {}

    //Getter Function:
    function getEntrancefee() public view returns (uint256) {
        return i_entranceFee;
    }
}
