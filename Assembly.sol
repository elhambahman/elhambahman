// SPDX-License-Identifier: MIT
 pragma solidity 0.8.18 ;
 contract Newlaw{
     event voting(uint totalvotes , uint agree , uint Against , uint havenoopinion , uint void);
     event time(uint timestampstart ,uint  TimeStampEnd , string  namelaw);

     mapping(address => bool)public isrepresentatives;
     address public representatives;
     address[]public Chairman;   
     uint Against ; 
     uint agree ; 
     uint noidea ; 
     uint void ;
     uint timestampstart ;
     uint TimeStampEnd;
     string namelaw;
     string Nocomment;
     string  _Noidea = Nocomment ;
     bool Agree = true ;
     bool against = false;

      
      struct newlaw{
          uint timestampstart ; 
          uint totalvotes ;
          uint agree ;
          uint Against ;
          uint havenoopinion ; 
          uint void ;
          uint TimeStampEnd;
      }

     modifier Conditions(){
        require(msg.sender == representatives , "Representatives only have the right to vote");
         _;
         require(!isrepresentatives[msg.sender] , "You have already voted");
         _;
     }
     modifier timestamp{
         require(block.timestamp < timestampstart + 10 minutes);
         _;
     }
    
    function Voting(bool vote  , string memory Noidea )public returns(uint , uint , uint , uint){
        if(vote = Agree){
            agree++ ;
        }
        if(vote = against){
            Against++;
        }
        if( Noidea == _Noidea ){
        noidea++ ;
        }
        else{
            void++ ;
        }
        return(agree , Against, noidea , void);
        }
 
 }