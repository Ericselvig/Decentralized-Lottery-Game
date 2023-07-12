// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "../../script/Interactions.s.sol";
import {DeployRaffle} from "../../script/DeployRaffle.s.sol";
import {Raffle} from "../../src/Raffle.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";

contract InteractionsTest is Test {
    Raffle raffle;
    HelperConfig helperConfig;
    address PLAYER = makeAddr("player");
    uint256 constant STARTING_USER_BALANCE = 10 ether;

    function setUp() public {
        DeployRaffle deployRaffle = new DeployRaffle();
        (raffle, helperConfig) = deployRaffle.run();
        vm.deal(PLAYER, STARTING_USER_BALANCE);
    }

    function testUserCanCreateSubscriptions() external {
        (, , address vrfCoordinator, , , , , uint256 deployerKey) = helperConfig
            .activeNetworkConfig();
        CreateSubscription createSubscription = new CreateSubscription();
        createSubscription.createSubscription(vrfCoordinator, deployerKey);
    }
}
