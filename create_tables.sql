use complaints

CREATE TABLE [Person] (
	ID integer,
	LastName nvarchar(100),
	FirstName nvarchar(100),
	Patronymic nvarchar(100) NOT NULL,
	Position nvarchar(100) NOT NULL,
	Email nvarchar(100) NOT NULL,
	Department integer NOT NULL,
  CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Improvement] (
	ID integer,
	Time datetime,
	Description nvarchar(1000) NOT NULL,
	MediaLinks nvarchar(1000) NOT NULL,
	Status integer NOT NULL,
	Assignee integer,
	Classroom integer,
	Title nvarchar(1000) NOT NULL,
	Place nvarchar(1000),
  CONSTRAINT [PK_IMPROVEMENT] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Department] (
	ID integer NOT NULL,
	Name nvarchar(100) NOT NULL,
	Phone nvarchar(100) NOT NULL,
	Email nvarchar(100) NOT NULL,
  CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Admin] (
	ID integer NOT NULL,
	Password nvarchar(100) NOT NULL,
	Username nvarchar(100) NOT NULL,
  CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Building] (
	ID integer NOT NULL UNIQUE,
	Name nvarchar(100) NOT NULL UNIQUE,
	Address nvarchar(100) NOT NULL,
  CONSTRAINT [PK_BUILDING] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Classroom] (
	ID integer NOT NULL,
	Building integer NOT NULL,
	Name nvarchar(100) NOT NULL,
	Number integer NOT NULL,
  CONSTRAINT [PK_CLASSROOM] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Complaint] (
	ID integer NOT NULL,
	Title nvarchar(1000) NOT NULL,
	Description nvarchar(1000) NOT NULL,
	MediaLinks nvarchar(1000) NOT NULL,
	Status integer NOT NULL,
	Assignee integer,
	Person integer,
	Classroom integer,
  CONSTRAINT [PK_COMPLAINT] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Person] WITH CHECK ADD CONSTRAINT [Person_fk0] FOREIGN KEY ([Department]) REFERENCES [Department]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Person] CHECK CONSTRAINT [Person_fk0]
GO

ALTER TABLE [Improvement] WITH CHECK ADD CONSTRAINT [Improvement_fk0] FOREIGN KEY ([Assignee]) REFERENCES [Admin]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Improvement] CHECK CONSTRAINT [Improvement_fk0]
GO
ALTER TABLE [Improvement] WITH CHECK ADD CONSTRAINT [Improvement_fk1] FOREIGN KEY ([Classroom]) REFERENCES [Classroom]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Improvement] CHECK CONSTRAINT [Improvement_fk1]
GO




ALTER TABLE [Classroom] WITH CHECK ADD CONSTRAINT [Classroom_fk0] FOREIGN KEY ([Building]) REFERENCES [Building]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Classroom] CHECK CONSTRAINT [Classroom_fk0]
GO

ALTER TABLE [Complaint] WITH CHECK ADD CONSTRAINT [Complaint_fk0] FOREIGN KEY ([Assignee]) REFERENCES [Admin]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Complaint] CHECK CONSTRAINT [Complaint_fk0]
GO
ALTER TABLE [Complaint] WITH CHECK ADD CONSTRAINT [Complaint_fk1] FOREIGN KEY ([Person]) REFERENCES [Person]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Complaint] CHECK CONSTRAINT [Complaint_fk1]
GO
ALTER TABLE [Complaint] WITH CHECK ADD CONSTRAINT [Complaint_fk2] FOREIGN KEY ([Classroom]) REFERENCES [Classroom]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Complaint] CHECK CONSTRAINT [Complaint_fk2]
GO
