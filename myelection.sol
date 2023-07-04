// SPDX-License-Identifier: MIT
pragma solidity 0.8.18 ;
contract voting2{
    event  voting(uint Votingsection , uint timestampstart , uint candidateA, uint candidateB , uint blankvotes , uint Nullvotes);
    address public ballotbox; 
    address public Remotecontrol;
    uint votingsection;
    uint  timestampstart;
    uint TimeStampEnd;
    uint blankvotes ;
    uint Nullvotes ;
    uint candidateA ;
    uint candidateB ;
    uint256 NumberCandidateA = 1;
    uint NumberCandidateB = 2;
     uint NumberBlankVotes ; 
    bool Activateballotboxaddress = false ;
    bool hasvoted ;
 
    struct Voting{
    uint votingsection;
    uint  timestampstart;
    uint TimeStampEnd;
    uint blankvotes ;
    uint Nullvotes ;
    uint candidateA ;
    uint candidateB ;
    }
constructor (address _Remotecontrol, address _ballotbox , uint _Votingsection )public {
  Remotecontrol = _Remotecontrol; 
  ballotbox = _ballotbox ;
  votingsection = _Votingsection;
}

modifier Votingconditions(){
   require(msg.sender == ballotbox , "The vote must be sent from the ballot box");
   _;
   require(hasvoted == false , "Your vote has already been registered");
   _;
   require(msg.sender == Remotecontrol , "This address must be valid");
   _;
}

function StartVoting()public{
     timestampstart = block.timestamp; 
     Activateballotboxaddress = true;
     Remotecontrol = msg.sender;
}

function desiredvote(uint256 Vote)public Votingconditions{
     if(hasvoted == false){
        if(Vote == NumberCandidateA) {
           candidateA++ ;
         }
         if(Vote == NumberCandidateB){
             candidateB++ ;
         }
         if(Vote == NumberBlankVotes){
             blankvotes++;
         }
         else{
             Nullvotes++ ;
         }
     }
}

function Endofvoting()public{
    TimeStampEnd = block.timestamp;
    Activateballotboxaddress = false ;
}

function Finalresults()public view returns(uint _votingsection , uint _timeStampStart , uint _TimeStampEnd , uint _blankvotes , uint _NullVotes, uint _candidateA , uint _candidateB ){
                return(votingsection , timestampstart ,TimeStampEnd, blankvotes , Nullvotes, candidateA , candidateB );
}
}