// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//addr tested: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//addr tested: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

//creating a contract that will store patient data
contract PatientHealthRecord {
    // 2 contract addreses: Doctor and patient
    address doctorAddress;
    address patientAddress;
    address patId; // patient id address
    address docId; // doc ID address

    // Define a struct named Patient that holds information about a patient
    struct Patient {
        address id;
        uint patientID; // patient ID
        string patientName; // patient name
        uint age; // patient age
        PatientRecord[] PatientRecords;
    }

    // Define a struct named Doctor that holds information about a doctor
    struct Doctor {
        address id;
        uint doctorId; // doc ID
        string doctorName; // doc name
    }

    // Define a struct named patientRecord that holds medical information about a patient
    struct PatientRecord {
        uint patientRecordId;
        address id;
        string diagnosis; //condition of the patient
        string prescription; // medication received
        uint timestamp;
    }

    // Define a mapping from a unique identifier to the PatientHealthRecord struct
    mapping(uint256 => PatientRecord[]) public patientRecords;
    // Define a mapping from a unique identifier to the Patient struct
    mapping(address => Patient) public patients;
    // Define a mapping from a unique identifier to the Doctor struct
    mapping(address => Doctor) public doctors;

    // Keep track  of the number of patients in the registry
    uint public PatientHealthRecordCount;

    //constructor()
    constructor(){
        //whoever deploys this contract, the person will be the owner of thr contract;
        doctorAddress = msg.sender;
        patientAddress = msg.sender;
    }

    // -------------------- Modifiers ------------------------------
    modifier senderExists {
        require(doctors[msg.sender].id == msg.sender || patients[msg.sender].id == msg.sender, "Sender does not exist");
        _;
    }

    modifier patientExists(address patientId){
        require(patients[patientId].id == patientId, "patient does not exists");
        _;
    }

    modifier senderIsDoctor{
        require(doctors[msg.sender].id == msg.sender, "sender is not a doctor");
        _;
    }

    // ---------------------Events ----------------------------------
    // These can be triggered for a JS script in front end
    event DoctorAdded(address doctorAddress);
    event PatientAdded(address patientAddress);
    event PatientRecordAdded(string );

    // --------------------- patient personal detail section start ------------------------------
    // Function to add a new patient to the registry
    function addPatient(address _patientId) public senderIsDoctor{
        // Add the new patient detail to the patientHealthRecords mapping using the current patientHealthCount as the identifier
        //cars[carCount] = Car(_make, _model, _year);
        // patientHealthRecords[PatientHealthRecordCount] = PatientHealthRecord(_patientID, _patientName);
        require(patients[_patientId].id != _patientId, "This patient already exists.");
        // Increment patientHealthCount to keep track of the number of patients in the registry
        //carCount++;
        //PatientHealthRecordCount++;
        emit PatientAdded(patientAddress);
    }

    // edit patient personal detail
    function editPatient() public {}

    function displayPatient() public {}

    // --------------------- patient personal detail section ends ------------------------------

    // ---------------------- patient medical record detail section start ---------------------------
    //add patient medical record detail
    function addPatientRecord( uint patientRecordId, string memory diagnosis, string memory prescription, address id ) public {
          // creating a record ID
        uint256 recordId = patientRecords[patientRecordId].length + 1;

        // Add patient record - using the push function to push a record in the array
        patientRecords[patientRecordId].push(PatientRecord(recordId, id, diagnosis, prescription,  block.timestamp ));
    }

    //edit patient medical detail
    function editPatientRecord() private {}

    function displayPatientRecord(uint256 patientID) public view returns (PatientRecord[] memory) {
         return patientRecords[patientID];
    }
    // ---------------------- patient medical record detail section ends ---------------------------


    // ---------------------- doctor detail section start ---------------------------
    function addDoctor() public{
        require(doctors[msg.sender].id != msg.sender, "this doctor alredy exists.");
        doctors[msg.sender].id = msg.sender;
        emit DoctorAdded(msg.sender);
    }
    // ---------------------- doctor detail section ends ---------------------------

    //-----------------------authorize provider section start ---------------------------
    function getSenderRole() public view returns (string memory){
        // identify role
    }

    function getPatientExists(address _patientId) public view senderIsDoctor returns (bool){

    }

    //-----------------------authorize provider section end ---------------------------
}
