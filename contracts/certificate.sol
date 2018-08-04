pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Certificate is ERC721Token, Ownable {
    
    using SafeMath for uint256;

    string public constant name = "HCertificate";
    string public constant symbol = "HCERT";

    /*
    struct Certification {
        address certified;
        uint64 declaredAt;
    }

    Certification[] certifications;

    mapping(uint256 => address) public tokenIndexToOwner;
    */
}