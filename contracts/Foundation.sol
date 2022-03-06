// SPDX-License-Identifier: MIT
pragma solidity >0.4.23 <0.9.0;

contract Foundation {
    string public name;
    address public owner;

    enum State {
        Proposed,
        Voting,
        Accepted,
        Rejected
    }

    struct Proposal {
        string name;
        string description;
        State state;
        uint8 votesFor;
        uint8 votesAgainst;
        uint8 votesAbstain;
    }

    function init(string memory _name, string memory description) public {
        require(bytes(name).length == 0); // ensure not init'd already.
        require(bytes(_name).length > 0);

        name = _name;
        owner = msg.sender;
         Proposal memory proposal = Proposal({
            name: _name,
            description: description,
            state: State.Proposed,
            votesFor: 0,
            votesAgainst: 0,
            votesAbstain: 0
        });
    }

    function setOwner(address _newOwner) public {
        require(msg.sender == owner);
        owner = _newOwner;
    }

}