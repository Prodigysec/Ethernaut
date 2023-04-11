// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //Specifies the version of solidity compiler to be used

contract Fallback {
  //mapping that stores the contributions made by each address
  mapping(address => uint) public contributions;
  address public owner;  //public state variable. Address of current owner of contract

  //initialise the state variables of the contract
  constructor() {
    owner = msg.sender;
    contributions[msg.sender] = 1000 * (1 ether);
  }

  //modifier to restrict access to certain functions to the contract owner.
  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

  //contribute function for making a contribution to the contract
  function contribute() public payable {
  //ensure the contribution is less than 0.001Ether
    require(msg.value < 0.001 ether);
    // Update the contributions mapping for the calling address
    contributions[msg.sender] += msg.value;
    //Update the owner of the address to the calling address if it has made a larger contribution than the current owner
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  //get contributions of calling address
  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  //allows the owner to withdraw the balance of the contract.
  function withdraw() public onlyOwner {
    payable(owner).transfer(address(this).balance);
  }

// This function is automatically called when the contract receives Ether
  receive() external payable {  
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}
