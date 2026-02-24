-- ==========================================
-- Freelance Writer Portfolio Database (Enhanced Version)
-- CIS 344 Spring 2026
-- ==========================================

DROP DATABASE IF EXISTS FreelanceWriterPortfolio;
CREATE DATABASE FreelanceWriterPortfolio;
USE FreelanceWriterPortfolio;

-- ==========================================
-- TABLE: Specialization
-- ==========================================
CREATE TABLE Specialization (
    SpecializationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
) COMMENT 'Stores valid writing specialization categories';

-- ==========================================
-- TABLE: Writer
-- ==========================================
CREATE TABLE Writer (
    WriterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Bio TEXT,
    SpecializationID INT NOT NULL,
    JoinedDate DATE NOT NULL,

    CONSTRAINT chk_writer_email CHECK (Email LIKE '%@%.%'),
    CONSTRAINT fk_writer_specialization 
        FOREIGN KEY (SpecializationID)
        REFERENCES Specialization(SpecializationID)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    INDEX idx_writer_email (Email),
    INDEX idx_writer_specialization (SpecializationID)
) COMMENT 'Stores freelance writer profiles';

-- ==========================================
-- TABLE: Client
-- ==========================================
CREATE TABLE Client (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    CompanyName VARCHAR(150),
    Phone VARCHAR(20),
    RegisteredDate DATE NOT NULL,

    CONSTRAINT chk_client_email CHECK (Email LIKE '%@%.%'),

    INDEX idx_client_email (Email),
    INDEX idx_company_name (CompanyName)
) COMMENT 'Stores client information';

-- ==========================================
-- TABLE: Project
-- ==========================================
CREATE TABLE Project (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Description TEXT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Status ENUM('Not Started', 'In Progress', 'Completed', 'Cancelled') 
        DEFAULT 'Not Started',
    Budget DECIMAL(10,2) NOT NULL,
    ClientID INT NOT NULL,
    WriterID INT NOT NULL,

    CONSTRAINT chk_project_dates 
        CHECK (EndDate IS NULL OR EndDate >= StartDate),
    CONSTRAINT chk_project_budget 
        CHECK (Budget > 0),

    CONSTRAINT fk_project_client 
        FOREIGN KEY (ClientID)
        REFERENCES Client(ClientID)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_project_writer 
        FOREIGN KEY (WriterID)
        REFERENCES Writer(WriterID)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    INDEX idx_project_client (ClientID),
    INDEX idx_project_writer (WriterID),
    INDEX idx_project_status (Status),
    INDEX idx_project_start (StartDate)
) COMMENT 'Stores writing project assignments';

-- ==========================================
-- TABLE: Submission
-- ==========================================
CREATE TABLE Submission (
    SubmissionID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT NOT NULL,
    Version INT NOT NULL,
    SubmissionDate DATE NOT NULL,
    FileURL VARCHAR(500),
    Status ENUM('Submitted', 'Reviewed', 'Accepted', 'Rejected') 
        DEFAULT 'Submitted',
    ReviewFeedback TEXT,

    CONSTRAINT chk_submission_version CHECK (Version > 0),

    CONSTRAINT unique_project_version 
        UNIQUE (ProjectID, Version),

    CONSTRAINT fk_submission_project
        FOREIGN KEY (ProjectID)
        REFERENCES Project(ProjectID)
        ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_submission_project (ProjectID),
    INDEX idx_submission_status (Status)
) COMMENT 'Stores versioned project submissions';

-- ==========================================
-- TABLE: Payment (Allows Installments)
-- ==========================================
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    Status ENUM('Pending', 'Completed', 'Failed') 
        DEFAULT 'Pending',
    PaymentMethod VARCHAR(50),

    CONSTRAINT chk_payment_amount CHECK (Amount > 0),

    CONSTRAINT fk_payment_project
        FOREIGN KEY (ProjectID)
        REFERENCES Project(ProjectID)
        ON DELETE CASCADE ON UPDATE CASCADE,

    INDEX idx_payment_project (ProjectID),
    INDEX idx_payment_status (Status),
    INDEX idx_payment_date (PaymentDate)
) COMMENT 'Stores payment records (supports multiple payments per project)';

CREATE VIEW LatestSubmissions AS
SELECT s.*
FROM Submission s
JOIN (
    SELECT ProjectID, MAX(Version) AS LatestVersion
    FROM Submission
    GROUP BY ProjectID
) latest
ON s.ProjectID = latest.ProjectID
AND s.Version = latest.LatestVersion;