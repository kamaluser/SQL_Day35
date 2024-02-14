CREATE DATABASE Course
USE Course

CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	Fullname NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE,
	Point TINYINT CHECK(Point>=0 AND Point<=100)
)

INSERT INTO Students(Fullname, Email, Point)
VALUES
('Nazim Abbasov', 'nazim@gmail.com', 85),
('Elnur Recebli', 'elnur@gmail.com', 15),
('Akif Agayev', 'akif@gmail.com', 35),
('Ruslan Aliyev', 'ruslan@gmail.com', 100),
('Samir Orucov', 'samir@gmail.com', 96)

--Point dəyəri bütün tələbə pointlərinin ortalamasından böyük olan tələbəli select edən query

SELECT * FROM Students
WHERE Point > (SELECT AVG(Point) FROM Students)

--Students datalarını Id, Name,Point columnları kimi select edən query (burada fullname-i substring edib as Name kimi select edin)

SELECT Id, SUBSTRING(Fullname, 1, CHARINDEX(' ', Fullname)-1) as Name, Point FROM Students

--Student datalarının email domainlərini (@-dən sonraki hissə) select edən query

SELECT SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email)-CHARINDEX('@' ,Email)) AS Email_Domain FROM Students