pragma solidity ^0.8.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";


contract ChessBeautyCollection {
  MyGame  public collection;
  address public owner;

    constructor() {
        
     }    
 function deployCollection(string memory collectionName, string memory NFTName)
        public
        returns(address)
        
    {
     collection = new MyGame (collectionName,  NFTName);  
      
    }
 function _mintToken(string memory TokenURI)
 public returns (uint256 result) {
     owner = msg.sender; 
     return collection.mintToken(TokenURI, owner);
 }
}
contract MyGame  is ERC721URIStorage {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    address private _owner;
    

    constructor(
        string memory collectionName,
        string memory NFTName
       ) 
   
    ERC721(collectionName, NFTName) {
        
    }
     

    function mintToken(string memory tokenURI, address owner)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(owner, newItemId);
        _setTokenURI(newItemId, tokenURI);
       

        return newItemId;
    }
}
