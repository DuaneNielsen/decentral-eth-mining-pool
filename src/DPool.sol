pragma solidity ^0.4.0;

contract DPool {

  struct Share {
    bytes32 header;
    bytes32 nonce;
  }

  mapping ( address => Share[] ) shares;
  mapping ( address => int ) balance;

  function addShare(bytes32 header, bytes32 nonce) {
    shares[msg.sender].push(Share(header, nonce));
  }

  function getShare(uint index) returns (bytes32 header, bytes32 nonce) {
    Share s = shares[msg.sender][index];
    return (s.header, s.nonce);
  }

}
