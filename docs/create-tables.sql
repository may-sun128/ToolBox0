-- Code Style
    -- Tables: Camel Case, plural 
    -- Fields: Camel Case, singular
        -- if both words of acronyms, use underscore to seperate 
        -- eg DCMA_ID 

-- ### Cable Tools ### 

-- Node Management 
CREATE TABLE Nodes (
   Region varchar(255), 
   CMTS varchar(255), -- eg Plaquemine CBR8
   NodeName varchar(255),
   NumberOfModems int, 
   ModemState enum("Normal", "Warning", "Critical", "Offline"), 
   SNR float,
   ModemMAC varchar(255) -- ???
)

-- TODO add Mac Lookup 
-- TODO add CMTS Commands 

-- ### Time Sheet Entry ### 

CREATE TABLE Employees (
    EmployeeID varchar(255), 
    FirstName varchar(255),
    LastName varchar(255),
    Department varchar(255), -- CSC, &c.
    PRIMARY KEY (EmployeeID) 
)

-- TODO make sure this is atomic 
CREATE TABLE TimeSheets (
    DayWorked date, -- PK 
    Employee.EmployeeID, 
    WorkType varchar(255), -- eg NON PROJ WORK
    WorkCode varchar(255), -- eg 06
    WorkGroup varchar(255), -- eg LTC--Testing Expanse 
    HoursWork float, 
    PRIMARY KEY (DayWorked)
)

-- ### Support ### 

-- DMCA 
CREATE TABLE DMCAs (
    DMCA_ID varchar(255), -- PK
    FlaggedMediaName varchar(255), 
    DateReceived datetime, 
    Customers.StatementNumber, 
    IP_Address varchar(255), 
    SLID varchar(255), -- TODO probably does not need to be 255 
    Customers.ServiceAccountNumber int, -- TODO varchar?
    DMCA_MediaStatus enum("Open", "Enforced"), 
    PRIMARY KEY (DMCA_ID)
)

CREATE TABLE Customers (
    AccountHolderName varchar(255), 
    AccountActivated date, 
    StatementNumber varchar(255), -- PK 
    InternetService.ServiceAccountNumber -- can be null
    VideoService.ServiceAccountNumber -- can be null
    AccountType enum("Business", "Residential"), 
)

CREATE TABLE InternetServices (
    NetworkType enum("Fiber", "HFC", "Coax"),
    ServiceAccountNumber varchar(255), 
    PRIMARY KEY (ServiceAccountNumber)
)

CREATE TABLE VideoServices (
    ServiceAccountNumber varchar(255), -- PK 
    NetworkType enum("Lightwave", "Coax"),
    PRIMARY KEY (ServiceAccountNumber)
)

-- Static Customers 
CREATE TABLE StaticCustomers (
    Customers.StatementNumber, 
    StaticDescription varchar(255), 
    Router varchar(255), 
    Interface varchar(255), 
    Stag varchar(8), 
    Ctag varchar(8), 
    InputPolicer varchar(255), 
    OutputPolicer varchar(255), 
    IP varchar(255),  
)

-- OpenSRS Tools 

CREATE TABLE EmailAccounts (
    Customers.ServiceAccountNumber, 
    Username varchar(255), 
    Domain varchar(255), 
    Status varchar(255), 
    Storage varchar(255), -- eg 2.3Gb/5.0Gb 
)
