CREATE DATABASE GSM
USE [GSM]
GO
/****** Object:  Table [dbo].[T5_ScheduleNews]    Script Date: 11/30/2011 14:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T5_ScheduleNews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](1000) NULL,
	[Date] [datetime] NULL,
	[ScheduleDate] [datetime] NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
	[NewsSender] [nvarchar](50) NULL,
	[NewsReciever] [nvarchar](1000) NULL,
	[Marked] [int] NULL,
	[Deleted] [bit] NULL,
	[RecurrenceType] [int] NULL,
 CONSTRAINT [PK_T5_ScheduleNews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T2_News]    Script Date: 11/30/2011 14:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T2_News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](1000) NULL,
	[Date] [datetime] NULL,
	[Status] [bit] NULL,
	[Type] [int] NULL,
	[NewsSender] [nvarchar](50) NULL,
	[NewsReciever] [nvarchar](1000) NULL,
	[Marked] [bit] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_T2_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_SelectByType]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_SelectByType]
	@Value varchar(10)
AS

	DECLARE @query varchar(2000);

	SET @query = 'SELECT [Message_ID], [Sender], [Reciever], [Type], [Content], [Date], [Status], [ContactID], [NewsID], [Marked], [Deleted] FROM [dbo].[T1_Message] WHERE [Type] = ''' + @Value + ''''
	EXEC(@query)
GO
/****** Object:  Table [dbo].[T3_Group]    Script Date: 11/30/2011 14:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T3_Group](
	[GroupID] [nvarchar](10) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_T5_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[T2_News_SelectByType]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T2_News_SelectByType]
	@Value varchar(10)
AS

	DECLARE @query varchar(2000);

	SET @query = 'SELECT [NewsID], [Content], [Date], [Status], [Type], [NewsSender], [NewsReciever], [Marked], [Deleted] FROM [dbo].[T2_News] WHERE [Type] = ''' + @Value + ''''
	EXEC(@query)
GO
/****** Object:  Table [dbo].[T4_Contact]    Script Date: 11/30/2011 14:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T4_Contact](
	[ContactID] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[GroupID] [nvarchar](10) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_T4_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_Update]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T3_Group_Update]
	@GroupID nchar(10),
	@GroupName nchar(100) = null,
	@Deleted bit = null

AS

UPDATE [dbo].[T3_Group]
SET
	[GroupID] = @GroupID,
	[GroupName] = @GroupName,
	[Deleted] = @Deleted
 WHERE 
	[GroupID] = @GroupID
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_SelectByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T3_Group_SelectByPrimaryKey]
	@GroupID nchar(10)
AS

	SELECT 
		[GroupID], [GroupName], [Deleted]
	FROM [dbo].[T3_Group]
	WHERE 
			[GroupID] = @GroupID
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_SelectAll]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T3_Group_SelectAll]
AS

	SELECT 
		[GroupID], [GroupName], [Deleted]
	FROM [dbo].[T3_Group]
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_Insert]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- INSERT DU LIEU
CREATE PROCEDURE [dbo].[T3_Group_Insert]
	@GroupID nchar(10) ,
	@GroupName nchar(100) = null ,
	@Deleted bit = null 

AS

INSERT [dbo].[T3_Group]
(
	[GroupID],
	[GroupName],
	[Deleted]

)
VALUES
(
	@GroupID,
	@GroupName,
	@Deleted

)
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_Deleted]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T3_Group_Deleted]
	@GroupID nchar(10),
	@Deleted bit = null

AS

UPDATE [dbo].[T3_Group]
SET
	[GroupID] = @GroupID,
	[Deleted] = @Deleted
 WHERE 
	[GroupID] = @GroupID
GO
/****** Object:  StoredProcedure [dbo].[T3_Group_DeleteByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T3_Group_DeleteByPrimaryKey]
	@GroupID nchar(10)
AS

DELETE FROM [dbo].[T3_Group]
 WHERE 
	[GroupID] = @GroupID
GO
/****** Object:  StoredProcedure [dbo].[T2_News_SelectByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT BY NEWID
CREATE PROCEDURE [dbo].[T2_News_SelectByPrimaryKey]
	@NewsID int
AS

	SELECT 
		[NewsID], [Content], [Date], [Status], [Type], [NewsSender], [NewsReciever], [Marked], [Deleted]
	FROM [dbo].[T2_News]
	WHERE 
			[NewsID] = @NewsID
GO
/****** Object:  StoredProcedure [dbo].[T2_News_SelectAll]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SELECT TAT CA NEWS
CREATE PROCEDURE [dbo].[T2_News_SelectAll]
AS

	SELECT 
		[NewsID], [Content], [Date], [Status], [Type], [NewsSender], [NewsReciever], [Marked], [Deleted]
	FROM [dbo].[T2_News]
GO
/****** Object:  StoredProcedure [dbo].[T2_News_Insert]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T2_News_Insert]
	@NewsID int output,
	@Content nchar(1000) = null ,
	@Date datetime = null ,
	@Status int = null ,
	@Type int = null ,
	@NewsSender nchar(20) = null ,
	@NewsReciever nchar(1000) = null ,
	@Marked int = null ,
	@Deleted bit = null 

AS

INSERT [dbo].[T2_News]
(
	[Content],
	[Date],
	[Status],
	[Type],
	[NewsSender],
	[NewsReciever],
	[Marked],
	[Deleted]

)
VALUES
(
	@Content,
	@Date,
	@Status,
	@Type,
	@NewsSender,
	@NewsReciever,
	@Marked,
	@Deleted

)
	SELECT @NewsID=SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[T2_News_Deleted]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T2_News_Deleted]
	@NewsID int,
	@Deleted bit = null

AS

UPDATE [dbo].[T2_News]
SET

	[Deleted] = @Deleted
 WHERE 
	[NewsID] = @NewsID
GO
/****** Object:  Table [dbo].[T1_Message]    Script Date: 11/30/2011 14:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T1_Message](
	[Message_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](20) NULL,
	[Receiver] [nvarchar](20) NULL,
	[Type] [int] NULL,
	[Content] [nvarchar](1000) NULL,
	[Date] [datetime] NULL,
	[Status] [bit] NULL,
	[ContactID] [nvarchar](50) NULL,
	[NewsID] [int] NULL,
	[Marked] [bit] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_T1_Message] PRIMARY KEY CLUSTERED 
(
	[Message_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[T5_ScheduleNews_Update]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T5_ScheduleNews_Update]
	@ID int,
	@Content nchar(1000) = null,
	@Date datetime = null,
	@ScheduleDate datetime = null,
	@Status int = null,
	@Type int = null,
	@NewsSender nchar(20) = null,
	@NewsReciever nchar(1000) = null,
	@Marked int = null,
	@Deleted bit = null,
	@RecurrenceType int = null

AS

UPDATE [dbo].[T5_ScheduleNews]
SET
	[Content] = @Content,
	[Date] = @Date,
	[ScheduleDate] = @ScheduleDate,
	[Status] = @Status,
	[Type] = @Type,
	[NewsSender] = @NewsSender,
	[NewsReciever] = @NewsReciever,
	[Marked] = @Marked,
	[Deleted] = @Deleted,
	[RecurrenceType] = @RecurrenceType
 WHERE 
	[ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[T5_ScheduleNews_SelectByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T5_ScheduleNews_SelectByPrimaryKey]
	@ID int
AS

	SELECT 
		[ID], [Content], [Date], [ScheduleDate], [Status], [Type], [NewsSender], [NewsReciever], [Marked], [Deleted], [RecurrenceType]
	FROM [dbo].[T5_ScheduleNews]
	WHERE 
			[ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[T5_ScheduleNews_SelectAll]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T5_ScheduleNews_SelectAll]
AS

	SELECT 
		[ID], [Content], [Date], [ScheduleDate], [Status], [Type], [NewsSender], [NewsReciever], [Marked], [Deleted], [RecurrenceType]
	FROM [dbo].[T5_ScheduleNews]
GO
/****** Object:  StoredProcedure [dbo].[T5_ScheduleNews_Insert]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T5_ScheduleNews_Insert]
	@ID int output,
	@Content nchar(1000) = null ,
	@Date datetime = null ,
	@ScheduleDate datetime = null ,
	@Status int = null ,
	@Type int = null ,
	@NewsSender nchar(20) = null ,
	@NewsReciever nchar(1000) = null ,
	@Marked int = null ,
	@Deleted bit = null ,
	@RecurrenceType int = null 

AS

INSERT [dbo].[T5_ScheduleNews]
(
	[Content],
	[Date],
	[ScheduleDate],
	[Status],
	[Type],
	[NewsSender],
	[NewsReciever],
	[Marked],
	[Deleted],
	[RecurrenceType]

)
VALUES
(
	@Content,
	@Date,
	@ScheduleDate,
	@Status,
	@Type,
	@NewsSender,
	@NewsReciever,
	@Marked,
	@Deleted,
	@RecurrenceType

)
	SELECT @ID=SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[T5_ScheduleNews_DeleteByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T5_ScheduleNews_DeleteByPrimaryKey]
	@ID int
AS

DELETE FROM [dbo].[T5_ScheduleNews]
 WHERE 
	[ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[T4_Contact_Update]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T4_Contact_Update]
	@ContactID nchar(10),
	@ContactName nchar(50) = null,
	@PhoneNumber nchar(10) = null,
	@GroupID nchar(10) = null,
	@Deleted bit = null

AS

UPDATE [dbo].[T4_Contact]
SET
	[ContactID] = @ContactID,
	[ContactName] = @ContactName,
	[PhoneNumber] = @PhoneNumber,
	[GroupID] = @GroupID,
	[Deleted] = @Deleted
 WHERE 
	[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[T4_Contact_SelectByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T4_Contact_SelectByPrimaryKey]
	@ContactID nchar(10)
AS

	SELECT 
		[ContactID], [ContactName], [PhoneNumber], [GroupID], [Deleted]
	FROM [dbo].[T4_Contact]
	WHERE 
			[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[T4_Contact_SelectAll]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T4_Contact_SelectAll]
AS

	SELECT 
		[ContactID], [ContactName], [PhoneNumber], [GroupID], [Deleted]
	FROM [dbo].[T4_Contact]
GO
/****** Object:  StoredProcedure [dbo].[T4_Contact_Insert]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T4_Contact_Insert]
	@ContactID nchar(10) ,
	@ContactName nchar(50) = null ,
	@PhoneNumber nchar(10) = null ,
	@GroupID nchar(10) = null ,
	@Deleted bit = null 

AS

INSERT [dbo].[T4_Contact]
(
	[ContactID],
	[ContactName],
	[PhoneNumber],
	[GroupID],
	[Deleted]

)
VALUES
(
	@ContactID,
	@ContactName,
	@PhoneNumber,
	@GroupID,
	@Deleted

)
GO
/****** Object:  StoredProcedure [dbo].[T4_Contact_Deleted]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T4_Contact_Deleted]
	@ContactID nchar(10),
	@Deleted bit = null

AS

UPDATE [dbo].[T4_Contact]
SET
	[ContactID] = @ContactID,
	[Deleted] = @Deleted
 WHERE 
	[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_UpdateMarked]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_UpdateMarked]
	@Message_ID int,
	@Marked int = null


AS

UPDATE [dbo].[T1_Message]
SET

	[Marked] = @Marked

 WHERE 
	[Message_ID] = @Message_ID
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_Update]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_Update]
	@Message_ID int,
	@Sender nchar(20) = null,
	@Reciever nchar(20) = null,
	@Type int = null,
	@Content nchar(1000) = null,
	@Date datetime = null,
	@Status int = null,
	@ContactID nchar(10) = null,
	@NewsID int = null,
	@Marked int = null,
	@Deleted bit = null

AS

UPDATE [dbo].[T1_Message]
SET
	[Sender] = @Sender,
	[Reciever] = @Reciever,
	[Type] = @Type,
	[Content] = @Content,
	[Date] = @Date,
	[Status] = @Status,
	[ContactID] = @ContactID,
	[NewsID] = @NewsID,
	[Marked] = @Marked,
	[Deleted] = @Deleted
 WHERE 
	[Message_ID] = @Message_ID
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_SelectByPrimaryKey]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_SelectByPrimaryKey]
	@Message_ID int
AS

	SELECT 
		[Message_ID], [Sender], [Reciever], [Type], [Content], [Date], [Status], [ContactID], [NewsID], [Marked], [Deleted]
	FROM [dbo].[T1_Message]
	WHERE 
			[Message_ID] = @Message_ID
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_SelectAll]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_SelectAll]
AS

	SELECT 
		[Message_ID], [Sender], [Reciever], [Type], [Content], [Date], [Status], [ContactID], [NewsID], [Marked], [Deleted]
	FROM [dbo].[T1_Message]
GO
/****** Object:  StoredProcedure [dbo].[T1_Message_Insert]    Script Date: 11/30/2011 14:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[T1_Message_Insert]
	@Message_ID int output,
	@Sender nchar(20) = null ,
	@Reciever nchar(20) = null ,
	@Type int = null ,
	@Content nchar(1000) = null ,
	@Date datetime = null ,
	@Status int = null ,
	@ContactID nchar(10) = null ,
	@NewsID int = null ,
	@Marked int = null ,
	@Deleted bit = null 

AS

INSERT [dbo].[T1_Message]
(
	[Sender],
	[Reciever],
	[Type],
	[Content],
	[Date],
	[Status],
	[ContactID],
	[NewsID],
	[Marked],
	[Deleted]

)
VALUES
(
	@Sender,
	@Reciever,
	@Type,
	@Content,
	@Date,
	@Status,
	@ContactID,
	@NewsID,
	@Marked,
	@Deleted

)
	SELECT @Message_ID=SCOPE_IDENTITY();
GO
/****** Object:  ForeignKey [fk_Message_News]    Script Date: 11/30/2011 14:28:35 ******/
ALTER TABLE [dbo].[T1_Message]  WITH CHECK ADD  CONSTRAINT [fk_Message_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[T2_News] ([NewsID])
GO
ALTER TABLE [dbo].[T1_Message] CHECK CONSTRAINT [fk_Message_News]
GO
/****** Object:  ForeignKey [fk_Contact_Group]    Script Date: 11/30/2011 14:28:35 ******/
ALTER TABLE [dbo].[T4_Contact]  WITH CHECK ADD  CONSTRAINT [fk_Contact_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[T3_Group] ([GroupID])
GO
ALTER TABLE [dbo].[T4_Contact] CHECK CONSTRAINT [fk_Contact_Group]
GO
