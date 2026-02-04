
-- COACH TABLE

INSERT INTO Coach (CoachID, Name, Email, CertificationLevel, Speciality)
VALUES (102, 'Sean O''Malley', 'sean.omalley@email.com', 'Level 1', 'Tackling');

SELECT * FROM Coach;

UPDATE Coach
SET CertificationLevel = 'Level 3'
WHERE CoachID = 102;

DELETE FROM Coach
WHERE CoachID = 102;

-- TEAM TABLE
INSERT INTO Team (TeamID, TeamName, AgeGroup, CoachID)
VALUES (2014, 'Super Eagles', '18+', 100);

SELECT * FROM Team;

UPDATE Team
SET TeamName = 'Mega Eagles'
WHERE TeamID = 2014;

DELETE FROM Team
WHERE TeamID = 2014;


-- MEMBER TABLE
INSERT INTO Member (MemberID, Name, ContactInformation, DateOfBirth, RegistrationDate, Category, PositionPlayed, TeamID)
VALUES (2002, 'Emily Ryan', 'emily.ryan@email.com', '2005-05-12', '2024-03-01 10:00:00', 'Junior', 'Midfield', 2012);

SELECT * FROM Member;

UPDATE Member
SET PositionPlayed = 'Forward'
WHERE MemberID = 2002;

DELETE FROM Member
WHERE MemberID = 2002;

-- MATCH TABLE
INSERT INTO `Match` (MatchID, MatchDate, Location, Result, HomeTeamID, AwayTeamID)
VALUES (213, '2024-12-01', 'Green Field', '10-8', 2012, 2013);

SELECT * FROM `Match`;

UPDATE `Match`
SET Result = '14-10'
WHERE MatchID = 213;

DELETE FROM `Match`
WHERE MatchID = 213;

-- EVENT TABLE
INSERT INTO Event (EventID, EventName, EventType, EventDate, Location, CoachID)
VALUES (258, 'Winter Bootcamp', 'Training', '2025-01-10', 'Gym Hall', 101);

SELECT * FROM Event;

UPDATE Event
SET Location = 'Main Field'
WHERE EventID = 258;

DELETE FROM Event
WHERE EventID = 258;

-- Codd’s Rules Demonstration 
-- Rule 1 – Information Rule: Demonstrates that all data is represented in tables.
SELECT * FROM Member;

-- Rule 2 – Guaranteed Access Rule: Accessing data using table name, column, and primary key
SELECT ContactInformation
FROM Member
WHERE MemberID = 2000;

-- Rule 6 – View Updating Rule: Demonstrates logical data independence using a VIEW.
CREATE VIEW TeamCoachView AS
SELECT 
    Team.TeamID,
    Team.TeamName,
    Coach.Name AS CoachName
FROM Team
JOIN Coach ON Team.CoachID = Coach.CoachID;

