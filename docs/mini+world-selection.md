
---

## PART 3: MINI WORLD SELECTION DOCUMENTATION

```markdown name=mini-world-selection.md
# Mini World Selection: Freelance Writer Portfolio

## Selected Mini World: Freelance Writer Portfolio Database

### Overview
The Freelance Writer Portfolio system is a database that is designed to manage the complete lifecycle of freelance writing engagements, from writer-client relationships through project completion and payment processing.

### Why This Mini World Was Selected

#### 1. Scope Appropriateness
- **Complexity**: Medium—manageable for a semester project with sufficient depth
- **Entity Count**: 5 distinct entities with clear relationships
- **Learning Value**: Demonstrates all key database concepts (1:N, 1:1 relationships, constraints)

#### 2. Real-World Relevance
- **Current Applicability**: Gig economy is dominant; freelancing is increasingly common
- **Market Growth**: $1.2T+ freelance market globally (supporting evidence)
- **Practical Use**: Could be developed into a real product

#### 3. Stakeholder Interest
- **Primary Users**: Freelance writers (growing demographic)
- **Secondary Users**: Small agencies, content companies
- **Problem Solved**: Fragmented portfolio tracking across multiple platforms

#### 4. Relationship Complexity
- **Diverse Relationship Types**: 1:N (Client→Project), 1:N (Writer→Project), 1:N (Project→Submission), 1:1 (Project→Payment)
- **Cardinality Variations**: Mix of total and partial participation
- **Referential Scenarios**: Foreign key relationships at multiple levels

#### 5. Business Logic
- **Status Tracking**: Projects and submissions have meaningful states
- **Temporal Data**: Multiple date fields with validation rules
- **Quantitative Data**: Budget and payment amounts with precision requirements
____________________________________________

### System Context

#### Users of the System itself
1. **Freelance Writers**
   - Create portfolios
   - Track assignments and deadlines
   - Monitor payment status
   - View client feedback

2. **Clients**
   - Browse writer portfolios
   - Post projects
   - Track submissions
   - Process payments

3. **Administrators**
   - Manage user accounts
   - Monitor transactions
   - Generate reports

#### Key Business Processes
1. **Onboarding**: Writers and clients register
2. **Project Posting**: Clients post writing projects
3. **Assignment**: Writers get assigned projects based on specialization
4. **Execution**: Writers complete work and submit
5. **Review**: Clients review submissions and provide feedback
6. **Payment**: Projects are paid upon completion
7. **Portfolio Building**: Writers showcase completed work

#### Data Volume Expectations
- Small System: 100-500 writers, 50-200 clients, 500-2000 projects
- No massive scale requirements
- Good for learning but with realistic scope

### Comparison to Alternatives

| Criteria | Freelance Writer Portfolio | Library System | E-Commerce |
|----------|---------------------------|---|---|
| Complexity | Medium | Low | High |
| Relevance | High | Moderate | High |
| Relationship Variety | High (4 types) | Low (2 types) | High (5+ types) |
| Learning Value | High | Moderate | Very High |
| Implementation Time | Optimal | Too Simple | Too Complex |
| **Selection** | ✓ SELECTED | | |

### Selected Entities Summary
- **Writer**: Professional who provides writing services
- **Client**: Entity hiring writers for projects
- **Project**: Specific writing assignment/deliverable
- **Submission**: Work product from writer (can be multiple revisions)
- **Payment**: Financial transaction for completed work

### Success Criteria for This Mini World
- [x] Covers 3+ data types (strings, dates, numbers, enums)
- [x] Includes 1:N and 1:1 relationships
- [x] Has business rules and constraints
- [x] Includes temporal data (dates, status progression)
- [x] Real-world applicable
- [x] Completable in semester timeframe
- [x] Clear ERD representations