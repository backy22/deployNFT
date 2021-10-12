// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MapleStory is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    bool public mintingLocked;

    constructor() ERC721("MapleStory", "ITM") {}

    mapping(uint => string) tokenURIs;

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
      return tokenURIs[tokenId];
    }

    function mint(address player, string memory mytokenURI) public onlyOwner returns (uint256) {
        require(mintingLocked == false,"Minting Locked Forever");
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        tokenURIs[newItemId] = mytokenURI;
        _tokenIds.increment();
        return newItemId;
    }

    function lockMinting() public {
        require(msg.sender == owner(),"You can't lock. You are not owner of the contract");
        mintingLocked=true;
    }
}