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

   function registrationrequest(string memory _name, string memory _fathersname, string memory _Grade,address _home ,  uint _Id,uint _Age, uint _NationalCode) public  returns(bool){
    Register.push(student({name : _name , fathersname : _fathersname , Grade : _Grade , home : _home , Id : _Id , Age : _Age, NationalCode : _NationalCode }));
    require(bytes(_name).length > 0, "Name is required");
    require(bytes(_fathersname).length > 0, "Father's name is required");
    require(bytes(_Grade).length > 0, "Grade is required");
    require(_home != address(0), "Home address is required");
    require(_Id > 0, "Id is required");
    require(_Age > 0, "Age is required");
    require(_NationalCode > 0, "National code is required");
    studentCount++;
    students[studentCount] = student( _name ,_fathersname, _Grade , _home, _Id, _Age , _NationalCode);
    return true ;

}
function getStudent(uint _id) public view returns (string memory , string memory ,string memory, address , uint , uint , uint){
     student memory s = students[_id];
      return (s.name,s.fathersname,s.Grade ,s.home , s.Id , s.Age , s.NationalCode);
}

}
