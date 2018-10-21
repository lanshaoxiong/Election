pragma solidity ^0.4.2;
contract Election {
    // model candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // store accounts that have voted
    mapping(address => bool) public voters;
    // store candidate
    // fetch candidate
    mapping(uint => Candidate) public candidates;
    // store candidate count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    // constructor
    function Election() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require they have not voted before
        require(!voters[msg.sender]);

        // valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record
        voters[msg.sender] = true;

        // update
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        votedEvent(_candidateId); 
    }
}
