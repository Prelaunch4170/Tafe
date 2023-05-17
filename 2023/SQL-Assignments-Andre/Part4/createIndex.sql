Use sams;

Create index AircraftModel_Indx_ManufacturerID on AiraftModel(manufacturerID);
Create index AircraftSubModel_Indx_AircraftModelID on AircraftSubModel(AircraftModelID);
Create index Aircraft_Indx_AircraftModelID on Aircraft(AircraftModelID);
