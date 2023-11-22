pragma solidity ^0.8.0;

contract Auction {
    address public administrator;
    address public highestBidder;
    uint public highestBid;

    bool public auctionOpen;

    constructor() {
        administrator = msg.sender;
        auctionOpen = false;
    }

    modifier onlyAdmin() {
        require(msg.sender == administrator);
        _;
    }

    function startAuction() public onlyAdmin {
        require(!auctionOpen);
        auctionOpen = true;
    }

    function placeBid(uint _bid) public {
        require(auctionOpen, "The auction is not in progress.");
        require(_bid > highestBid, "The bid must be higher than the current highest bid.");

        highestBid = _bid;
        highestBidder = msg.sender;
    }

    function endAuction() public onlyAdmin {
        require(auctionOpen, "The auction is not in progress.");
        auctionOpen = false;
    }
}
