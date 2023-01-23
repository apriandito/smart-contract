// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleContract {
    // State variable to store a value
    uint value;

    // Event to notify when the value is set
    event ValueSet(uint newValue);

    // Modifier to check if msg.sender is the owner of the contract
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // Function to set the value
    function setValue(uint _value) public onlyOwner {
        value = _value;
        emit ValueSet(_value);
    }

    // Function to get the value
    function getValue() public view returns(uint) {
        return value;
    }

    // Function to get the contract owner
    function getOwner() public view returns(address) {
        return owner;
    }

    // Constructor to set the owner
   constructor() {
        owner = msg.sender;
}

    // State variable to store the owner
    address private owner;
}
