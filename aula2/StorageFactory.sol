  // SPDX-License_Identifier: MIT

  pragma solidity ^0.8.0;

  import "./SimpleStorage.sol";

  contract StorageFactory{
      SimpleStorage[] public simpleStorageArray;   

      // Creating a function that will create a new "SimpleStorage" contract
      function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage); 
      }

      function sfStore(uint256 _simpleStorageIndex, uint256 _simplStorageNumber) public{
            // Address 
            // ABI 
            
            SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
            simpleStorage.store(_simplStorageNumber);
      }

      function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
            reuturn SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).get(); (better way) Question: Why?* 
      }

  }

  // Inheritance

  contract StorageFactory2 is SimpleStorage{
      SimpleStorage[] public simpleStorageArray;   

      function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage); 
      }

      function sfStore(uint256 _simpleStorageIndex, uint256 _simplStorageNumber) public{
            SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
            simpleStorage.store(_simplStorageNumber);
      }

      function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
            reuturn SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).get(); (better way) Question: Why?* 
      }     
}
