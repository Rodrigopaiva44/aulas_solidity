pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract BeeToken is ERC20("BeeToken","BET"), Ownable(address(0x6B15C8d0877C57e53DFCc3Ec08a0ae531432ea6a)){
    function mintToken() public onlyOwner{
        _mint(msg.sender, 100e18);
    }
}