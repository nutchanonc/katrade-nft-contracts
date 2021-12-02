// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Controller is Ownable {


    mapping(address => bool) allowances;

    // function _createTicket() private returns (bool) {
        
    // }

    // function createTicket() external onlyOwner returns (bool) {
        
    //     return true;
    // }
    function allownaceOf(address token, uint256 tokenId) public view returns (address approved) {
        approved = IERC721(token).getApproved(tokenId);
    }
    function swap(address token1, uint256 token1Id, address token2, uint256 token2Id, address owner1, address owner2) public onlyOwner returns (bool) {
        address verifiedOwner1 = IERC721(token1).ownerOf(token1Id);
        address verifiedOwner2 = IERC721(token2).ownerOf(token2Id);

        require(verifiedOwner1 == owner1, "FAIL TO TRANSFER: Token does not match to the owner.");
        require(verifiedOwner2 == owner2, "FAIL TO TRANSFER: Token does not match to the owner.");

        require(allownaceOf(token1, token1Id) == address(this), "FAIL TO TRANSFER: Token 1 is not approved.");
        require(allownaceOf(token2, token2Id) == address(this), "FAIL TO TRANSFER: Token 2 is not approved.");

        IERC721(token1).transferFrom(owner1, owner2, token1Id);
        IERC721(token2).transferFrom(owner2, owner1, token2Id);
        return true;
    }
}