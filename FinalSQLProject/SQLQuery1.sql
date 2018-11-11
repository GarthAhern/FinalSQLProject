
/*
	Garth Ahern-Hendryx
	Final SQL Project
	*/



CREATE SCHEMA Book;
USE FinalSQLProject
USE AdventureWorks2014
-- Create Tables --
USE FinalSQLProject;


CREATE TABLE Book.Book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BookTitle VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Book.Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

Drop Table Book.Book;

INSERT INTO Book.Book
	(BookTitle, PublisherName)
	VALUES
	
	
	('The Once and Future King', 'RandomHouse'),
	('A Fire Upon the Deep', 'DoubleDay'),
	('The Stand', 'Ballantine Books'),
	('It', 'Ballantine Books'),
	('Neuromancer', 'John Wiley & Sons'),
	('Hitchhikers Guide to the Galaxy', 'Macmillan Publishers'),
	('Dune', 'Dutton'),
	('A Song of Ice and Fire', 'Pearson'),
	('I, Claudius', 'Wiley'),
	('Canterbury Tales', 'Simon & Schuster'),
	('Starship Troopers', 'Charles Scribners Sons'),
	('Edge of Eternity', 'Cambridge University Press'),
	('Harry Potter and the Chamber of Secrets', 'Faber and Faber'),
	('Harry Potter and the Scorcerers Stone', 'Faber and Faber'),
	('Harry Potter and the Prisoner of Azkaban', 'Faber and Faber'),
	('Harry Potter and the Goblet of Fire', 'Faber and Faber'),
	('Harry Potter and the Order of the Pheonix', 'Faber and Faber'),
	('Harry Potter and the Half Blood Prince', 'Faber and Faber'),
	('Harry Potter and the Deathly Hallows', 'Faber and Faber'),
	('The Stars, Like Dust', 'Atheneum Books'),
	('Cryptonomicon', 'Applewood Books'),
	('Wind, Sand and Stars', 'Yale University Press'),
	('The Killer Angels', 'Cambridge University Press'),
	
	('The Lost Tribe', 'Saratoga')
;


DROP TABLE Book.BookAuthors;
CREATE TABLE Book.BookAuthors (
	BookID INT PRIMARY KEY NOT NULL CONSTRAINT ba_BookID FOREIGN KEY REFERENCES Book.Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(100) NOT NULL,
);

SELECT * FROM Book.Book;
INSERT INTO Book.BookAuthors
	(BookID, AuthorName)
	VALUES
	
	(3, 'T.H. White'),
	(4, 'Vernor Vinge'),
	(5, 'Stephen King'),
	(6, 'Stephen King'),
	(7, 'William Gibson'),
	(8, 'Douglas Adams'),
	(9, 'Frank Herbert'),
	(10, 'George R. R. Martin'),
	(11, 'Robert Graves'),
	(12, 'Chaucer'),
	(13, 'Robert Heinlein'),
	(14, 'Ken Follett'),
	(15, 'J.K. Rowling'),
	(16, 'J.K. Rowling'),
	(17, 'J.K. Rowling'),
	(18, 'J.K. Rowling'),
	(19, 'J.K. Rowling'),
	(20, 'J.K. Rowling'),
	(21, 'J.K. Rowling'),
	(22, 'Isaac Asimov'),
	(23, 'Neal Stephenson'),
	(24, 'Antoine de Saint-Exupéry'),
	(25, 'Michael Shaara'),
	
	(27, 'Mathew Caldwell')
	;
	SELECT * FROM Book.Book;
	


CREATE TABLE Book.LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(100) NOT NULL,
	BranchAddress VARCHAR(100) NOT NULL
);


INSERT INTO Book.LibraryBranch 
(BranchName, BranchAddress)
Values 
('Sharpstown', '4477 Dortmund Road, Seattle WA, 99805'),
('Central', '7543 Kirkland Way, Seattle WA, 98033'),
('Northshore', '123 Rainier Way, Seattle WA, 99803'),
('Wellington', '3598 Monroe Street, Spokane WA, 99201')
;
SELECT * FROM Book.LibraryBranch;


CREATE TABLE Book.Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName VARCHAR(100) NOT NULL,
	BorrowerAddress VARCHAR(100) NOT NULL,
	BorrowerPhone VARCHAR(100) NOT NULL,
);
DROP TABLE Book.Borrower;
INSERT INTO Book.Borrower
(BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
('Frank Longfellow', '3737 Wallace Street, Boise ID, 45603', '3456789825'),
('Nancy Prenderghast', '12 North Waldorf St. Bointon Beach Florida 33704', '707-114-3286'),
('George S. Staughte', '77 Peninsula Way Northeast, Dayton OH, 532344', '(425) 771-9834'),
('Devon Warwick', '11 North Alpine Drive Bonnevill, Maryland 32998', '645-433-3753'),
('Flora Tanner', '46 Whitworth Way Duncan, Michigan 73244', '(198) 992-5832'),
('Eric James', '7 Littlefield Court Crescent, Billings MT, 3459', '(345)546-198'),
('Sarah Hughes', '99 Sun Ranch Road, Luna Vista, NM 22345', '606-888-7234'),
('William Littlefield', '456 Ferndale Heights Road, Mazama WA, 97453', '649-5932')
;
SELECT * FROM Book.Borrower;


CREATE TABLE Book.BookAuthors (
	BookID INT PRIMARY KEY NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Book.Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(100) NOT NULL,
);

CREATE TABLE Book.Publisher (
	PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(100) NOT NULL,
	PublisherPhone VARCHAR(100) NOT NULL,
);

INSERT INTO Book.Publisher 
(publisherName, publisherAddress, PublisherPhone)
VALUES

/*
	('RandomHouse', '4365 Front Stree Albany New York,', '456-345-45436'),
	('DoubleDay', '6437 Soreland Court Road, Las Vegas Nevada', '567-929-7382'),
	('Ballantine Books', '3467 Freitag Point', '567-929-7382'),
	('John Wiley & Sons', '3457 Sunset Way Chicago, Ill 34595', '345-768-3445'),
	('Macmillan Publishers', '379 Crown Court Way NE', '455-398-1209'),
	('Dutton', '2500 McCallister Street New York, New York 84839', '874-993-0846'),
	('Pearson', '745 Openshaw Road, London England', '11235-235-24545-2'),
	('Wiley', '700 Wall Street, New York New York, 23943', '(345) 349-2323'),
	('Simon & Schuster', '400 South Harper Road, Clinton Illionois, 84845', '404-239-5833'),
	('Charles Scribners Sons', '12 Westfield Street, Macomb Missouri, 34453', '4563232958'),
	('Cambridge University Press', '34 State Street Wilmington Wisconsin, 45633', '555-221-7642'),
	('Faber and Faber', '1221 Whitlaw Street, Staffordshire England', '34552-45346-233'),
	('Atheneum Books', '27 Tortchwood Lane, Washington DC, 40441', '445-343-9984'),
	('Applewood Books', '221 Independance Avenue, Scottsdale Maine, 29495', '3449924543'),
	('Yale University Press', '171 East Aldershot Way, Campagna VT, 73720', '343-455-8752')
	*/
	('Saratoga', '876 Church Street Dale Plaza Norfolk Virginia', '456-901-0021');
;

DROP TABLE Book.BookLoans;
CREATE TABLE Book.BookLoans (
	BookID INT NOT NULL CONSTRAINT bl_BookID FOREIGN KEY REFERENCES Book.Book (BookID)  ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT bl_BranchID FOREIGN KEY REFERENCES Book.LibraryBranch (BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_cardno FOREIGN KEY REFERENCES Book.Borrower (CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate AS DATEADD(DAY,30,DateOut) PERSISTED,
	
);

SELECT * FROM Book.Borrower
INSERT INTO Book.BookLoans
(BookID, BranchID, CardNo, DateOut)
VALUES
/*(6, 2, 1, '2018-09-12'),

(3, 3, 1, '2018-09-04'),(3, 3, 6, '2018-09-22'),(3, 2, 8, '2018-08-29'),(3, 4, 5, '2018-09-11'),(3, 4, 7, '2018-09-03'),
(4, 4, 2, '2018-08-04'),(4, 4, 5, '2018-07-16'),(4, 4, 1, '2018-09-03'),(4, 3, 8, '2018-09-02'),(5, 1, 5, '2018-09-09'),
(5, 3, 2, '2018-08-22'),(5, 3, 7, '2018-08-06'),(5, 3, 2, '2018-10-1'),(6, 3, 1, '2018-10-08'),(6, 3, 5, '2018-10-09'),
(6, 3, 7, '2018-09-27'),(7, 4, 5, '2018-09-04'),(7, 4, 5, '2018-09-17'),(7, 2, 1, '2018-09-19'),(8, 3, 6, '2018-08-12'),
(8, 3, 7, '2018-10-07'),(8, 4, 8, '2018-10-09'),(9, 2, 7, '2018-10-1'),(9, 2, 2, '2018-06-12'),(10, 3, 2, '2018-09-12'),
(10, 4, 4, '2018-07-28'),(10, 2, 8, '2018-10-02'),(11, 4, 5, '2018-09-30'),(11, 3, 7,'2018-09-23'),(11, 1, 1,'2018-10-06'),
(12, 3, 1, '2018-09-09'),(12, 4, 7, '2018-09-17'),(12, 4, 8, '2018-10-02'),(13, 3, 1, '2018-09-19'),(15, 3, 4, '2018-09-22'),
(15, 3, 2, '2018-08-24'),(16, 1, 2, '2018-09-03'),(16, 3, 1, '2018-10-02'),(17, 3, 1, '2018-09-01'),(18, 3, 1, '2018-10-08'),
(19, 2, 5, '2018-10-06'),(19, 3, 6, '2018-09-25'),(19, 3, 7, '2018-07-13'),(20, 4, 4, '2018-09-26'),(21, 2, 5, '2018-09-11'),
(22, 3, 1, '2018-09-16'),(23, 4, 4, '2018-10-04'),(24, 4, 5, '2018-09-19'),(25, 3, 1, '2018-10-03'),(27, 3, 1, '2018-08-28')
*/
(3, 4, 1, '2018-10-9')
;


CREATE TABLE Book.BookCopies (
	BookID INT NOT NULL CONSTRAINT bc_BookID FOREIGN KEY REFERENCES Book.Book (BookID)  ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT bc_BranchID FOREIGN KEY REFERENCES Book.LibraryBranch (BranchID)  ON UPDATE CASCADE ON DELETE CASCADE,
	NoOfCopies INT NOT NULL 
);	

SELECT * FROM Book.Book;
INSERT INTO Book.BookCopies
(BookID, BranchID, NoOfCopies)
VALUES
(3,1,5),(3,2,2),(3,3,3),(3,4,8),
(4,1,3),(4,2,0),(4,3,3),(4,4,3),

(5,1,3),(5,2,0),(5,3,8),(5,4,5),
(6,1,5),(6,2,3),(6,3,7),(6,4,1),

(7,1,1),(7,2,2),(7,3,4),(7,4,10),
(8,1,3),(8,2,9),(8,3,5),(8,4,4),

(9,1,0),(9,2,2),(9,3,0),(9,4,4),
(10,1,1),(10,2,5),(10,3,1),(10,4,5),

(11,1,8),(11,2,2),(11,3,3),(11,4,6),
(12,1,2),(12,2,4),(12,3,3),(12,4,3),

(13,1,4),(13,2,0),(13,3,1),(13,4,6),
(14,1,3),(14,2,0),(14,3,0),(14,4,0),

(15,1,2),(15,2,2),(15,3,7),(15,4,3),
(16,1,2),(16,2,2),(16,3,2),(16,4,2),

(17,1,5),(17,2,4),(17,3,8),(17,4,0),
(18,1,2),(18,2,5),(18,3,4),(18,4,4),
(19,1,0),(19,2,1),(19,3,1),(19,4,1),

(20,1,6),(20,2,6),(20,3,6),(20,4,6),
(21,1,2),(21,2,3),(21,3,4),(21,4,5),

(22,1,7),(22,2,8),(22,3,9),(22,4,9),
(23,1,4),(23,2,3),(23,3,2),(23,4,4),

(24,1,0),(24,2,0),(24,3,2),(24,4,2),
(25,1,1),(25,2,2),(25,3,2),(25,4,2),

(27,1,5),(27,2,5),(27,3,5),(27,4,5)
;
SELECT * FROM Book.BookCopies;

SELECT * FROM Book.BookCopies

DROP TABLE Book.BookLoans

DECLARE @count int = 5
PRINT @count
DECLARE @bob DATE = GETDATE();
Declare @a INT = FLOOR(RAND() * 500)
PRINT @a

/*1.) How many copies of the book titled
 "The Lost Tribe" are owned by the 
library branch whose name is "Sharpstown"?
*/

SELECT BookTitle, BranchName, NoOfCopies FROM Book.BookCopies bc
	INNER JOIN Book.Book b ON bc.BookID = b.BookID
	INNER JOIN Book.LibraryBranch br ON bc.BranchID = br.BranchID
	WHERE  BookTitle = 'The Lost Tribe'
	AND BranchName = 'Sharpstown';

	/*2.) How many copies of the book titled 
	"The Lost Tribe" are owned by each library branch?*/
	SELECT BookTitle, BranchName, NoOfCopies FROM Book.BookCopies bc
	INNER JOIN Book.Book b ON bc.BookID = b.BookID
	INNER JOIN Book.LibraryBranch br ON bc.BranchID = br.BranchID
	WHERE  BookTitle = 'The Lost Tribe'
	
		/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/

	SELECT BorrowerName FROM Book.Borrower
	WHERE NOT EXISTS
		(SELECT * FROM Book.BookLoans
		WHERE CardNo = Book.Borrower.CardNo)

 /*4.) For each book that is loaned out from the "Sharpstown"
  branch and whose DueDate is today, retrieve the book title,
   the borrower's name, and the borrower's address. */
   DECLARE @3 Date = GETDATE();
   Print @3;
   SELECT b.BookTitle, bo.BorrowerName, bo.BorrowerAddress
    FROM Book.BookLoans AS bl
   INNER JOIN Book.LibraryBranch AS lb ON lb.BranchID = bl.BranchID
   INNER JOIN Book.Borrower AS bo ON bo.CardNo = bl.CardNo
   INNER JOIN Book.Book AS b ON b.BookID = bl.BookID
   WHERE DueDate = CAST(GETDATE() AS char) AND BranchName = 'Sharpstown'

/*5.) For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch.*/




SELECT BranchName, COUNT(bl.BranchID) AS 'Total Loaned'
FROM Book.BookLoans AS bl
INNER JOIN Book.LibraryBranch AS lb ON lb.BranchID = bl.BranchID
WHERE bl.BranchID = lb.BranchID
GROUP BY lb.BranchName

/*6.) Retrieve the names, addresses, and the number of books 
checked out for all borrowers who have more than five books checked out.*/
SELECT BorrowerName, COUNT(BookID) FROM Book.BookLoans bl
	INNER JOIN Book.Borrower bw ON bl.CardNo = bw.CardNo	
	GROUP BY bw.BorrowerName
	HAVING COUNT(BookID) > 5 

/*7.) For each book authored (or co-authored) by "Stephen 
King", retrieve the title and the number of copies owned by
 the library branch whose name is "Central".*/

 SELECT BookTitle, NoOfCopies
  FROM Book.BookCopies bc
	INNER JOIN Book.Book b ON bc.BookID = b.BookID
	INNER JOIN Book.LibraryBranch br ON bc.BranchID = br.BranchID
	INNER JOIN Book.BookAuthors ba ON bc.BookID = ba.BookID
	WHERE AuthorName = 'Stephen King'
	AND BranchName = 'Central'
	