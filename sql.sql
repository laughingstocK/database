SELECT *
FROM Room
WHERE price < 40 AND type IN ('D', 'F')
ORDER BY price;

SELECT *
FROM Booking
WHERE dateTo IS NULL;

SELECT hotelNo, COUNT(roomNo) AS roomCount
     FROM Room
     GROUP BY hotelNo;

CREATE VIEW GuestFromUK AS
           SELECT *
           FROM Guest
           WHERE guestAddress like “%United Kingdom%” OR
                 guestAddress like “%UK%”

CREATE TABLE Play (
  PlayNum VARCHAR(5) NOT NULL,
  Title VARCHAR(30),
  Period VARCHAR(15),
  Type VARCHAR(15),
  Writer VARCHAR(25),
  PRIMARY KEY (PlayNum)
);
CREATE TABLE Actor (
  ActNum VARCHAR(5) NOT NULL,
  Name VARCHAR(20),
  Address VARCHAR(45),
  Type VARCHAR(10),
  PRIMARY KEY (ActNum)
);
CREATE TABLE Participate (
  PlayNum VARCHAR(5) NOT NULL,
  ActNum VARCHAR(5) NOT NULL,
  PlayDate DATE NOT NULL,
  StartTime VARCHAR(5),
  PRIMARY KEY (PlayNum, ActNum, PlayDate),
  FOREIGN KEY (PlayNum) REFERENCES Play,
  FOREIGN KEY (ActNum) REFERENCES Actor
);
CREATE TABLE Ticket (
  SeatNum VARCHAR(4) NOT NULL,
  PlayDate DATE NOT NULL,
  PlayCode VARCHAR(5) NOT NULL,
  StartTime VARCHAR(5),
  Price NUMBER(4),
  PRIMARY KEY (SeatNum, PlayDate, PlayCode),
  FOREIGN KEY (PlayCode) REFERENCES Play
);

INSERT INTO Play VALUES
('P11', 'Madamme Butterfly', '19:30', 'Spring 2019', 'Opera', 'G.
Puccini');
INSERT INTO Actor VALUES
('A1', 'Mary White', '15 High Street London SW1', 'Opera');
INSERT INTO Participate VALUES
('P11', 'A1', '10-Jun-2019', '19:30');
INSERT INTO Ticket VALUES
('A12', '10-Jun-2019', 'P11', '19:30', 50,);

SELECT *
FROM   Play
WHERE  Play.Title LIKE '%Family%';

SELECT SUM(Ticket.Price)
FROM Ticket
WHERE Ticket.PlayCode = 'P12'
AND Ticket.PlayDate = '20-Jun-2019';

SELECT Actor.Name
FROM   Play, Actor, Participate
WHERE  Play.PlayNum = Participate.PlayNum AND
Actor.ActNum = Participate.ActNum AND
Participate.PlayDate = '20-Jun-2019' AND
Play.Writer = 'Shakespeare';

CREATE VIEW GoodSeats AS
(
SELECT SeatNum3
FROM Ticket
WHERE Ticket.Price >= 25 AND Ticket.PlayCode IN
     (SELECT PlayNum
      FROM   Play
      WHERE  Play.title = 'Madame Butterfly')


SELECT * FROM history a JOIN Animal b 
ON a.AniCode = b.AniCode
where b.Type ='griaffe';

SELECT count(*) AS totalNumofTimes 
FROM Takes_care a JOIN Staff b ON a.StaffCode=b.StaffCode
JOIN Animal c ON a.AniCode =c.AniCode
where b.name ='John White' and c.AniCode='AA12';

SELECT name, AniCode FROM Takes_care a JOIN Staff b ON a.StaffCode=b.StaffCode 
Order by b.Name


