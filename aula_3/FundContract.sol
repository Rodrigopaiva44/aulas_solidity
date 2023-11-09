contract FundContract{
    using PriceConverter for uint256;

    uint256 public minUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;    // in solidity we can specify names to our mapping 
 

    address public owner;
    constructor() {
        owner = msg.sender; // msg.sender is who deployed the contract
    }


    function fund() public payable {   

        require(msg.value.getConvertionRate() >= minUsd, "Not enough money");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }   
    function withdraw() public onlyOwner {
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);
        // tansact
        // send
        // call 
        (bool callSucess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess,"Call failed");
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"Just the owner can call this function");
        _; 
        // the underline means the rest of the function code, if we put it first, will run the code and require after.
    }
}
