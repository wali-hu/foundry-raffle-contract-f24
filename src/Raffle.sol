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
    address payable[] private s_players;
    ///  @dev the duration if lottery in seconds
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;

    //Events:
    event Entered_Raffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        //require(msg.value >= i_entranceFee, "SendMoreToEnterRaffle");
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit Entered_Raffle(msg.sender);
    }

    function pickWinner() external view {
        // check to see of enough time has passed!
        if ((block.timestamp - s_lastTimeStamp) > i_interval) {
            revert();
        }
    }

    //Getter Function:
    function getEntrancefee() public view returns (uint256) {
        return i_entranceFee;
    }
}
