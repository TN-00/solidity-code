// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//creating a contract that will store patient data
contract PatientHealthRecord {
    // 2 contract addreses: Doctor and patient
    string doctorAddress;
    string patientAddress;

    // Define a struct named Patient that holds information about a patient
    struct Patient {
        uint256 patientID; // patient ID
        string patientName; // patient name
        uint256 age; // patient age
    }

    // Define a struct named patientRecord that holds medical information about a patient
    struct PatientRecord {
        string diagnosis;
        string prescription;
        uint256 timestamp;
    }

    // Define a mapping from a unique identifier to the Patient struct
    mapping(uint256 => PatientHealthRecord) public patientHealthRecords;

    // Keep track  of the number of patients in the registry
    uint256 public PatientHealthRecordCount;

    // --------------------- patient personal detail section start ------------------------------
    // Function to add a new patient to the registry
    function addPatient(uint256 _patientID, string memory _patientName) public {
        // Add the new patient detail to the patientHealthRecords mapping using the current patientHealthCount as the identifier
        //cars[carCount] = Car(_make, _model, _year);
        //patientHealthRecords[PatientHealthRecordCount] = PatientHealthRecord(  _patientID, _patientName );

        // Increment patientHealthCount to keep track of the number of patients in the registry
        //carCount++;
        PatientHealthRecordCount++;
    }

    // edit patient personal detail
    function editPatient() public {}

    function displayPatient() public {}

    // --------------------- patient personal detail section ends ------------------------------

    // ---------------------- patient medical record detail start ---------------------------
    //add patient medical record detail
    function addPatientRecord(
        uint256 patientID,
        string memory diagnosis,
        string memory prescription
    ) public {}

    //edit patient medical detail
    function editPatientRecord() private {}

    function displayPatientRecord() public {}
    // ---------------------- patient medical record detail ends ---------------------------
}
