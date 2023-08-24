// SPDX-License-Identifier: MIT
pragma solidity 0.8.20 ;

contract SchoolRegistration {
    event school(address indexed owner ,uint indexed studentCount );

    struct  student{
        string name ;
        string fathersname;
         string Grade;
        address home ;
        uint Id;
        uint Age;
        uint NationalCode;
       
    }

   student[] Register ;
   uint public  studentCount = 0 ;  
   mapping (uint =>student)private students ;

   
    function Student(string memory  _name , string memory _fathersname,  string memory  _Grade , address _home, uint _Id , uint _Age , uint _NationalCode)public {
              Register.push(student({name : _name , fathersname : _fathersname , Grade : _Grade , home : _home , Id : _Id , Age : _Age, NationalCode : _NationalCode }));    
    }

   function registrationrequest(string memory name, string memory fathersname, string memory Grade,address home ,  uint Id,uint Age, uint NationalCode) public  returns(bool){
    require(bytes(name).length > 0, "Name is required");
    require(bytes(fathersname).length > 0, "Father's name is required");
    require(bytes(Grade).length > 0, "Grade is required");
    require(home != address(0), "Home address is required");
    require(Id > 0, "Id is required");
    require(Age > 0, "Age is required");
    require(NationalCode > 0, "National code is required");
    studentCount++;
    students[studentCount] = student( name ,fathersname, Grade , home,Id, Age , NationalCode);
    return true ;

}
function getStudent(uint _id) public view returns (string memory , string memory , string memory , address , uint , uint , uint ){
     student memory s = students[_id];
      return (s.name,s.fathersname,s.Grade ,s.home , s.Id , s.Age , s.NationalCode);
}

}
