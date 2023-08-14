use sams;

Select Airline_has_Aircraft.airlineID,  Aircraft.aircraftName, AircraftModel.aircraftModelID, SubModel.SubModelId
from Airline_has_Aircraft
inner join Aircraft on Airline_has_Aircraft.aircraftID = Aircraft.aircraftID
inner join AircraftModel on Aircraft.aircraftModelID = AircraftModel.aircraftModelID
inner join SubModel on AircraftModel.aircraftModelID = SubModel.aircraftModelID
where Airline_has_Aircraft.aircraftID = <{aircraftID}>/*[entered AircraftID]*/;