USE internship_tracker;


CREATE TABLE Students (
    Student_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    College VARCHAR(100),
    Branch VARCHAR(50),
    CGPA DECIMAL(3,2),
    Graduation_Year INT
);


CREATE TABLE Companies (
    Company_ID VARCHAR(10) PRIMARY KEY,
    Company_Name VARCHAR(100) NOT NULL,
    Industry VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Internship_Type VARCHAR(50) NOT NULL
);


CREATE TABLE Applications (
    Application_ID VARCHAR(10) PRIMARY KEY,
    Student_ID VARCHAR(10) NOT NULL,
    Company_ID VARCHAR(10) NOT NULL,
    Applied_Date DATE NOT NULL,
    Source VARCHAR(50),
    Status VARCHAR(20),

    FOREIGN KEY (Student_ID)
        REFERENCES Students(Student_ID),

    FOREIGN KEY (Company_ID)
        REFERENCES Companies(Company_ID)
);


CREATE TABLE Interviews (
    Interview_ID VARCHAR(10) PRIMARY KEY,
    Application_ID VARCHAR(10) NOT NULL,
    Round VARCHAR(50) NOT NULL,
    Interview_Date DATE NOT NULL,
    Result VARCHAR(20) NOT NULL,

    FOREIGN KEY (Application_ID)
        REFERENCES Applications(Application_ID)
);


CREATE TABLE Offers (
    Offer_ID VARCHAR(10) PRIMARY KEY,
    Application_ID VARCHAR(10) NOT NULL,
    Offer_Date DATE,
    Stipend INT,
    Accepted VARCHAR(5),

    FOREIGN KEY (Application_ID)
        REFERENCES Applications(Application_ID)
);