USE [master]
GO
CREATE DATABASE [FPT_Test]
GO
USE [FPT_Test]
GO
CREATE TABLE [Subject](
	[subjectID] [int] IDENTITY(1,1) NOT NULL primary key,
	[subjectName] [nvarchar](100) NOT NULL)
GO
CREATE TABLE [Class](
	[classID] [int] IDENTITY(1,1) NOT NULL primary key,
	[className] [nvarchar](100) NOT NULL,
	[classContent] [text],
	[subjectID] [int])
GO
ALTER TABLE [Class]
ADD CONSTRAINT fk_class
FOREIGN KEY (subjectID)
REFERENCES  [Subject](subjectID)
ON DELETE CASCADE;
GO
CREATE TABLE [Test](
	[testID] [int] IDENTITY(1,1) NOT NULL primary key,
	[testName] [nvarchar](max) NOT NULL,
	[classID] [int],
	[testContent] [text],
	[difficulty] [int] NOT NULL)
GO
ALTER TABLE [Test]
ADD CONSTRAINT fk_test
FOREIGN KEY (classID)
REFERENCES  [Class](classID)
ON DELETE CASCADE;
GO
CREATE TABLE [Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL primary key,
	[testID] [int] NOT NULL,
	[questionContent] [nvarchar](max) NOT NULL,
	[opt1] [nvarchar](100) NOT NULL,
	[opt2] [nvarchar](100) NOT NULL,
	[opt3] [nvarchar](100) NOT NULL,
	[opt4] [nvarchar](100) NOT NULL,
	[rightOption] [int] NOT NULL)
GO
ALTER TABLE [Question]
ADD CONSTRAINT fk_question
FOREIGN KEY (testID)
REFERENCES  Test(testID)
ON DELETE CASCADE;
GO
CREATE TABLE [User](
	[userID] [int] IDENTITY(1,1) NOT NULL primary key,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[userType] [int] NOT NULL)
GO
CREATE TABLE [Mark](
	[userID] [int] NOT NULL,
	[testID] [int] NOT NULL,
	[mark] [int] NOT NULL)
GO
ALTER TABLE [Mark]
ADD CONSTRAINT fk_mark
FOREIGN KEY (testID)
REFERENCES  Test(testID)
ON DELETE CASCADE;
GO
ALTER TABLE [Mark]
ADD CONSTRAINT fk_mark2
FOREIGN KEY (userID)
REFERENCES  [User](userID)
ON DELETE CASCADE;
GO
CREATE TABLE [UserResponse](
	[responseID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL foreign key references [User](userID),
	[title] [nvarchar](max) NOT NULL,
	[responseContent] [text] NOT NULL)
GO
CREATE TABLE [User_Question](
	[userID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[isTrue] [bit])
GO
ALTER TABLE [User_Question]
ADD CONSTRAINT fk_user_ques1
FOREIGN KEY (userID)
REFERENCES  [User](userID)
ON DELETE CASCADE;
GO
ALTER TABLE [User_Question]
ADD CONSTRAINT fk_user_ques2
FOREIGN KEY (questionID)
REFERENCES  [Question](questionID)
ON DELETE CASCADE;
GO
INSERT [Subject] ([subjectName]) VALUES (N'English')
INSERT [Subject] ([subjectName]) VALUES (N'PRJ321')
INSERT [Subject] ([subjectName]) VALUES (N'WIG')
GO

INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'TIENG ANH THAY BANG', N'LOP TIENG ANH CHO NGUOI MAT GOC', 1)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'TIENG ANH THAY KHOA', N'LOP TIENG ANH CHO NGUOI DI LAM', 1)
GO

INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 English', 1, N'Mot bai tieng anh hay', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 English', 1, N'Mot bai tieng anh hay', 2)
GO

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'What happened when the tomato first came to Europe?', N'It was welcomed vvnvn', N'People did not like it', N'Doctors suggested people eat tomatoes for good health', N'People grew it for food.', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'What is something tomatoes are NOT used for?', N'Ketchup', N'Juice', N'Pastries', N'Soup', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'What helps control the price of tomatoes in Canada?', N'The government passes laws to lower vegetable prices', N'Big farming companies use cheap workers from other countries', N'Consumer demand keeps prices down', N'Many people don''t like tomatoes', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'According to the reading, how are the tomato workers treated unfairly', N'They work in unsafe conditions', N'Canadians are not polite to them', N'They are paid good wages', N'They are not allowed to stay in Canada', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'When you are growing your own tomatoes, where should you put the plant and how much sunlight will it need?', N'You should put it in the kitchen and it will not need any direct sunlight.', N'You should put it by a window and it will need 4 hours of sunlight per day', N'It needs to be outside', N'It needs to be in the garage with sunlight all day', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'What does David want to buy his Mother?', N'a special birthday present', N'a Christmas present', N'a spider ring', N'none of these', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Who does David get his money from?', N'his pet', N'his mother', N'his father', N'none of these', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'How much money does David take to the mall?', N'$20.00', N'$5.00', N'$17.00', N'none of these', 1)
GO

INSERT [User] ([username], [password], [email], [userType]) VALUES (N'user', N'user', N'user1@gmail.com', 2)
INSERT [User] ([username], [password], [email], [userType]) VALUES (N'user2', N'user2', N'user2@gmail.com', 2)
INSERT [User] ([username], [password], [email], [userType]) VALUES (N'admin', N'admin', N'admin1@gmail.com', 1)
GO

INSERT [Mark] ([testID], [userID], [mark]) VALUES (1, 1, 7)
INSERT [Mark] ([testID], [userID], [mark]) VALUES (1, 2, 5)
GO

INSERT [UserResponse] ([userID], [title], [responseContent]) VALUES (1, N'Rat Hay', N'Binh thuong')
