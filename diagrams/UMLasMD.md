╔════════════════════════════════════════════════════════════════════════════╗
║                     UML ENTITY-RELATIONSHIP DIAGRAM                        ║
║           (MySQL Workbench / Crow's Foot Notation)                        ║
║                 Freelance Writer Portfolio Database System                 ║
╚════════════════════════════════════════════════════════════════════════════╝


┌─────────────────────────────────┐         ┌──────────────────────────────┐
│         SPECIALIZATION          │         │           WRITER             │
├─────────────────────────────────┤         ├──────────────────────────────┤
│ PK  SpecializationID : INT      │         │ PK  WriterID : INT           │
│ UQ  Name : VARCHAR(50)          │◄──────┐ │     Name : VARCHAR(100)      │
│                                 │   1:N  │ │     Email : VARCHAR(150) [UQ]│
│                                 │        │ │     Bio : TEXT               │
│                                 │        └─│ FK  SpecializationID : INT   │
│                                 │         │     JoinedDate : DATE        │
└─────────────────────────────────┘         │                              │
                                            │ Constraints:                 │
                                            │ - Email UNIQUE               │
                                            │ - Email LIKE '%@%.%'         │
                                            │ - JoinedDate NOT NULL        │
                                            │                              │
                                            │ Indexes:                     │
                                            │ - PK on WriterID             │
                                            │ - UQ on Email                │
                                            │ - IDX on SpecializationID    │
                                            └──────────────────────────────┘


┌─────────────────────────────────┐         ┌──────────────────────────────┐
│          CLIENT                 │         │        PROJECT               │
├─────────────────────────────────┤         ├──────────────────────────────┤
│ PK  ClientID : INT              │◄──────┐ │ PK  ProjectID : INT          │
│ UQ  Email : VARCHAR(150)        │  1:N   │     Title : VARCHAR(200)     │
│     Name : VARCHAR(100)         │        │     Description : TEXT        │
│     CompanyName : VARCHAR(150)  │        │     StartDate : DATE [NOT NULL│
│     Phone : VARCHAR(20)         │        │     EndDate : DATE [nullable] │
│     RegisteredDate : DATE       │        │     Status : ENUM [NOT NULL]  │
│                                 │        │     Budget : DECIMAL(10,2)   │
│ Constraints:                    │        │ FK  ClientID : INT [NOT NULL] │
│ - Email UNIQUE                  │        │ FK  WriterID : INT [NOT NULL] │
│ - Email LIKE '%@%.%'            │        │                              │
│ - RegisteredDate NOT NULL       │        │ Constraints:                 │
│                                 │        │ - EndDate >= StartDate       │
│ Indexes:                        │        │ - Budget > 0                 │
│ - PK on ClientID                │        │ - Status IN ENUM values      │
│ - UQ on Email                   │        │                              │
│ - IDX on CompanyName            │        │ Indexes:                     │
└─────────────────────────────────┘        │ - PK on ProjectID            │
              ▲                             │ - FK on ClientID             │
              │                             │ - FK on WriterID             │
              │                             │ - IDX on Status              │
              │                             │ - IDX on StartDate           │
              └─────────────────────────────┤                              │
                    1:N                     │                              │
                   Creates                  │ ◄──────────────┐             │
                                            │                 │            │
                                            │                 │ 1:N        │
                                            │                 │ WorksOn    │
                                            │                 │            │
                                            │ FK WriterID ────┘            │
                                            └──────────┬─────────────────┬─┘
                                                       │                 │
                                      ┌────────────────┤                 │
                                      │                │                 │
                                      │ 1:N            │                 │
                                      │ Submits        │                 │
                                      │                │                 │
┌──────────────────────────────────┐  │                │                 │
│        SUBMISSION                │◄─┘                │                 │
├──────────────────────────────────┤                   │                 │
│ PK  SubmissionID : INT           │                   │                 │
│ FK  ProjectID : INT [NOT NULL]   │                   │                 │
│     Version : INT [> 0]          │                   │                 │
│     SubmissionDate : DATE        │                   │                 │
│     FileURL : VARCHAR(500)       │                   │                 │
│     Status : ENUM [NOT NULL]     │                   │                 │
│     ReviewFeedback : TEXT        │                   │                 │
│                                  │                   │                 │
│ Constraints:                     │                   │                 │
│ - Version > 0                    │                   │                 │
│ - UNIQUE(ProjectID, Version)     │                   │                 │
│ - Status IN ENUM values          │                   │                 │
│                                  │                   │                 │
│ Indexes:                         │                   │                 │
│ - PK on SubmissionID             │                   │                 │
│ - FK on ProjectID                │                   │                 │
│ - IDX on Status                  │                   │                 │
│ - UNIQUE(ProjectID, Version)     │                   │                 │
│ - CASCADE delete with Project    │                   │                 │
└──────────────────────────────────┘                   │                 │
                                                       │                 │
                                      ┌────────────────┤                 │
                                      │                │                 │
                                      │ 1:1            │ 1:N             │
                                      │ Generates      │ --(multiple     │
                                      │ (partial)      │ installments)   │
                                      │                │                 │
┌──────────────────────────────────┐  │                │                 │
│         PAYMENT                  │◄─┘                │                 │
├──────────────────────────────────┤                   │                 │
│ PK  PaymentID : INT              │                   │                 │
│ FK  ProjectID : INT [NOT NULL]   │                   │                 │
│     Amount : DECIMAL(10,2)[>0]   │                   │                 │
│     PaymentDate : DATE           │                   │                 │
│     Status : ENUM [NOT NULL]     │                   │                 │
│     PaymentMethod : VARCHAR(50)  │                   │                 │
│                                  │                   │                 │
│ Constraints:                     │                   │                 │
│ - Amount > 0                     │                   │                 │
│ - Status IN ENUM values          │                   │                 │
│                                  │                   │                 │
│ Indexes:                         │                   │                 │
│ - PK on PaymentID                │                   │                 │
│ - FK on ProjectID                │                   │                 │
│ - IDX on Status                  │                   │                 │
│ - IDX on PaymentDate             │                   │                 │
│ - CASCADE delete with Project    │                   │                 │
└──────────────────────────────────┘                   │                 │
                                                       └───────────┬─────┘
                                                                   │
                                                      All connected through
                                                         PROJECT entity


LEGEND:
PK   = Primary Key
FK   = Foreign Key
UQ   = Unique Constraint
[UQ] = Unique on this column
[NOT NULL] = Mandatory field
[nullable] = Optional field
[> 0] = Check constraint (positive)
ENUM = Enumerated type (restricted values)
DECIMAL(10,2) = 10 total digits, 2 after decimal
1:N = One-to-Many
1:1 = One-to-One
IDX = Index for performance
CASCADE = If parent deleted, delete children