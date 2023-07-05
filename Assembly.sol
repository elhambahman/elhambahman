// SPDX-License-Identifier: MIT
 pragma solidity 0.8.18 ;
 contract Newlaw{
     event voting(uint totalvotes , uint agree , uint Against , uint noidea , uint void);
     event time(uint timestampstart ,uint  TimeStampEnd , string  namelaw);

     mapping(address => bool)public isrepresentatives;
     address public representatives;
     address[]public Chairman; 

      struct newlaw{
          uint timestampstart ; 
          uint totalvotes ;
          uint agree ;
          uint Against ;
          uint noidea ; 
          uint void ;
          uint TimeStampEnd;
      }
     newlaw[] Laws ;

     modifier onlyRepresentative(){
        require(msg.sender == representatives , "Representatives only have the right to vote");
         _;
         require(!isrepresentatives[msg.sender] , "You have already voted");
         _;
     }

     modifier validTimestamp{
         require(block.timestamp < Laws.timestampstart + 10 minutes);
         _;
     }

     function addlow(uint _timestampstart ,  uint _totalvotes, uint _Against , uint _agree ,uint _noidea ,uint _void  ,uint _TimeStampEnd)public{
         Laws.push(newlaw({timestampstart : _timestampstart ,totalvotes : _totalvotes, Against : _Against , agree : _agree , noidea : _noidea , void : _void ,TimeStampEnd : _TimeStampEnd }));
     }
    
    function hasRepresentatives(uint vote)public returns(uint ,uint , uint , uint , uint){
        if(vote == Laws.agree){
            Laws.agree++ ;
        }
        if(vote == Laws.Against){
           Laws. Against++;
        }
        if( vote == Laws.noidea ){
       Laws.noidea++ ;
        }
        else{
           Laws.void++ ;
        }
      
       Laws.totalvotes ++;
        emit voting(Laws.totalvotes, Laws.agree, Laws.Against, Laws.noidea, Laws.void);
        return(Laws.totalvotes, Laws.agree , Laws.Against, Laws.noidea , Laws.void);
        }


 function endOfVoting()public returns(uint _timestampstart, uint _totalvotes , uint _agree , uint _Against, uint _noidea , uint _void, uint _TimeStampEnd){
      Laws.TimeStampEnd = block.timestamp ;
      return(Laws.timestampstart , Laws.totalvotes , Laws.agree , Laws.Against , Laws.noidea , Laws.void , Laws.TimeStampEnd );

 }

 }