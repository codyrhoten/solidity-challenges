// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Target {
  
    uint256 private totalDeposited;

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        
        totalDeposited += msg.value;
    }

    function withdrawAll() external {
        assert(address(this).balance == totalDeposited);

        totalDeposited = 0;    
        payable(msg.sender).transfer(address(this).balance);
    }

   
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getTotalDeposited() external view returns (uint256) {
        return totalDeposited;
    }
}
