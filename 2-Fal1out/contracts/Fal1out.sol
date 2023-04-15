// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;  //version of the compiler to be used

//library for performing math functions
import 'openzeppelin-contracts-06/math/SafeMath.sol'; 
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/math/SafeMath.sol";

//Contract name
contract Fallout {
  
  using SafeMath for uint256;
//mapping that stores allocations of each address
  mapping (address => uint) allocations;
//owner's address can be accessed from anywhere and can receive ether
  address payable public owner;


  /* constructor */
//allocate ether to the contract
  function Fal1out() public payable {
//set owner to the contruct deployer
    owner = msg.sender;
//set allocations mapping to store value of msg.value
    allocations[owner] = msg.value;
  }

//restrict access to certain functions to the owner of the contract
  modifier onlyOwner {
	        require(
	            msg.sender == owner,
	            "caller is not the owner"
	        );
	        _;
	    }

//allocate funds to the calling address  
  function allocate() public payable {
    allocations[msg.sender] = allocations[msg.sender].add(msg.value);
  }

//send funds through allocator 
  function sendAllocation(address payable allocator) public {
//ensure allocators allocations are greater than 0
    require(allocations[allocator] > 0);
//transfer allocator's funds
    allocator.transfer(allocations[allocator]);
  }

//only the owner can receive funds sent
  function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }

//check balance
  function allocatorBalance(address allocator) public view returns (uint) {
    return allocations[allocator];
  }
}
