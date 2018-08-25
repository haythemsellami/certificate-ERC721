pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Certificate is ERC721Token, Ownable {
    
    using SafeMath for uint256;

    string public constant name = "HCertificate";
    string public constant symbol = "HCERT";

    constructor() ERC721Token(name, symbol) public { 

    }

    /**
     * @dev create a certificate to an address
     * @param _to address of the future owner of the token
     * @param _tokenURI token URI for the token
     */
    function createCertificate(address _to, string _tokenURI) public {
        mint(_to, _tokenURI);
    }

    /**
    * @dev Mints a token to an address with a tokenURI.
    * @param _to address of the future owner of the token
    * @param _tokenURI token URI for the token
    */
    function mint(address _to, string _tokenURI) internal {
        uint256 newTokenId = _getNextTokenId();
        _mint(_to, newTokenId);
        _setTokenURI(newTokenId, _tokenURI);
    }

    /**
    * @dev calculates the next token ID based on totalSupply
    * @return uint256 for the next token ID
    */
    function _getNextTokenId() private view returns (uint256) {
        return totalSupply().add(1); 
    }

    /**
    * @dev get all tokens ID of an owner
    * @param _owner owner address
    * @return uint256[] list of tokens ID
    */
    function getOwnerTokens(address _owner) external view returns (uint256[]) {
        return ownedTokens[_owner];
    }

}