# Relationship 1: Specialization ↔ Writer (1:N)
┌─────────────────────┐          ┌─────────────────────┐
│ SPECIALIZATION      │          │ WRITER              │
│ SpecializationID    │──────1:N──│ WriterID (PK)       │
│ Name                │          │ SpecializationID(FK)│
└─────────────────────┘          └─────────────────────┘

Label on relationship: "SpecializesIn"
Arrow: One specialization has many writers
Cardinality: 1 on Specialization side, N on Writer side

# Relationship 2: Client → Project (1:N)
┌─────────────────────┐          ┌─────────────────────┐
│ CLIENT              │          │ PROJECT             │
│ ClientID (PK)       │──────1:N──│ ProjectID (PK)      │
│ Name                │          │ ClientID (FK)       │
└─────────────────────┘          └─────────────────────┘

Label on relationship: "Creates"
Arrow: One client creates many projects
Cardinality: 1 on Client side, N on Project side
Participation: TOTAL (every project must have a client)

# Relationship 3: Writer → Project (1:N)
┌─────────────────────┐          ┌─────────────────────┐
│ WRITER              │          │ PROJECT             │
│ WriterID (PK)       │──────1:N──│ ProjectID (PK)      │
│ Name                │          │ WriterID (FK)       │
└─────────────────────┘          └─────────────────────┘

Label on relationship: "WorksOn"
Arrow: One writer works on many projects
Cardinality: 1 on Writer side, N on Project side
Participation: TOTAL (every project assigned to one writer)

# Relationship 4: Project → Submission (1:N)
┌─────────────────────┐          ┌─────────────────────┐
│ PROJECT             │          │ SUBMISSION          │
│ ProjectID (PK)      │──────1:N──│ SubmissionID (PK)   │
│ Title               │          │ ProjectID (FK)      │
└─────────────────────┘          │ Version             │
                                 └─────────────────────┘

Label on relationship: "Submits"
Arrow: One project receives many submissions
Cardinality: 1 on Project side, N on Submission side
Participation: PARTIAL (projects may not have submissions yet)
Special: UNIQUE(ProjectID, Version) - each project can have max 1 submission per version

# Relationship 5: Project → Payment (1:1)
┌─────────────────────┐          ┌─────────────────────┐
│ PROJECT             │          │ PAYMENT             │
│ ProjectID (PK)      │──────1:1──│ PaymentID (PK)      │
│ Title               │          │ ProjectID (FK) [UQ] │
└─────────────────────┘          └─────────────────────┘

Label on relationship: "Generates"
Arrow: One project generates one payment
Cardinality: 1 on Project side, 1 on Payment side
Participation: PARTIAL (project may be pending payment)
Note: Allows multiple payment records per project for installments

