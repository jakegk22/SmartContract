// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Proof of Existence contract, version 1

contract ProofOfExistence1 {

  // state

  bytes32[] private proofs;

  // calculate and store the proof for a document
  // *transactional function*
  function storeProof(bytes32 proof) public{
    proofs.push(proof);
  }

  function notarize(string calldata document) public {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  // helper function to get a document's sha256
  // *read-only function*
  function proofFor(string calldata document) public pure returns (bytes32) {
    return sha256(abi.encodePacked(document));
  }

  function checkDocument(string calldata document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  function hasProof(bytes32 proof) public view returns (bool) {
    for (uint256 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}
