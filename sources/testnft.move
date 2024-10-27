/*
/// Module: tradeport_testnft
module tradeport_testnft::tradeport_testnft;
*/
module tradeport_testnft::testnft{
    use std::string::{Self, String};
    use sui::url::{Self, Url};

    public struct NFT has key, store{
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    public entry fun nft_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext){
        let sender = ctx.sender();
        let testnft = NFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        transfer::public_transfer(testnft, sender);
    }
}