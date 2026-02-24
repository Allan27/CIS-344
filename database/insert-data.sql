-- ==========================================
-- SAFE INSERT: Specialization
-- ==========================================
INSERT IGNORE INTO Specialization (Name) VALUES
('Content Writing'),
('Technical Writing'),
('Copywriting'),
('Academic Writing'),
('Grant Writing'),
('UX Writing'),
('Ghostwriting'),
('Journalism'),
('Editing'),
('Social Media Writing');

-- ==========================================
-- SAFE INSERT: Writer
-- ==========================================
INSERT IGNORE INTO Writer (Name, Email, Bio, SpecializationID, JoinedDate) VALUES
('Alice Johnson', 'alice.johnson@email.com', 'SEO-focused blog and long-form content specialist.', 1, '2023-01-15'),
('Brian Smith', 'brian.smith@email.com', 'Software documentation and API technical writer.', 2, '2022-11-01'),
('Carla Gomez', 'carla.gomez@email.com', 'Marketing and brand storytelling expert.', 3, '2023-05-20'),
('Daniel Wu', 'daniel.wu@email.com', 'Academic researcher and citation formatting specialist.', 4, '2021-09-12'),
('Emily Carter', 'emily.carter@email.com', 'Experienced nonprofit grant proposal writer.', 5, '2022-03-08'),
('Frank Miller', 'frank.miller@email.com', 'UX microcopy and product interface content strategist.', 6, '2024-01-10'),
('Grace Patel', 'grace.patel@email.com', 'Professional ghostwriter for executives.', 7, '2023-07-18'),
('Henry Adams', 'henry.adams@email.com', 'Investigative journalist and news contributor.', 8, '2020-06-30'),
('Isabella Rossi', 'isabella.rossi@email.com', 'Developmental editor and proofreading expert.', 9, '2022-12-05'),
('James Thompson', 'james.thompson@email.com', 'Social media strategist and campaign copywriter.', 10, '2023-08-25');

-- ==========================================
-- SAFE INSERT: Client
-- ==========================================
INSERT IGNORE INTO Client (Name, Email, CompanyName, Phone, RegisteredDate) VALUES
('David Lee', 'david.lee@techcorp.com', 'TechCorp', '555-111-1001', '2024-01-10'),
('Emma Davis', 'emma.davis@marketpro.com', 'MarketPro', '555-111-1002', '2024-02-05'),
('Michael Brown', 'michael.brown@innovatex.com', 'InnovateX', '555-111-1003', '2024-02-20'),
('Sophia Martinez', 'sophia.martinez@eduplus.org', 'EduPlus', '555-111-1004', '2024-03-02'),
('William Clark', 'william.clark@greenearth.org', 'GreenEarth', '555-111-1005', '2024-03-10'),
('Olivia Hall', 'olivia.hall@brightads.com', 'BrightAds', '555-111-1006', '2024-03-22'),
('Noah Young', 'noah.young@mediline.com', 'MediLine', '555-111-1007', '2024-04-01'),
('Ava King', 'ava.king@citynews.com', 'CityNews', '555-111-1008', '2024-04-15'),
('Liam Scott', 'liam.scott@startuphub.com', 'StartupHub', '555-111-1009', '2024-05-03'),
('Mia Turner', 'mia.turner@trendbuzz.com', 'TrendBuzz', '555-111-1010', '2024-05-20');

-- ==========================================
-- SAFE INSERT: Project
-- ==========================================
INSERT IGNORE INTO Project
(Title, Description, StartDate, EndDate, Status, Budget, ClientID, WriterID) VALUES
('SEO Blog Campaign', '12-month blog strategy and execution.', '2024-03-01', NULL, 'In Progress', 5000.00, 1, 1),
('API Documentation', 'Complete developer API documentation.', '2024-03-15', '2024-05-30', 'Completed', 7000.00, 3, 2),
('Product Launch Copy', 'Landing pages and ad copy for product launch.', '2024-04-01', NULL, 'In Progress', 6000.00, 2, 3),
('Research Paper Editing', 'APA editing for doctoral dissertation.', '2024-04-05', '2024-04-25', 'Completed', 2000.00, 4, 4),
('Environmental Grant Proposal', 'Federal funding proposal submission.', '2024-04-10', NULL, 'In Progress', 8000.00, 5, 5),
('Mobile App UX Copy', 'User interface microcopy writing.', '2024-04-15', NULL, 'Not Started', 3500.00, 7, 6),
('Executive Memoir', 'Ghostwritten executive autobiography.', '2024-04-20', NULL, 'In Progress', 12000.00, 9, 7),
('Investigative Article Series', '5-part investigative journalism series.', '2024-05-01', NULL, 'In Progress', 9000.00, 8, 8),
('Manuscript Editing', 'Full-length novel editing.', '2024-05-05', NULL, 'Not Started', 4500.00, 10, 9),
('Social Media Campaign', 'Multi-platform campaign management.', '2024-05-10', NULL, 'In Progress', 4000.00, 6, 10);

-- ==========================================
-- SAFE INSERT: Submission
-- ==========================================
INSERT IGNORE INTO Submission
(ProjectID, Version, SubmissionDate, FileURL, Status, ReviewFeedback) VALUES
(1, 1, '2024-03-20', 'https://files.site/blog_v1.docx', 'Reviewed', 'Good structure, expand SEO keywords.'),
(1, 2, '2024-04-15', 'https://files.site/blog_v2.docx', 'Accepted', 'Excellent final draft.'),
(2, 1, '2024-05-25', 'https://files.site/api_docs.pdf', 'Accepted', 'Clear documentation and examples.'),
(3, 1, '2024-04-18', 'https://files.site/launch_copy_v1.docx', 'Reviewed', 'Strong messaging, refine CTA.'),
(4, 1, '2024-04-20', 'https://files.site/editing_v1.docx', 'Accepted', 'Perfect formatting.'),
(5, 1, '2024-04-28', 'https://files.site/grant_v1.pdf', 'Reviewed', 'Add budget breakdown.'),
(6, 1, '2024-05-02', 'https://files.site/ux_copy_v1.docx', 'Submitted', NULL),
(7, 1, '2024-05-10', 'https://files.site/memoir_ch1.docx', 'Reviewed', 'Excellent tone and voice.'),
(8, 1, '2024-05-18', 'https://files.site/article_series_v1.docx', 'Submitted', NULL),
(10, 1, '2024-05-22', 'https://files.site/social_campaign_v1.docx', 'Reviewed', 'Needs stronger engagement hooks.');

-- ==========================================
-- SAFE INSERT: Payment
-- ==========================================
INSERT IGNORE INTO Payment
(ProjectID, Amount, PaymentDate, Status, PaymentMethod) VALUES
(1, 2500.00, '2024-03-25', 'Completed', 'Bank Transfer'),
(1, 2500.00, '2024-04-25', 'Pending', 'Bank Transfer'),
(2, 7000.00, '2024-06-01', 'Completed', 'Credit Card'),
(3, 3000.00, '2024-04-20', 'Completed', 'PayPal'),
(3, 3000.00, '2024-05-20', 'Pending', 'PayPal'),
(4, 2000.00, '2024-04-26', 'Completed', 'Credit Card'),
(5, 4000.00, '2024-04-30', 'Completed', 'Bank Transfer'),
(5, 4000.00, '2024-05-30', 'Pending', 'Bank Transfer'),
(7, 6000.00, '2024-05-15', 'Completed', 'Wire Transfer'),
(10, 2000.00, '2024-05-25', 'Pending', 'Credit Card');

-- ==========================================
-- VERIFY
-- ==========================================
SELECT * FROM Specialization;
SELECT * FROM Writer;
SELECT * FROM Client;
SELECT * FROM Project;
SELECT * FROM Submission;
SELECT * FROM Payment;