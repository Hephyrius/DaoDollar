// SPDX-License-Identifier: BUSL-1.1
/*
DaoDollar ☯Dollar will be BUSL-1.1 initially so that we have the chance to develop/launch the project without worrying about copycats.
*/
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract DollarParams is Ownable {

    mapping(uint => IERC20) public KnownTokens;
    mapping(IERC20 => bool) public AcceptedTokens;
    mapping(IERC20 => uint) public TokenAllocation;
    
    uint256 public TotalTokensKnown;

    constructor () public {
        initProtocol();
    }

    function initProtocol() internal {
        addToken(0xdAC17F958D2ee523a2206206994597C13D831ec7); //tether
        addToken(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48); // USDC
        addToken(0x6B175474E89094C44Da98b954EedeAC495271d0F); // DAI
        addToken(0x5f98805A4E8be255a32880FDeC7F6728C6568bA0); // LUSD
    }

    function addToken(address token) public onlyOwner {
        uint256 _totalTokensKnown = TotalTokensKnown;
        IERC20 _token = IERC20(token);
        KnownTokens[_totalTokensKnown] = _token;
        AcceptedTokens[_token] = true;
        TotalTokensKnown = _totalTokensKnown + 1;
        setInitialRate(token, 250000);
    }

    function setInitialRate(address token, uint256 rate) public onlyOwner {
        IERC20 _token = IERC20(token);
        TokenAllocation[_token] = rate;
    }
}
