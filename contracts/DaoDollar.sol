// SPDX-License-Identifier: BUSL-1.1
/*
DaoDollar ☯Dollar will be BUSL-1.1 initially so that we have the chance to develop/launch the project without worrying about copycats.
*/
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DaoDollar is ERC20, Ownable {

    address public minter;

    constructor() ERC20("Dao Dollar", "dUSD") {
        minter = msg.sender;
        emit UpdateMinter(minter);
    }

    function mint(uint256 amount) public {
        require(msg.sender == minter, "DaoDollar : NOT THE MINTER");
        _mint(minter, amount);
    }

    function burn(uint256 amount) public {
        require(msg.sender == minter, "DaoDollar : NOT THE MINTER");
        _burn(msg.sender, amount);
    }

    function updateMinter(address newMinter) public onlyOwner {
        minter = newMinter;
        emit UpdateMinter(newMinter);
    }

    event UpdateMinter(address newMinter);
}
