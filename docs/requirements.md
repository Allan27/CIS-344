# System Design Requirements: Freelance Writer Portfolio

## Functional Requirements

1. The system shall store freelance writer profiles.
2. The system shall store writing specialization categories.
3. The system shall ensure each writer is assigned a specialization.
4. The system shall store client contact and company information.
5. The system shall allow clients to create writing projects.
6. The system shall assign writers to specific projects.
7. The system shall track project start dates, deadlines, budgets, and statuses.
8. The system shall allow writers to submit multiple versions of their work.
9. The system shall store client feedback on submissions.
10. The system shall allow installment-based payments for projects.
11. The system shall track payment statuses and methods.
12. The system shall prevent duplicate email registrations.
13. The system shall ensure valid email formatting.
14. The system shall allow reporting on writer earnings.
15. The system shall allow analysis of project completion rates.

## Non-Functional Requirements

1. The database shall enforce data integrity using primary and foreign keys.
2. The database shall enforce constraints to prevent invalid data.
3. The database shall support efficient querying using indexes.
4. The database shall follow normalization rules to eliminate redundancy.
5. The database shall support reporting and analytics.


## 1. System Overview
The Freelance Writer Portfolio Database is designed to manage the interactions between freelance writers and clients. The system tracks:
- Writer profiles and credentials
- Client information and company details
- Writing projects with timelines and status
- Document submissions and reviews
- Payment transactions

## 2. Requirements Gathering Process

### 2.1 Research Conducted
- **Platform Analysis**: Reviewed Upwork, Fiverr, Contently, and Medium Partner Program to understand portfolio features
- **Real-World Examples**: Examined 5 professional freelance writer portfolios to identify common attributes
- **Industry Standards**: Researched freelance work documentation requirements and payment models

### 2.2 Stakeholder Interviews
- **Interview 1** - Sarah Chen (Freelance Tech Writer)
  - Years of experience: 6
  - Key needs: Project tracking, submission versions, payment history
  - Pain points: Managing multiple clients, version control of submissions
  
- **Interview 2** - Marcus Rodriguez (Content Agency Owner)
  - Perspective: Client side (hires freelancers)
  - Key needs: Writer portfolio viewing, project timeline tracking, payment scheduling
  - Pain points: Monitoring submission quality, tracking deliverables

### 2.3 Decision-Making Process
Based on interviews and research, we determined:
- **Scope**: Medium complexity (5 main entities, clear relationships)
- **Target Users**: Individual freelancers and small agencies
- **Core Functions**: Portfolio management, project tracking, payment processing

## 3. Identified Entities and Attributes

### Writer Entity
- **WriterID** (Primary Key): Unique identifier for each writer
- **Name**: Full name of the writer
- **Email**: Primary contact email (unique)
- **Bio**: Professional biography/expertise area
- **JoinedDate**: Date the writer registered in the system
- **SpecializationCategory**: Genre/type of writing (Fiction, Technical, Content, etc.)

### Client Entity
- **ClientID** (Primary Key): Unique identifier for each client
- **Name**: Name of the hiring individual or company
- **Email**: Primary contact email (unique)
- **CompanyName**: Official company name (nullable for individual clients)
- **RegisteredDate**: Date client joined the platform
- **Phone**: Contact phone number

### Project Entity
- **ProjectID** (Primary Key): Unique identifier
- **Title**: Name of the writing project
- **Description**: Detailed project brief and requirements
- **StartDate**: Project kickoff date
- **EndDate**: Expected completion date (nullable if ongoing)
- **Status**: Current project status (Not Started, In Progress, Completed, Cancelled)
- **ClientID** (Foreign Key): Reference to Client
- **WriterID** (Foreign Key): Reference to Writer
- **Budget**: Total project budget in USD

### Submission Entity
- **SubmissionID** (Primary Key): Unique identifier
- **ProjectID** (Foreign Key): Reference to Project
- **SubmissionDate**: Date the work was submitted
- **FileURL**: URL/path to submitted document
- **Version**: Version number of submission (1st draft, 2nd draft, etc.)
- **Status**: Review status (Submitted, Reviewed, Accepted, Rejected)
- **ReviewFeedback**: Comments from client on submission

### Payment Entity
- **PaymentID** (Primary Key): Unique identifier
- **ProjectID** (Foreign Key): Reference to Project
- **Amount**: Payment amount in USD
- **PaymentDate**: Actual payment date
- **Status**: Payment status (Pending, Completed, Failed)
- **PaymentMethod**: How paid (Bank Transfer, PayPal, Check, etc.)

## 4. Entity Relationships

### Relationship 1: Client → Project (1:N)
- **Cardinality**: One client can post multiple projects
- **Participation**: Total (every project must have a client)
- **Business Rule**: Client responsibility for project definitions and approvals

### Relationship 2: Writer → Project (1:N)
- **Cardinality**: One writer can work on multiple projects
- **Participation**: Total (every project must be assigned to a writer)
- **Business Rule**: Writers specialize but can take diverse work

### Relationship 3: Project → Submission (1:N)
- **Cardinality**: One project can have multiple submissions (revisions)
- **Participation**: Partial (some projects may not have submissions yet)
- **Business Rule**: Allows version tracking and iterative improvement

### Relationship 4: Project → Payment (1:1)
- **Cardinality**: One project has one payment record
- **Participation**: Partial (project may be pending payment)
- **Business Rule**: Payment recorded after project completion

## 5. Business Rules & Constraints

1. **Uniqueness**: Email addresses for both Writers and Clients must be unique
2. **Mandatory Fields**: WriterID, ClientID, Title, StartDate are required for projects
3. **Date Logic**: EndDate must be >= StartDate
4. **Status Values**: Limited to predefined ENUM values
5. **Referential Integrity**: All foreign keys must reference valid primary keys
6. **Payment Tracking**: Each project can have multiple payment records for installments

## 6. Normalization Notes
- Schema is in **3NF** (Third Normal Form)
- No transitive dependencies
- All non-key attributes depend entirely on primary keys
- Repeating groups eliminated through proper decomposition