create or replace type model_type as object(
ModelName	varchar2(10),
Manufacture	varchar2(20)
) not final;

create type submodel_type under model_type(
SubModelName varchar2(10),
MaxTakeOffWeight number(8),
CrusingRange number(8),
WingSpan number(8),
Height number(8,2)
) not instantiable not final;

create type passengersubmodel_type under submodel_type(
MaxNoOfPassengers	number(8));

create type cargosubmodel_type under submodel_type(
MaxCargoWeight	number(8));

create type airline_type as object(
AirlineCode varchar2(8),
AirlineName varchar2(25));

create type aircraft_type as object(
Submodel    ref submodel_type,
Airline     ref airline_type,
AirCraftID   number(8),
AirCraftName  varchar2(25));

create table model_table of model_type;
create table passengersubmodel_table of passengersubmodel_type;
create table cargosubmodel_table of cargosubmodel_type;
create table airline_table of airline_type(
    AirlineCode not null);
create table aircraft_table of aircraft_type(
    AirCraftID not null);

alter table aircraft_table
ADD (CONSTRAINT aircraftID_pk PRIMARY KEY (aircraftid));

alter table airline_table
ADD (CONSTRAINT airlinecode_pk PRIMARY KEY (airlinecode));

alter table model_table
add (constraint model_pk primary key(modelname, manufacture));

alter table cargosubmodel_table
ADD (CONSTRAINT cargosubmodel_pk PRIMARY KEY (modelname, manufacture, submodelname));

alter table passengersubmodel_table
ADD (CONSTRAINT passengersubmodel_pk PRIMARY KEY (modelname, manufacture, submodelname));

alter table cargosubmodel_table
add constraint cargo_model_fk 
  foreign key(modelname, manufacture)
  references model_table(modelname, manufacture);

alter table passengersubmodel_table
add constraint passenger_model_fk 
  foreign key(modelname, manufacture)
  references model_table(modelname, manufacture);
  

  
INSERT INTO airline_table values('AR01', 'Airline 1');
INSERT INTO airline_table values('AR02', 'Airline 2');
INSERT INTO airline_table values('AR03', 'Airline 3');

INSERT INTO model_table values('737', 'Boeing');
INSERT INTO model_table values('747', 'Boeing');
INSERT INTO model_table values('767', 'Boeing');

INSERT INTO cargosubmodel_table values(
'737', 'Boeing', 'LightCargo', 5000, 500, 75, 40, 4200);
INSERT INTO cargosubmodel_table values(
'767', 'Boeing', 'MedCargo', 8000, 500, 75, 40, 7200);
INSERT INTO cargosubmodel_table values(
'747', 'Boeing', 'HeavyCargo', 11000, 500, 75, 40, 10200);



INSERT INTO passengersubmodel_table values(
'737', 'Boeing', 'LightPass', 5000, 500, 75, 40, 200);
INSERT INTO passengersubmodel_table values(
'767', 'Boeing', 'MedPass', 8000, 500, 75, 40, 350);
INSERT INTO passengersubmodel_table values(
'747', 'Boeing', 'HeavyPass', 11000, 500, 75, 40, 700);



INSERT INTO aircraft_table values (
(SELECT REF(s) from passengersubmodel_table s where s.modelname = '737' and s.manufacture = 'Boeing' and s.submodelname = 'LightPass'),
(SELECT REF(a) from airline_table a where a.airlinecode = 'AR01'),
1, 'Pass1');

INSERT INTO aircraft_table values (
(SELECT REF(s) from passengersubmodel_table s where s.modelname = '747' and s.manufacture = 'Boeing' and s.submodelname = 'HeavyPass'),
(SELECT REF(a) from airline_table a where a.airlinecode = 'AR01'), 2, 'Pass2');



INSERT INTO aircraft_table values (
(SELECT REF(s) from cargosubmodel_table s where s.modelname = '767' and s.manufacture = 'Boeing' and s.submodelname = 'MedCargo'),
(SELECT REF(a) from airline_table a where a.airlinecode = 'AR02'),3, 'Cargo1');
