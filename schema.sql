DROP DATABASE IF EXISTS `database_project_and_sql`;

CREATE DATABASE database_project_and_sql;

CREATE TABLE Coach (
    CoachID INT,
    Name VARCHAR(100) NOT NULL,
    ContactInformation VARCHAR(150),
    CertificationLevel VARCHAR(100),
    Specialization VARCHAR(100),
	PRIMARY KEY (CoachID)

);

INSERT INTO Coach VALUES(100, 'Hillary Byrne', 'declan.byrne@email.com', 'Level 2', 'Back Play'),
(101, 'Mabel O’Neill', 'sarah.oneill@email.com', 'Level 3', 'Fitness Training');

CREATE TABLE Team (
    TeamID INT,
    TeamName VARCHAR(100) NOT NULL,
    AgeGroup VARCHAR(50),
    CoachID INT,
    FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
	PRIMARY KEY (TeamID)
);
INSERT INTO Team VALUES
(2012, 'Junior Blues', 'U18', 100),
(2013, 'Senior Storm', '18+', 101);


CREATE TABLE Member (
    MemberID INT, 
    Name VARCHAR(100) NOT NULL,
    ContactInformation VARCHAR(150),
    DateOfBirth DATE,
    JoinDate DATETIME,
    MembershipType VARCHAR(50),
    PositionPlayed VARCHAR(50),
	TeamID INT,
	FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
	PRIMARY KEY (MemberID)
);

INSERT INTO Member VALUES(2000, 'John Murphy','John.murphy@email.com', '2003-03-15', '2024-02-10 14:00:00',  'Junior', 'Forward', 2012), (2001, 'Harry Walsh', 'Harry.walsh@email.com', '1998-08-20', '2022-06-01 09:30:00', 'Senior', 'Back', 2013);




CREATE TABLE `Match` (
    MatchID INT,
    MatchDate DATE,
    Venue VARCHAR(100),
    Result VARCHAR(50),
	HomeTeamID INT,
    AwayTeamID INT,
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID),
	PRIMARY KEY (MatchID)
);
INSERT INTO `Match` VALUES(211, '2024-10-05', 'Atlantic Grounds', '12-18', 2012, 2013),
(212, '2024-11-20', 'Storm Arena', '22-22', 2012, 2013); 

CREATE TABLE Event (
    EventID INT,
    EventName VARCHAR(100),
    EventType VARCHAR(50),
    EventDate DATE,
    Location VARCHAR(100),
	CoachID INT,
	FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
	PRIMARY KEY (EventID)
);
INSERT INTO Event VALUES(256, 'Autumn Training Camp', 'Training', '2024-10-16', 'Training Field A', 100), (257, 'Community Rugby Day', 'Social', '2024-12-05', 'Clubhouse Grounds', 101);
