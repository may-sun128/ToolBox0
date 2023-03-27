-- ##### NAIVE VERSION - NOT NORMALIZED #####
-- tb0_test

-- Code Style
    -- Tables: Camel Case, plural 
    -- Fields: Camel Case, singular
        -- if both words of acronyms, use underscore to seperate 
        -- eg DCMA_ID 

-- ### Cable Tools ### 

-- Node Management 
CREATE TABLE Nodes (
   NodeName varchar(255), -- PK 

   Region varchar(255), 
   CMTS varchar(255), -- eg Plaquemine CBR8
   NumberOfModems int, 
   ModemState enum("Normal", "Warning", "Critical", "Offline"), 
   SNR float,
   ModemMAC varchar(255), -- ???
   PRIMARY KEY (NodeName)
   -- TODO seperate out modem table 
);

-- TODO add Mac Lookup 
-- TODO add CMTS Commands 

-- ### Time Sheet Entry ### 

CREATE TABLE Employees (
    EmployeeID varchar(255), -- PK 

    FirstName varchar(255),
    LastName varchar(255),
    Department varchar(255), -- CSC, &c.
    PRIMARY KEY (EmployeeID) 
); 

-- TODO make sure this is atomic 
CREATE TABLE TimeSheets (
    DayWorked date, -- PK 
    EmployeeID varchar(255), -- FK

    WorkType varchar(255), -- eg NON PROJ WORK
    WorkCode varchar(255), -- eg 06
    WorkGroup varchar(255), -- eg LTC--Testing Expanse 
    HoursWork float, 
    PRIMARY KEY (DayWorked),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) 
);

-- ### Support ### 

-- DMCA 
CREATE TABLE DMCAs (
    DMCA_ID varchar(255), -- PK
    InternetServiceAccountNumber varchar (255), -- TODO varchar?
    VideoServiceAccountNumber varchar (255), 

    FlaggedMediaName varchar(255), 
    DateReceived datetime, 
    IP_Address varchar(255), 
    SLID varchar(255), -- TODO probably does not need to be 255 
    DMCA_MediaStatus enum("Open", "Enforced"), 
    PRIMARY KEY (DMCA_ID),
    FOREIGN KEY (InternetServiceAccountNumber) REFERENCES InternetServices(ServiceAccountNumber),
    FOREIGN KEY (VideoServiceAccountNumber) REFERENCES VideoServices(ServiceAccountNumber)
)

CREATE TABLE Customers (
    StatementNumber varchar(255), -- PK
    InternetServiceAccountNumber varchar(255), -- can be null
    VideoServiceAccountNumber varchar(255), -- can be null

    AccountHolderName varchar(255), 
    AccountActivated date,  
    AccountType enum("Business", "Residential"), 
    FOREIGN KEY (InternetServiceAccountNumber) REFERENCES InternetServices(ServiceAccountNumber),
    FOREIGN KEY (VideoServiceAccountNumber) REFERENCES VideoServices(ServiceAccountNumber)
    PRIMARY KEY (StatementNumber)
)

CREATE TABLE InternetServices (
    ServiceAccountNumber varchar(255),

    NetworkType enum("Fiber", "HFC", "Coax"),
    PRIMARY KEY (ServiceAccountNumber)
)

CREATE TABLE VideoServices (
    ServiceAccountNumber varchar(255), -- PK 

    NetworkType enum("Lightwave", "Coax"),
    PRIMARY KEY (ServiceAccountNumber)
)

-- Static Customers 
CREATE TABLE StaticCustomers (
    IP varchar(255),
    Customers.StatementNumber, 

    StaticDescription varchar(255), 
    Router varchar(255), 
    Interface varchar(255), 
    Stag varchar(8), 
    Ctag varchar(8), 
    InputPolicer varchar(255), 
    OutputPolicer varchar(255),
    PRIMARY KEY (IP),
    FOREIGN KEY StatementNumber REFERENCES Customers(StatementNumber)
)

-- OpenSRS Tools 

CREATE TABLE EmailAccounts (
    Customers.ServiceAccountNumber, 
    Username varchar(255), 
    Domain varchar(255), 

    Status varchar(255), 
    Storage varchar(255), -- eg 2.3Gb/5.0Gb 
    CONSTRAINT PK_EmailAddress PRIMARY KEY (Username, Domain)
    FOREIGN KEY 
)
