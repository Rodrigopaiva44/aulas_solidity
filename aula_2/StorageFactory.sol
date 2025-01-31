  // SPDX-License_Identifier: MIT

  pragma solidity ^0.8.0;

  import {SimpleStorage} from "./SimpleStorage.sol";

  contract StorageFactory{
      SimpleStorage[] public simpleStorageArray;   

      // Creating a function that will create a new "SimpleStorage" contract
      function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageArray.push(mySimpleStorage); 
      }

      function sfStore(uint256 _simpleStorageIndex, uint256 _simplStorageNumber) public{
            // Address 
            // ABI 
            
            SimpleStorage mySimpleStorage = simpleStorageArray[_simpleStorageIndex];
            simpleStorage.store(_simplStorageNumber);
      }

      function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
            SimpleStorage mySimpleStorage = simpleStorageArray[_simpleStorageIndex];
            return mySimpleStorage.get();
            //return simpleStorageArray[_simpleStorageIndex].get(); 
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
            return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).get(); 
      }     
}
