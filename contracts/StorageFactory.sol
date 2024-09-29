// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

import "./Storage.sol";

contract StorageFactory{
    Storage[] public simpleStorageArray;
    function createSimpleStorage() public{
        Storage simpleStorage = new Storage();
        simpleStorageArray.push(simpleStorage);
    } 
    function sfStore(uint256 _simpleStorageIndex, uint256 simpleStorageNumber) public {
        Storage simpleStorage = Storage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(simpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        Storage simpleStorage = Storage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}