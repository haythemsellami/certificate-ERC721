pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Certificate is ERC721Token {
    
    using SafeMath for uint256;

    string public constant name = "certificate";
    string public constant symbol = "HCERT";

    bytes4 constant InterfaceID_ERC165 = bytes4(keccak256("supportsInterface(bytes4)"));

    bytes4 constant InterfaceID_ERC721 = 
    bytes4(keccak256("name()")) ^ bytes4(keccak256("symbol()")) ^ bytes4(keccak256("totalSupply()")) ^ bytes4(keccak256("balanceOf(address)")) ^ bytes4(keccak256("ownerOf(uint256)")) ^ bytes4(keccak256("approve(address, uint256)")) ^ bytes4(keccak256("transfer(address, uint256)")) ^ bytes4(keccak256("transferFrom(address, address, uint256)")) ^ bytes4(keccak256("tokensOfOwner(address)"));

    struct Certification {
        address certified;
        uint64 declaredAt;
    }

    Certification[] certifications;

    mapping(uint256 => address) public tokenIndexToOwner;
}