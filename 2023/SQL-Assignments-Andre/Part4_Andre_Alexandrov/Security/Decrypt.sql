use encryption_db;
select `testEventCode`,`technicianSupervisorID`, `dateStart`, `dateEnd`, cast(AES_DECRYPT(`testResult`,'TestResult') as char), 
	cast(AES_DECRYPT(`resultComment`,'resultComment')as char), `aircraftID` from TestEvent_SEC;

select `aircraftModelID`, cast(AES_DECRYPT(technicianID,'technicianID') as char), `trainingID` from AircraftModelQualifiedTechnician_SEC;