╔════════════════════════════════════════════════════════════════════════════╗
║                    CHEN ENTITY-RELATIONSHIP DIAGRAM                        ║
║                 Freelance Writer Portfolio Database System                 ║
╚════════════════════════════════════════════════════════════════════════════╝


                         ┌─────────────────────────────┐
                         │     SPECIALIZATION          │
                         │  (Writing Categories)       │
                         └──────────┬──────────────────┘
                                    │
                           ◇SpecializesIn ◇ (1:N)
                                    │
                                    │
         ┌──────────────────────────┤
         │                          │
         │                          │


    ┌─────────────────────────┐                  ┌──────────────────────────┐
    │        WRITER           │                  │        CLIENT            │
    │ ◯WriterID (PK)          │                  │ ◯ClientID (PK)           │
    │ ◯Name                   │                  │ ◯Name                    │
    │ ◯Email (UNIQUE)         │                  │ ◯Email (UNIQUE)          │
    │ ◯Bio                    │                  │ ◯CompanyName             │
    │ ◯JoinedDate             │                  │ ◯Phone                   │
    │ ◯SpecializationID (FK)  │                  │ ◯RegisteredDate          │
    └─────────────┬───────────┘                  └───────────┬──────────────┘
                  │                                          │
                  │                                          │
           ◇WorksOn◇ (1:N)                           ◇Creates◇ (1:N)
                  │                                          │
                  │                                          │
                  └──────────────────────┬───────────────────┘
                                         │
                                    ┌────▼─────────────────┐
                                    │     PROJECT          │
                                    │ ◯ProjectID (PK)      │
                                    │ ◯Title               │
                                    │ ◯Description         │
                                    │ ◯StartDate           │
                                    │ ◯EndDate (nullable)  │
                                    │ ◯Status (ENUM)       │
                                    │ ◯Budget (DECIMAL)    │
                                    │ ◯ClientID (FK)       │
                                    │ ◯WriterID (FK)       │
                                    └────┬──────────────────┘
                                         │
                            ◇Submits◇ (1:N) [Partial]
                                         │
                                    ┌────▼──────────────────┐
                                    │    SUBMISSION         │
                                    │ ◯SubmissionID (PK)    │
                                    │ ◯ProjectID (FK)       │
                                    │ ◯Version              │
                                    │ ◯SubmissionDate       │
                                    │ ◯FileURL              │
                                    │ ◯Status (ENUM)        │
                                    │ ◯ReviewFeedback       │
                                    │ UNIQUE(ProjectID, Ver)│
                                    └───────────────────────┘

                            ◇Generates◇ (1:1) [Partial]
                                         │
                                    ┌────▼──────────────────┐
                                    │     PAYMENT          │
                                    │ ◯PaymentID (PK)       │
                                    │ ◯ProjectID (FK)       │
                                    │ ◯Amount (DECIMAL)     │
                                    │ ◯PaymentDate          │
                                    │ ◯Status (ENUM)        │
                                    │ ◯PaymentMethod        │
                                    └───────────────────────┘


LEGEND:
  ◯ = Attribute (field)
  □ = Entity (table)
  ◇ = Relationship
  1:N = One-to-Many cardinality
  1:1 = One-to-One cardinality
  [Partial] = Not all instances participate in relationship
  (PK) = Primary Key
  (FK) = Foreign Key
  (ENUM) = Restricted value set
  (DECIMAL) = Numeric with decimals
  (nullable) = Optional field