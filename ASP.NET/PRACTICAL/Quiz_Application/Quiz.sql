USE [master]
GO
/****** Object:  Database [QuizManagement_System]    Script Date: 12-03-2025 7.53.45 PM ******/
CREATE DATABASE [QuizManagement_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizManagement_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuizManagement_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizManagement_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuizManagement_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuizManagement_System] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizManagement_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizManagement_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizManagement_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizManagement_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizManagement_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizManagement_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizManagement_System] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuizManagement_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizManagement_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizManagement_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizManagement_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizManagement_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizManagement_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizManagement_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizManagement_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizManagement_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizManagement_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizManagement_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizManagement_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizManagement_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizManagement_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizManagement_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizManagement_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizManagement_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizManagement_System] SET  MULTI_USER 
GO
ALTER DATABASE [QuizManagement_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizManagement_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizManagement_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizManagement_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizManagement_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizManagement_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizManagement_System] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuizManagement_System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuizManagement_System]
GO
/****** Object:  Table [dbo].[MST_Question]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[QuestionLevelID] [int] NOT NULL,
	[OptionA] [nvarchar](100) NOT NULL,
	[OptionB] [nvarchar](100) NOT NULL,
	[OptionC] [nvarchar](100) NOT NULL,
	[OptionD] [nvarchar](100) NOT NULL,
	[CorrectOption] [nvarchar](100) NOT NULL,
	[QuestionMarks] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_QuestionLevel]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_QuestionLevel](
	[QuestionLevelID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionLevel] [nvarchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Quiz]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](100) NOT NULL,
	[TotalQuestions] [int] NOT NULL,
	[QuizDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_QuizWiseQuestions]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_QuizWiseQuestions](
	[QuizWiseQuestionsID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizWiseQuestionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_User]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_Question] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MST_Question] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Question] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_QuestionLevel] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_QuestionLevel] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_Quiz] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Quiz] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_User] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MST_User] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[MST_User] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_User] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_Question]  WITH CHECK ADD FOREIGN KEY([QuestionLevelID])
REFERENCES [dbo].[MST_QuestionLevel] ([QuestionLevelID])
GO
ALTER TABLE [dbo].[MST_Question]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_QuestionLevel]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Quiz]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[MST_Question] ([QuestionID])
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[MST_Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_Register]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_Register]
    @UserName NVARCHAR(50),
    @Password NVARCHAR(50),
    @Email NVARCHAR(500),
    @MobileNo VARCHAR(50)
AS
BEGIN
    INSERT INTO [dbo].[MST_User]
    (
        [UserName],
        [Password],
        [Email],
        [Mobile]
    )
    VALUES
    (
        @UserName,
        @Password,
        @Email,
        @MobileNo
    );
END
select * from [dbo].[MST_User]
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_DeleteQuestionByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Delete a Question by ID
CREATE PROCEDURE [dbo].[Sp_MST_Question_DeleteQuestionByID]
    @QuestionID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_Question]
    WHERE [QuestionID] = @QuestionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_InsertNewQuestion]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Question_InsertNewQuestion]
    @QuestionText NVARCHAR(MAX),
    @QuestionLevelID INT,
    @OptionA NVARCHAR(100),
    @OptionB NVARCHAR(100),
    @OptionC NVARCHAR(100),
    @OptionD NVARCHAR(100),
    @CorrectOption NVARCHAR(100),
    @QuestionMarks INT,
    @UserID INT,
    @IsActive BIT = 1
AS
BEGIN
    INSERT INTO [dbo].[MST_Question] (
							[QuestionText], 
							[QuestionLevelID],
							[OptionA],
							[OptionB],
							[OptionC], 
							[OptionD], 
							[CorrectOption], 
							[QuestionMarks], 
							[IsActive], 
							[UserID], 
							[Created],
							[Modified])
    VALUES (@QuestionText, @QuestionLevelID, @OptionA, @OptionB, @OptionC, @OptionD, @CorrectOption, @QuestionMarks, @IsActive, @UserID, GETDATE(), GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_Search]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Question_Search]
    @QuestionLevel INT = NULL,
    @QuestionText NVARCHAR(MAX) = NULL,
    @QuestionMarks INT = NULL
AS
BEGIN
    SELECT
        Q.QuestionID,
        Q.QuestionText,
        Q.QuestionLevelID,
		L.QuestionLevel,
        Q.OptionA, Q.OptionB, Q.OptionC, Q.OptionD,
        Q.CorrectOption,
        Q.QuestionMarks,
        Q.IsActive,
        Q.UserID,
        U.UserName,
        Q.Created, Q.Modified
    FROM MST_Question Q
    INNER JOIN MST_QuestionLevel L ON Q.QuestionLevelID = L.QuestionLevelID
    INNER JOIN MST_User U ON Q.UserID = U.UserID
    WHERE
        (@QuestionLevel IS NULL OR Q.QuestionLevelID = @QuestionLevel)
        AND (@QuestionText IS NULL OR Q.QuestionText LIKE '%' + @QuestionText + '%')
        AND (@QuestionMarks IS NULL OR Q.QuestionMarks = @QuestionMarks);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_SelectAllQuestions]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Select All Questions
CREATE PROCEDURE [dbo].[Sp_MST_Question_SelectAllQuestions]
AS
BEGIN
    SELECT	[MST_Question].[QuestionID],
			[MST_Question].[QuestionText],
			[MST_Question].[QuestionLevelID],
			[MST_QuestionLevel].[QuestionLevel],

			[MST_Question].[OptionA], 
			[MST_Question].[OptionB], 
			[MST_Question].[OptionC], 
			[MST_Question].[OptionD],
			[MST_Question].[CorrectOption], 
			[MST_Question].[QuestionMarks], 
			[MST_Question].[IsActive],
			[MST_Question].[UserID],
			[MST_User].[UserName],

		[MST_Question].[Created],
			[MST_Question].[Modified]

    FROM [dbo].[MST_Question] inner join 
	[dbo].[MST_QuestionLevel]
	ON [dbo].[MST_Question].[QuestionLevelID]= [dbo].[MST_QuestionLevel].[QuestionLevelID]
	inner join [dbo].[MST_User]
	ON [dbo].[MST_User].[UserID]= [dbo].[MST_QuestionLevel].[UserID]

END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_SelectQuestionByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Question_SelectQuestionByID]
    @QuestionID INT
AS
BEGIN
    SELECT		[QuestionID],
				[QuestionText],
				[QuestionLevelID],
				[OptionA], 
				[OptionB], 
				[OptionC], 
				[OptionD],
				[CorrectOption],
				[QuestionMarks],
				[IsActive], 
				[UserID], 
				[Created], 
				[Modified]
    FROM [dbo].[MST_Question]
    WHERE [QuestionID] = @QuestionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Question_UpdateQuestion]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Update an Existing Question
CREATE PROCEDURE [dbo].[Sp_MST_Question_UpdateQuestion]
    @QuestionID INT,
    @QuestionText NVARCHAR(MAX),
    @QuestionLevelID INT,
    @OptionA NVARCHAR(100),
    @OptionB NVARCHAR(100),
    @OptionC NVARCHAR(100),
    @OptionD NVARCHAR(100),
    @CorrectOption NVARCHAR(100),
    @QuestionMarks INT,
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[MST_Question]
    SET [QuestionText] = @QuestionText,
        [QuestionLevelID] = @QuestionLevelID,
        [OptionA] = @OptionA,
        [OptionB] = @OptionB,
        [OptionC] = @OptionC,
        [OptionD] = @OptionD,
        [CorrectOption] = @CorrectOption,
        [QuestionMarks] = @QuestionMarks,
        [IsActive] = @IsActive,
        [UserID] = @UserID,
        [Modified] = GETDATE()
    WHERE [QuestionID] = @QuestionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_DeleteByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Delete a Question Level by ID
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_DeleteByID]
    @QuestionLevelID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuestionLevel]
    WHERE [QuestionLevelID] = @QuestionLevelID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_Insert]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_Insert]
    @QuestionLevel NVARCHAR(100),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[MST_QuestionLevel] (
											[QuestionLevel],
											[UserID], 
											[Created], 
											[Modified]
											)
    VALUES (@QuestionLevel, @UserID, GETDATE(), GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_Search]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_Search]
    @QuestionLevelID INT = NULL,
    @Username NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        QL.QuestionLevelID, 
        QL.QuestionLevel, 
        U.Username
    FROM MST_QuestionLevel QL
    LEFT JOIN MST_User U ON QL.UserID = U.UserID
    WHERE 
        (@QuestionLevelID IS NULL OR QL.QuestionLevelID = @QuestionLevelID)
        AND (@Username IS NULL OR U.Username LIKE '%' + @Username + '%')
    ORDER BY QL.QuestionLevelID DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_SelectAll]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_SelectAll]
AS
BEGIN
    SELECT [QuestionLevelID], 
			[QuestionLevel],
			[dbo].[MST_QuestionLevel].[UserID],
			[dbo].[MST_User].[UserName],
			[dbo].[MST_QuestionLevel].[Created],
			[dbo].[MST_QuestionLevel].[Modified]
    FROM  [dbo].[MST_QuestionLevel]
	inner join  [dbo].[MST_User]
	on   [dbo].[MST_User].[UserID] =  [dbo].[MST_QuestionLevel].[UserID]
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_SelectByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_SelectByID]
    @QuestionLevelID INT
AS
BEGIN
    SELECT 
			[QuestionLevelID],
			[QuestionLevel],
			[UserID],
			[Created],
			[Modified]
    FROM [dbo].[MST_QuestionLevel]
    WHERE QuestionLevelID = @QuestionLevelID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_SelectfromDropdown]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Select Question Level by ID
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_SelectfromDropdown]
   
AS
BEGIN
    SELECT [QuestionLevelID], [QuestionLevel]
    FROM  [dbo].[MST_QuestionLevel]
    order by [QuestionLevel]
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuestionLevel_Update]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuestionLevel_Update]
    @QuestionLevelID INT,
    @QuestionLevel NVARCHAR(100),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[MST_QuestionLevel]
    SET [QuestionLevel] = @QuestionLevel,
        [UserID] = @UserID,
        [Modified] = GETDATE()
    WHERE [QuestionLevelID] = @QuestionLevelID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_DeleteQuizByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_DeleteQuizByID]
    @QuizID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_Quiz]
    WHERE [QuizID] = @QuizID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_InsertNewQuiz]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_MST_Quiz_InsertNewQuiz]
    @QuizName NVARCHAR(100),
    @TotalQuestions INT,
    @QuizDate DATETIME,
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[MST_Quiz] (
									[QuizName], 
									[TotalQuestions],
									[QuizDate], 
									[UserID],
									[Created], 
									[Modified])
    VALUES (@QuizName, @TotalQuestions, @QuizDate, @UserID, GETDATE(), GETDATE());
END;

GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_Search]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_Search]
    @QuizName NVARCHAR(255) = NULL,
    @MinQuestion INT = NULL,
    @MaxQuestion INT = NULL,
    @QuizDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
[MST_Quiz].[QuizID], 
			[MST_Quiz].[QuizName],
			[MST_Quiz].[TotalQuestions], 
			[MST_Quiz].[QuizDate], 
			[MST_Quiz].[UserID],
			[MST_User].[UserName],
			[MST_Quiz].[Created],
			[MST_Quiz].[Modified]
 FROM [dbo].[MST_Quiz]
	inner join  [dbo].[MST_User]
	on   [dbo].[MST_User].[UserID] =  [dbo].[MST_Quiz].[UserID]
    WHERE 
        (@QuizName IS NULL OR QuizName LIKE '%' + @QuizName + '%')
        AND (@MinQuestion IS NULL OR TotalQuestions >= @MinQuestion)
        AND (@MaxQuestion IS NULL OR TotalQuestions <= @MaxQuestion)
        AND (@QuizDate IS NULL OR QuizDate = @QuizDate)
    ORDER BY QuizDate DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_SelectAllQuizzes]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_SelectAllQuizzes]
AS
BEGIN
    SELECT	[MST_Quiz].[QuizID], 
			[MST_Quiz].[QuizName],
			[MST_Quiz].[TotalQuestions], 
			[MST_Quiz].[QuizDate], 
			[MST_Quiz].[UserID],
			[MST_User].[UserName],
			[MST_Quiz].[Created],
			[MST_Quiz].[Modified]
    FROM [dbo].[MST_Quiz]
	inner join  [dbo].[MST_User]
	on   [dbo].[MST_User].[UserID] =  [dbo].[MST_Quiz].[UserID]
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_SelectfromDropdown]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Select Quiz by SelectfromDropdown
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_SelectfromDropdown]
   
AS
BEGIN
    SELECT [QuizID], [QuizName]
    FROM [dbo].[MST_Quiz]
    order by [QuizName]
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_SelectQuizByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Select Quiz by ID
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_SelectQuizByID]
    @QuizID INT
AS

BEGIN
    SELECT	[QuizID],
			[QuizName], 
			[TotalQuestions], 
			[QuizDate], 
			[UserID], 
			[Created],
			[Modified]
    FROM [dbo].[MST_Quiz]
    WHERE [QuizID] = @QuizID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_Quiz_UpdateQuiz]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Update an Existing Quiz
CREATE PROCEDURE [dbo].[Sp_MST_Quiz_UpdateQuiz]
    @QuizID INT,
    @QuizName NVARCHAR(100),
    @TotalQuestions INT,
    @QuizDate DATETIME,
    @UserID INT
AS
BEGIN
    UPDATE  [dbo].[MST_Quiz]
		SET	[QuizName] = @QuizName,
			[TotalQuestions] = @TotalQuestions,
			[QuizDate] = @QuizDate,
			[UserID] = @UserID,
			[Modified] = GETDATE()
    WHERE [QuizID] = @QuizID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestion_Search]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestion_Search]
    @QuizName NVARCHAR(255) = NULL,
    @Question NVARCHAR(MAX) = NULL,
    @QuizWiseQuestionID INT = NULL
AS
BEGIN
    SELECT [QuizWiseQuestionsID],
           [dbo].[MST_QuizWiseQuestions].[QuizID],
           [dbo].[MST_Quiz].[QuizName],
           [dbo].[MST_QuizWiseQuestions].[QuestionID],
           [dbo].[MST_Question].[QuestionText],
           [dbo].[MST_QuizWiseQuestions].[UserID],
           [dbo].[MST_User].[UserName],
           [dbo].[MST_QuizWiseQuestions].[Created], 
           [dbo].[MST_QuizWiseQuestions].[Modified]
    FROM [dbo].[MST_QuizWiseQuestions]  
    INNER JOIN [dbo].[MST_Quiz] 
        ON [dbo].[MST_QuizWiseQuestions].QuizID = MST_Quiz.QuizID
    INNER JOIN [dbo].[MST_Question]
        ON [dbo].[MST_QuizWiseQuestions].[QuestionID] = [dbo].[MST_Question].[QuestionID]
    INNER JOIN [dbo].[MST_User]
        ON [dbo].[MST_QuizWiseQuestions].[UserID] = [dbo].[MST_User].[UserID]
    WHERE (@QuizName IS NULL OR [MST_Quiz].[QuizName] LIKE '%' + @QuizName + '%')
      AND (@Question IS NULL OR [MST_Question].[QuestionText] LIKE '%' + @Question + '%')
      AND (@QuizWiseQuestionID IS NULL OR [MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionID);
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestions_DeleteByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Delete a QuizWiseQuestion by ID
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestions_DeleteByID]
    @QuizWiseQuestionsID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuizWiseQuestions]
    WHERE [QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestions_Insert]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestions_Insert]
    @QuizID INT,
    @QuestionID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO  [dbo].[MST_QuizWiseQuestions] (
													[QuizID],
													[QuestionID], 
													[UserID], 
													[Created], 
													[Modified])
    VALUES (@QuizID, @QuestionID, @UserID, GETDATE(), GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestions_SelectAll]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestions_SelectAll]
AS
BEGIN
    SELECT [QuizWiseQuestionsID],
			[dbo].[MST_QuizWiseQuestions].[QuizID],
			[dbo].[MST_Quiz].[QuizName],
			[dbo].[MST_QuizWiseQuestions].[QuestionID],
			[dbo].[MST_Question].[QuestionText],
			[dbo].[MST_QuizWiseQuestions].[UserID],
			[dbo].[MST_User].[UserName],

			[dbo].[MST_QuizWiseQuestions].[Created], 
			[dbo].[MST_QuizWiseQuestions].[Modified]
    FROM [dbo].[MST_QuizWiseQuestions]  
	inner join [dbo].[MST_Quiz] 
	ON [dbo].[MST_QuizWiseQuestions].QuizID= MST_Quiz.QuizID
	inner join [dbo].[MST_Question]
	on [dbo].[MST_QuizWiseQuestions].[QuestionID] = [dbo].[MST_Question].[QuestionID]
	inner join [dbo].[MST_User]
	on [dbo].[MST_QuizWiseQuestions].[UserID] = [dbo].[MST_User].[UserID];
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestions_SelectByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestions_SelectByID]
    @QuizWiseQuestionsID INT
AS
BEGIN
    SELECT [QuizWiseQuestionsID], 
			[QuizID],
			[QuestionID],
			[UserID], 
			[Created], 
			[Modified]
    FROM [dbo].[MST_QuizWiseQuestions]
    WHERE [QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_QuizWiseQuestions_Update]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_QuizWiseQuestions_Update]
    @QuizWiseQuestionsID INT,
    @QuizID INT,
    @QuestionID INT,
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[MST_QuizWiseQuestions]
    SET [QuizID] = @QuizID,
        [QuestionID] = @QuestionID,
        [UserID] = @UserID,
        [Modified] = GETDATE()
    WHERE [QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_DeleteUserByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_User_DeleteUserByID]
      @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_User]
    WHERE [UserID] = @UserID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_GetUser_ByID]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_User_GetUser_ByID]

       @UserID INT
AS
BEGIN
    SELECT	[UserID], 
			[UserName],
			[Password],
			[Email], 
			[Mobile], 
			[IsActive], 
			[IsAdmin], 
			[Created], 
			[Modified]
    FROM [dbo].[MST_User]
    WHERE [UserID] = @UserID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_InsertNewUser]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[Sp_MST_User_InsertNewUser]
     @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @Mobile NVARCHAR(100),
    @IsActive BIT = 1,
    @IsAdmin BIT = 0
AS
BEGIN
    INSERT INTO [dbo].[MST_User] (	[UserName], 
									[Password],
									[Email], 
									[Mobile], 
									[IsActive], 
									[IsAdmin], 
									[Created], 
									[Modified] )
    VALUES (@UserName, @Password, @Email, @Mobile, @IsActive, @IsAdmin, GETDATE(), GETDATE());
END;

GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_Search]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_User_Search]
 @UserID INT = NULL,
    @UserName NVARCHAR(100) = NULL,
    @Mobile NVARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UserID, UserName,
			[Password],
			[Email], 
			[Mobile], 
			[IsActive],
			[IsAdmin], 
			[Created], 
			[Modified]
    FROM MST_User
    WHERE (@UserID IS NULL OR UserID = @UserID)
      AND (@UserName IS NULL OR UserName LIKE '%' + @UserName + '%')
      AND (@Mobile IS NULL OR Mobile LIKE '%' + @Mobile + '%');
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_SelectAllUsers]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_User_SelectAllUsers]
AS
BEGIN
    SELECT	[UserID], 
			[UserName],
			[Password],
			[Email], 
			[Mobile], 
			[IsActive],
			[IsAdmin], 
			[Created], 
			[Modified]
    FROM [dbo].[MST_User];
END;
select * from MST_User
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_SelectByUserNamePassword]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Sp_MST_User_SelectByUserNamePassword] 
	@UserName NVARCHAR(100),
    @Password NVARCHAR(100)
AS
BEGIN
    SELECT	
			[dbo].[MST_User].[UserID],
			[dbo].[MST_User].[UserName], 
			[dbo].[MST_User].[Password]
    FROM [dbo].[MST_User]
    WHERE( [UserName] = @UserName OR [Email] = @UserName OR [Mobile] = @UserName )
    AND [Password] = @Password;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_SelectforDropdown]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_MST_User_SelectforDropdown]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UserID, Username FROM MST_User ORDER BY Username;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_MST_User_UpdateUser]    Script Date: 12-03-2025 7.53.46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Update an Existing User
CREATE PROCEDURE [dbo].[Sp_MST_User_UpdateUser]
    @UserID INT,
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @Mobile NVARCHAR(100),
    @IsActive BIT,
    @IsAdmin BIT
AS
BEGIN
    UPDATE MST_User
    SET UserName = @UserName,
        Password = @Password,
        Email = @Email,
        Mobile = @Mobile,
        IsActive = @IsActive,
        IsAdmin = @IsAdmin,
        Modified = GETDATE()
    WHERE UserID = @UserID;
END;
GO
USE [master]
GO
ALTER DATABASE [QuizManagement_System] SET  READ_WRITE 
GO
