// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Ticket {

    address owner;
    address ROUTER;

    uint256 price;
    
    bool active;

    function buy() payable external returns (bool) {
        require(active == true, "This item is sold out.");
        require(msg.value == price);



        return true;
    }
}