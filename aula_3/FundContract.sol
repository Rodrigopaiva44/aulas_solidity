contract FundContract{

    uint256 public minUsd = 5e18;
    
    function fund() public payable  {   
        require(msg.value > minUsd, "Not enough money"); 
    }   

    // An example 
    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // price of ETH in terms of USD
        // price have 10 decimals here and msg.value have 18 decimals so we need to fix that:
        return uint256(price) * 1e10; // view returns(uint256);
    } 

    function getConvertionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        // multiplying 10^18 * 10^18 = 10^36 thats why we divide for 1e18
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;  (in solidity we awals want to multiple first)
        return ethAmountInUsd;
    } 


}
