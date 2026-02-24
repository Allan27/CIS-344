# Freelance Writer Portfolio: System Design Process Documentation

## Design Process Overview

### Phase 1: Requirements Gathering (Week 1)
**Duration**: 3 days
**Methodology**: Multi-source research and interviews

#### 1.1 Research Activities
- Visited 4+ freelance platforms and analyzed their structure
- Documented common data elements across platforms
- Identified business workflows

#### 1.2 Interview Summaries

**Interview with Sarah Chen** (Feb 10, 2026)
- Duration: 45 minutes
- Format: Video call
- Key Takeaway Quote: "I need to track multiple drafts and client feedback for each project"
- Critical Requirements Identified:
  - Version control for submissions (drafts)
  - Client feedback storage
  - Payment scheduling (invoices)

**Interview with Marcus Rodriguez** (Feb 11, 2026)
- Duration: 30 minutes
- Format: Phone call
- Key Takeaway Quote: "I need to see writer portfolios and project timelines at a glance"
- Critical Requirements Identified:
  - Writer profile with specialization
  - Project timeline tracking
  - Payment status monitoring

### Phase 2: Conceptual Design (Week 1-2)
**Duration**: 4 days

#### 2.1 Entity Identification Process
Started with broad categories:
- **People**: Writers, Clients
- **Work**: Projects
- **Work Output**: Submissions
- **Transactions**: Payments

Refined based on interviews:
- Separated Client from Project (1:N relationship needed)
- Added Submission entity for version tracking
- Kept Payment separate for accounting flexibility

#### 2.2 Attribute Selection Criteria
For each entity, we included:
- **Primary Identifiers**: IDs for tracking
- **Descriptive Data**: Names, emails, bios
- **Temporal Data**: Dates (joined, started, completed, paid)
- **Status Indicators**: Project/submission/payment status
- **Contact Information**: Email, phone for communication

Excluded:
- Salary/wage tables (out of scope)
- Detailed accounting (use Payment entity)
- Social media links (focus on core data)

#### 2.3 Relationship Identification
Mapped all interactions:
1. Clients post Projects
2. Writers work on Projects
3. Writers submit Submissions for Projects
4. Projects generate Payments
5. Multiple Submissions per Project allowed (versions)

### Phase 3: Logical Design (Week 2)
**Duration**: 3 days

#### 3.1 ER Diagram Development
Created two representations:

**Chen Notation (Hand-drawn)**
- Used rectangles for entities
- Used diamonds for relationships
- Added attribute lists
- Included cardinality notation (1:N, 1:1)
- Focus: Conceptual clarity

**UML Notation (MySQL Workbench)**
- Used class notation
- Added primary keys and foreign keys
- Included data types
- Added check constraints
- Focus: Implementation readiness

#### 3.2 Normalization Verification
Checked for:
- **1NF**: Atomic values, no repeating groups ✓
- **2NF**: No partial dependencies ✓
- **3NF**: No transitive dependencies ✓

### Phase 4: Physical Design (Week 2-3)
**Duration**: 4 days

#### 4.1 Data Type Selection
- **VARCHAR vs TEXT**: Used VARCHAR(50-100) for names (typical length), TEXT for descriptions
- **DATE vs DATETIME**: DATE for project dates (time not critical), DATETIME for payment timestamps
- **DECIMAL for Currency**: DECIMAL(10,2) for precise money calculations
- **ENUM for Status**: Restricted values prevent invalid data entry

#### 4.2 Key Strategy
- **Auto-increment INT**: Efficient surrogate keys for all tables
- **Unique Constraints**: Email addresses to prevent duplicates
- **Foreign Keys**: Enforced referential integrity at database level

#### 4.3 Database Initialization
- Created database with UTF-8 encoding
- Set appropriate collation for text fields
- Configured backup settings

### Phase 5: Validation (Week 3)
**Duration**: 2 days

#### 5.1 Sample Data Testing
Inserted test records:
- 3 writers with various specializations
- 3 clients (mix of individual and company)
- 5 projects across different statuses
- 8 submissions showing version iterations
- 5 payment records in various states

#### 5.2 Query Testing
Validated key scenarios:
```sql
-- All projects for a specific client
SELECT * FROM Project WHERE ClientID = 1;

-- Latest submission for each project
SELECT p.Title, s.FileURL, s.SubmissionDate 
FROM Project p 
JOIN Submission s ON p.ProjectID = s.ProjectID
WHERE s.SubmissionDate = (SELECT MAX(SubmissionDate) FROM Submission WHERE ProjectID = p.ProjectID);