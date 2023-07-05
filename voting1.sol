// SPDX-License-Identifier: MIT
pragma solidity 0.8.18 ;

 contract voting {
          event Voters(uint zonal, uint VotingSection, uint TimeStampEnd, uint CandidateA, uint CandidateB, uint BlankVotes, uint NullVotes);
          address public BallotBoxAdress;
          address public RemoteControllAdress;
          uint256[] ElectorIDs;
          uint public ElectoralWard;
          uint public VotingSection;
          uint TimeStampStart;
          uint256 NumberCandidateA = 1;
          uint  NumberCandidateB = 2;
          uint NumberBlankVotes ; 
          uint CandidateA =0;
          uint CandidateB = 0;
          uint BlankVotes = 0;
          uint NullVotes = 0;
          uint TimeStampEnd = 0;
          bool AlreadyVoted;
          bool BallotBoxAddressEnable = false;

          struct vote{
             uint zonal;
             uint VotingSection;
             uint TimeStampStart;
             uint CandidateA;
             uint CandidateB;
             uint BlankVotes;
             uint NullVotes;
          }

          constructor(uint _ElectoralWard, uint _VotingSection) public  { 
                 ElectoralWard = _ElectoralWard;
                 VotingSection = _VotingSection;
                 BallotBoxAdress = msg.sender;
    }
    modifier verification1(){
        require(msg.sender == BallotBoxAdress, "This command need come from the electronic Ballot Box Adress");
        _;
    }

    modifier verification2(){
        require(msg.sender == RemoteControllAdress, "This command need come from the poll worker Adress");
        _;
    }

    modifier verification3(bool status){
        require(msg.sender == BallotBoxAdress, "This command need come from the electronic Ballot Box Adress");
        _;
        require(status == true, "The electronic ballot box is disable, because this elector already voted");
        _;
    }

    modifier verification4(){
        require(msg.sender == RemoteControllAdress, "This command need come from the poll worker Adress");
        _;
        require(AlreadyVoted == false, "The electronic ballot box is disable, because this elector already voted");
        _;
    }

    function StartVoting() public verification1(){ 
    
        TimeStampStart = block.timestamp; 
    }

    function FirstPrinting() public view verification1() returns(uint zonal, uint votingSection, uint timeStampStart, uint _CandidateA, uint _CandidateB, uint _BlankVotes, uint _NullVotes){
       return( ElectoralWard,VotingSection, TimeStampStart, CandidateA,CandidateB,BlankVotes,NullVotes);
    }

    function EnablePollWorker()public{
        RemoteControllAdress = msg.sender; 
    }
    function InsertElectorID(uint _ElectorID) public verification2 {
       
        for(uint i=0; i < ElectorIDs.length; i++){ 
            if(_ElectorID == ElectorIDs[i]){ 
                    AlreadyVoted = true;
            }
        }
        if(AlreadyVoted == false){ 
            ElectorIDs.push(_ElectorID); 
        }
    }

    function EnableElectronicBallotBox() public verification4(){
        BallotBoxAddressEnable = true; 
    }
     function ToVote(uint voto) public verification3(BallotBoxAddressEnable){
        if(BallotBoxAddressEnable == true){ 
            if(voto == NumberCandidateA){
                CandidateA++; 
            }
            else if(voto == NumberCandidateB){
                CandidateB++; 
            }
            else if(voto == NumberBlankVotes){
                BlankVotes++; 
            }
            else{
                NullVotes++;
            }
        }
         BallotBoxAddressEnable = false; 
    }

    function FinishVoting() public verification1(){
        TimeStampEnd = block.timestamp; 
        BallotBoxAddressEnable = false; 
    }

    function LastPrinting() public view verification1() returns(uint zonal, uint _VotingSection, uint _TimeStampEnd, uint _CandidateA, uint _CandidateB, uint _BlankVotes, uint _NullVotes){ 


        return( ElectoralWard,VotingSection, TimeStampStart, CandidateA, CandidateB, BlankVotes, NullVotes);
    }
}
