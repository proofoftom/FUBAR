pragma solidity ^0.4.17;

import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract FoobsToken is ERC721Token {

    string conference = "";

    function ERC721Token() public {
        name_ = "FoobsToken";
        symbol_ = "FOO";
    }
}