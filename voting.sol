pragma solidity ^0.4.25;

// Voting contract
contract Voting {
    
    // Mapping from candidate name to number of votes received
    mapping (bytes32 => uint256) public votesReceived;
    
    // List of candidates
    bytes32[] public candidateList;
    
    // Constructor to add list of candidates
    constructor(bytes32[] memory _candidateList) public {
        candidateList = _candidateList;
    }
    
    // Vote function
    function vote(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate]++;
    }
    
    // Check if candidate is valid
    function validCandidate(bytes32 candidate) public view returns (bool) {
        for(uint256 i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
