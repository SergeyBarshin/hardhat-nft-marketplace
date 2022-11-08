// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

error NftMarketplace__PriceMustBeAboveZero();
error NftMarketplace__NotApprivedForMarketPlace();

contract NftMarketplace {
    // Main Functions
    function listItems(
        address nftAddress,
        uint256 tokenId,
        uint256 price
    ) external {
        if (price <= 0) {
            revert NftMarketplace__PriceMustBeAboveZero();
        }
        // 1. Send the NFT to the contract
        IERC721 nft = IERC721(nftAddress);
        if (nft.getApproved(tokenId) != address(this)) {
            revert NftMarketplace__NotApprivedForMarketPlace();
        }
    }
}

// 1. `listItem`: List NFTs on the marketplace
// 2. `buyItem`: Buy the NFTs
// 3. `cancelItem`: Cancel a listing
// 4. `updateListing`: Update Price
// 5. `withdrawProceeds`: Withdraw payment for my bought NFTs
