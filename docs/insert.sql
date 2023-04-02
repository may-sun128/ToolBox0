-- Test Data for tb0_test

INSERT INTO Nodes (NodeName, Region, CMTS, SNR)
VALUES ('PLAQ-WS01A', 'Plaquemine', 'Plaquemine CBR8', 73); 

INSERT INTO Modems(ModemMAC, Brand, ModemState, Node)
VALUES('00:00:00:00', 'Arris', 'Normal', )  

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department) 
VALUES ('mdh3115', 'Mason', 'Holmes', 'CSC'); 

INSERT INTO TimeSheets (DayWorked, EmployeeID, WorkType, WorkCode, WorkGroup, HoursWork) 
VALUES ("2023-03-26", (SELECT EmployeeID FROM Employees WHERE FirstName = 'Mason'), 'NON PROJ WORK', '06', 'LTC--Testing Expanse', 8);

INSERT INTO DCMAs (DMCA_ID, ) 
VALUES ('bnll49krle', );

INSERT INTO Employees () 
VALUES ();


-- Select from all from aNOll tabls 
SELECT * FROM Nodes;  
SELECT * FROM Modems; 
SELECT * FROM Employees; 
SELECT * FROM TimeSheets; 