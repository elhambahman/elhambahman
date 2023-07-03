// SPDX-License-Identifier: MIT
pragma solidity 0.8.18 ;

 contract voting {
         // تعریف رویداد اعلام رای دهندگان
          event Voters(bytes options , uint voters);
           //آدرس صندوق رای
          address public BallotBoxAdress;
          //آدرس کنتزل از راه دور
          address public RemoteControllAdress;
          //شناسه انتخابگر
          uint256[] ElectorIDs;
          //بخش انتخابات
          uint public ElectoralWard;
          //بخش رای گیری
          uint public VotingSection;
          //شروع زمان
          uint TimeStampStart;
          //نامزد شماره الف
          uint256 NumberCandidateA = 1;
          //نامزد شماره ب
          uint  NumberCandidateB = 2;
          //تعداد آرای خالی
          uint NumberBlankVotes ; 
          //کاندید الف
          uint CandidateA =0;
          //کاندید ب
          uint CandidateB = 0;
          //آرای خالی
          uint BlankVotes = 0;
          //آرای باطل
          uint NullVotes = 0;
          //پایان زمان 
          uint TimeStampEnd = 0;
          //قبلاً رای داده است
          bool AlreadyVoted;
          //آدرس صندوق رای فعال شود
          bool BallotBoxAddressEnable = false;

           // تعریف ساختار داده‌ای برای نگهداری رای
          struct vote{
              //ناحیه ای
             uint zonal;
             //بخش رای گیری
             uint VotingSection;
             //شروع رای گیری
             uint TimeStampStart;
             uint CandidateA;
             uint CandidateB;
             uint BlankVotes;
             uint NullVotes;
          }

          //تابع سازنده برای تنظیم مقادیر اولیه برای بخش انتخابات، بخش رای گیری و آدرس صندوق رای
          constructor(uint _ElectoralWard, uint _VotingSection) public  { 
                 ElectoralWard = _ElectoralWard;
                 VotingSection = _VotingSection;
                 BallotBoxAdress = msg.sender;
    }
    // تأیید اینکه دستور از آدرس صندوق رأی می آید
    modifier verification1(){
        require(msg.sender == BallotBoxAdress, "This command need come from the electronic Ballot Box Adress");
        _;
    }

    //اصلاح کننده برای تأیید اینکه دستور از آدرس کنترل از راه دور می آید
    modifier verification2(){
        require(msg.sender == RemoteControllAdress, "This command need come from the poll worker Adress");
        _;
    }

    //اصلاح کننده برای تأیید اینکه دستور از آدرس صندوق رأی می آید و انتخاب کننده قبلاً رأی نداده است
    modifier verification3(bool status){
        require(msg.sender == BallotBoxAdress, "This command need come from the electronic Ballot Box Adress");
        _;
        require(status == true, "The electronic ballot box is disable, because this elector already voted");
        _;
    }

    //اصلاح کننده برای تأیید اینکه فرمان از آدرس کنترل از راه دور می آید و انتخابگر قبلاً رأی نداده است
    modifier verification4(){
        require(msg.sender == RemoteControllAdress, "This command need come from the poll worker Adress");
        _;
        require(AlreadyVoted == false, "The electronic ballot box is disable, because this elector already voted");
        _;
    }

   // برای شروع فرآیند رای گیری
    function StartVoting() public verification1(){ 
    
        TimeStampStart = block.timestamp; 
    }

    //تابعی برای برگرداندن چاپ اولیه نتیجه رای گیری
    function FirstPrinting() public view verification1() returns(uint zonal, uint votingSection, uint timeStampStart, uint _CandidateA, uint _CandidateB, uint _BlankVotes, uint _NullVotes){
       return( ElectoralWard,VotingSection, TimeStampStart, CandidateA,CandidateB,BlankVotes,NullVotes);
    }

    //عملکردی برای فعال کردن کارمند نظرسنجی
    function EnablePollWorker()public{
        RemoteControllAdress = msg.sender; 
    }
      //عملکرد درج شناسه انتخابگر
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

    //عملکردی برای فعال کردن صندوق رأی الکترونیکی
    function EnableElectronicBallotBox() public verification4(){
        BallotBoxAddressEnable = true; 
    }
      //عملکرد انتخاب کننده برای رای دادن
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

//عملکردی برای تکمیل فرآیند رای گیری
    function FinishVoting() public verification1(){
        TimeStampEnd = block.timestamp; 
        BallotBoxAddressEnable = false; 
    }

//تابعی برای بازگرداندن چاپ نهایی نتایج رای گیری
    function LastPrinting() public view verification1() returns(uint zonal, uint _VotingSection, uint _TimeStampEnd, uint _CandidateA, uint _CandidateB, uint _BlankVotes, uint _NullVotes){ // retorna o resultado da votação naquela BallotBoxAdress


        return( ElectoralWard,VotingSection, TimeStampStart, CandidateA, CandidateB, BlankVotes, NullVotes);
    }
}
