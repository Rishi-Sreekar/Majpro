// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0 ;
pragma experimental ABIEncoderV2;
 contract Credentials{

    struct School{
        uint id;
        string name;
        // address schoolAddress;
     }

    mapping(uint => School) public Schools;
    uint public schoolCount;

    struct ipfsFileHash{
        string filename;
        string hash;
    }

    struct Student{
        string rollNumber;
        string name;
        string Email;
        uint fileCount;
        uint schoolId;
        address studentAddress;  
        mapping(uint=>ipfsFileHash) stuHash;
     }

     mapping(address=>ipfsFileHash) public ipfsHashs;
     mapping(uint=>Student) public Students;
     
     
     uint public studentsCount;
     function addStudent(string memory _rollNumber, string memory _name, string memory _email, uint _schoolId, address _studentAddress) public{
         Student storage stu=Students[studentsCount++];
         stu.rollNumber=_rollNumber;
         stu.name=_name;
         stu.Email=_email;
         stu.schoolId=_schoolId;
         stu.fileCount=0;
         stu.studentAddress=_studentAddress;
        //  Students[studentsCount]=Student(_rollNumber,_name,_email);
        //  studentsCount++;
         //change size of array to 10 if it doesn't work
        //  stu.stuHash[stu.fileCount]=ipfsFileHash("","");
         
     }

     function addSchool(uint _uid, string memory _name)public{
        Schools[schoolCount]=School(_uid, _name);
        schoolCount++;
     }
     function addFile(string memory _fileName, string memory _fileHash) public{
         for(uint i=0;i<studentsCount;i++){
             if(Students[i].studentAddress==msg.sender){
                 Students[i].stuHash[Students[i].fileCount++]=ipfsFileHash(_fileName,_fileHash);
             }
         }
     }
     function returnStudentCredHash(string memory _rollno) public view returns(string[] memory filename,string[] memory filehash){
         for(uint i=0;i<studentsCount;i++){
             if(keccak256(abi.encodePacked(Students[i].rollNumber)) == keccak256(abi.encodePacked(_rollno))){
                for(uint j=0;j<Students[i].fileCount;j++){
                    filename[j]=Students[i].stuHash[j].filename;
                    filehash[j]=Students[i].stuHash[j].hash;
                }
                return(filename,filehash);
             }
         }

     }

 } 


// pragma solidity >=0.4.22 <0.9.0 ;
//  contract schoolCredentials{

//     struct School{
//         uint id;
//         string name;
//         address schoolAddress;
//      }

//     mapping(uint => School) public Schools;
//     uint public schoolCount;

//     struct ipfsFileHash{
//         string filename;
//         string hash;
//     }

//     struct Student{
//         string rollNumber;
//         string name;
//         string Email;
//         uint fileCount;
//         uint schoolId;
//         address studentAddress;  
//         mapping(uint=>ipfsFileHash) stuHash;
//      }

//      mapping(address=>ipfsFileHash) public ipfsHashs;
//      mapping(uint=>Student) public Students;
     
     
//      uint public studentsCount;
//      function addStudent(string memory _rollNumber, string memory _name, string memory _email, uint _schoolId, address _studentAddress) private{
//          Student storage stu=Students[studentsCount++];
//          stu.rollNumber=_rollNumber;
//          stu.name=_name;
//          stu.Email=_email;
//          stu.schoolId=_schoolId;
//          stu.studentAddress=_studentAddress;
//         //  stu.stuHash[stu.fileCount]=ipfsFileHash();
//          //change size of array to 10 if it doesn't work
         
//      }

//      function addSchool(uint _uid, string memory _name, address _schoolAddress)private{
//         Schools[schoolCount]=School(_uid, _name, _schoolAddress);
//         schoolCount++;
//      }
//      function addFile(string memory _fileName, string memory _fileHash) private{
//          for(uint i=0;i<studentsCount;i++){
//              if(i==0){
//                  Students[i].stuHash[Students[i].fileCount++]=ipfsFileHash(_fileName,_fileHash);
//              }
//          }
//      }
//      function returnStudentCredHash(string memory _rollno) public view returns(string[] memory filename,string[] memory filehash){
//          for(uint i=0;i<studentsCount;i++){
//              if(keccak256(abi.encodePacked(Students[i].rollNumber)) == keccak256(abi.encodePacked(_rollno))){
//                 for(uint j=0;j<Students[i].fileCount;j++){
//                     filename[j]=Students[i].stuHash[j].filename;
//                     filehash[j]=Students[i].stuHash[j].hash;
//                 }
//                 return(filename,filehash);
//              }
//          }

//      }
  
//     constructor()public{
//         addStudent("17261A1216", "rishi", "r@gmail.com", 1,0xa926720e8Ce8917BB00C0E4F9d9Ffdf35b103147);
//         addStudent("17261A1203", "abrar", "a@gmail.com", 1,0xa926720e8Ce8917BB00C0E4F9d9Ffdf35b103147);
//         addStudent("17261A1217", "bharath", "b@gmail.com", 1,0xa926720e8Ce8917BB00C0E4F9d9Ffdf35b103147);
//         addFile("memo","asfyjsg476281b78owiuwuieu");
//         addFile("memo","asfyjsg476281b78owiuwuieu");
//         addFile("memo","asfyjsg476281b78owiuwuieu");
//     }


//  } 