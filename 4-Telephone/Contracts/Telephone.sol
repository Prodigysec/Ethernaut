// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;  //floating point introduces compiler error

contract Telephone {
	//set owner's address to public
  address public owner;

  constructor() {
		//set owner to the contruct deployer
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    //Authorization check
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
