// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    mapping (address=>uint256) public addressToAmountFounded;
    function fund()public payable{
        addressToAmountFounded[msg.sender] += msg.value;
    }
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);  /* adress del feed sacado de chainlink */
        return priceFeed.version();   /* funcion del contrato ya deployado */
    } 

    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        (,int256 answer,,,)= priceFeed.latestRoundData(); /* todos los datos devueltos scado del contrato de linkl, pero solo se usa el que va usar, para el resto , y espacio vacion */
        return uint256(answer * 10000000000);  /* retorna solo el precio(answer) */
    }
}