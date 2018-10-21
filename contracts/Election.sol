pragma solidity ^0.4.2;
contract Election {
    // model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // store candidate
    // fetch candidate
    mapping(uint => Candidate) public candidates;
    // store candidate count
    uint public candidatesCount;

    // constructor
    function Election() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    } 
}
