-- 1. Show all writers and their specializations
SELECT w.Name, s.Name AS Specialization
FROM Writer w
JOIN Specialization s ON w.SpecializationID = s.SpecializationID;

-- 2. List all active projects
SELECT Title, Status, Budget
FROM Project
WHERE Status = 'In Progress';

-- 3. Total earnings per writer
SELECT w.Name, SUM(p.Budget) AS TotalEarnings
FROM Writer w
JOIN Project p ON w.WriterID = p.WriterID
GROUP BY w.WriterID;

-- 4. Project count per client
SELECT c.Name, COUNT(p.ProjectID) AS ProjectCount
FROM Client c
JOIN Project p ON c.ClientID = p.ClientID
GROUP BY c.ClientID;

-- 5. Show all submissions with project titles
SELECT pr.Title, s.Version, s.Status, s.SubmissionDate
FROM Submission s
JOIN Project pr ON s.ProjectID = pr.ProjectID;

-- 6. Highest paid projects
SELECT Title, Budget
FROM Project
ORDER BY Budget DESC
LIMIT 5;

-- 7. Writers who earned above average
SELECT Name
FROM Writer
WHERE WriterID IN (
    SELECT WriterID
    FROM Project
    GROUP BY WriterID
    HAVING AVG(Budget) > (
        SELECT AVG(Budget) FROM Project
    )
);

-- 8. Total payments received per project
SELECT ProjectID, SUM(Amount) AS TotalPaid
FROM Payment
GROUP BY ProjectID;

-- 9. Completed projects and writers
SELECT p.Title, w.Name
FROM Project p
JOIN Writer w ON p.WriterID = w.WriterID
WHERE p.Status = 'Completed';

-- 10. Latest submission per project
SELECT *
FROM LatestSubmissions;

-- 11. Clients who spent more than $5000
SELECT c.Name, SUM(p.Budget) AS TotalSpent
FROM Client c
JOIN Project p ON c.ClientID = p.ClientID
GROUP BY c.ClientID
HAVING TotalSpent > 5000;

-- 12. Payment status breakdown
SELECT Status, COUNT(*) AS PaymentCount
FROM Payment
GROUP BY Status;