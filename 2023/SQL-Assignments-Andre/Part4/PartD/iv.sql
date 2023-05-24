use sams;

update testitem
set testitem.testResult = <{testResult: }> /*[Pass{1} or fail{0}]*/, testitem.technicianID = 1/*[corresponding technician]*/
where testitem.testItemCode = <{testItemCode: }>;/*[the item code corresponding to the pass or fail]*/

INSERT INTO testitemtestevent
(testItemCode,
testEventCode)
VALUE (<{testItemCode: }>, <{testEventCode: }>);



INSERT INTO techniciantestitemtestevent
(TechnicianID,
testItemCode,
testEventCode,
hoursSpent)
VALUE (<{TechnicianID: }>,<{testItemCode: }>, <{testEventCode: }>, <{hoursSpent: }>); 


UPDATE testevent
SET 
testEventCode = <{testEventCode: }>,
technicianSupervisorID = <{technicianSupervisorID: }>,
dateStart = <{dateStart: }>,
dateEnd = <{dateEnd: }>,
testResult = <{testResult: }>,
resultComment = <{resultComment: }>,
aircraftID = <{aircraftID: }>
WHERE testEventCode = <{expr}>;
