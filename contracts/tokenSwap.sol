// SPDX-License-Idenfier:MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";




contract swapToken{
    event swap(msg.sender,swapedAmount);

    IERC20 public Web3Token;
    address public Web3TOwner;
    uint public _Web3Amount;
    IERC20 public linkToken;
    address public linkTOwner;
    uint public _linkAmount;

    constructor(
        address Web3Token,
        address Web3TOwner,
        uint _Web3Amount,
        address linkToken,
        address linkTOwner,
        uint _linkAmount
    ) {
        token1 = IERC20(Web3Token);
        owner1 = Web3TOwner;
        amount1 = _Web3Amount;
        token2 = IERC20(linkToken);
        owner2 = linkTOwner;
        amount2 = _linkAmount;
    }







    function swap( address web3Token, address linkToken,uint _Web3Amount, uint _linkAmount) public {
        require(msg.sender == Web3TOwner|| msg.sender == linkToken);
        require(msg.value > 0, “Swap amount should be correct”);
        require(
            Web3Token.allowance(Web3TOwner, address(this)) >= _Web3Amount,
            "This Token allowance too low"
        );
        require(
            linkToken.allowance(linkTOwner, address(this)) >= _linkAmount,
            "This Token allowance too low"
        );
        startTS: block.timestamp;
            endTS: block.timestamp + 5 minutes;
            

        TransferFrom(Web3Token, Web3TOwner, linkTOwner, _Web3Amount);
        TransferFrom(linkToken, linkTOwner, Web3TOwner, _linkAmount);
    }

    function TransferFrom(
        IERC20 tokenToSendOut,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = tokenToSendOut.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }

        