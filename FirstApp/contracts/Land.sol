// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LandRegistration is ERC721 { 

    constructor() ERC721("Land","Lnd") {}
    struct LandDetail{
        uint surveyNo;
        string district;
        string taluk;
        string village;
        uint blockNo;
        uint LandValue; //wei
        uint area;
        bool salesStatus;
    }

    mapping(uint => LandDetail) LandDetails;
    
    uint public registeredLandCount = 0;    
    
    function registerNewLand(uint surveyNo, string memory district, string memory taluk, string memory village, uint blockNo, uint landValue, uint area) public {
        LandDetails[registeredLandCount] = LandDetail(surveyNo, district, taluk, village, blockNo, landValue, area, false);
        _mint(msg.sender, registeredLandCount);
        registeredLandCount += 1;
    }
    
    function getLandDetails(uint landID) view public returns(LandDetail memory) {
        return LandDetails[landID];
    }
}