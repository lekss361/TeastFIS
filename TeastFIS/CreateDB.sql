CREATE TABLE [AuthorsBooks] (
	IdBook int NOT NULL,
	IdAuthors int NOT NULL
)
GO
CREATE TABLE [Books] (
	Id int NOT NULL,
	Name nvarchar NOT NULL,
	Publisher nvarchar NOT NULL,
	Genre nvarchar NOT NULL,
	DatePublication datetime NOT NULL,
  CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BooksAtStudents] (
	IdBook int NOT NULL,
	TakingBook date NOT NULL,
	RefoundBook date,
	IdStudents int NOT NULL
)
GO
CREATE TABLE [BooksInLibraries] (
	IdBook int NOT NULL,
	IdLibraries int NOT NULL
)
GO
CREATE TABLE [Libraries] (
	Id int NOT NULL,
	Name nvarchar NOT NULL,
  CONSTRAINT [PK_LIBRARIES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Students] (
	Id int NOT NULL,
	Name nvarchar NOT NULL,
  CONSTRAINT [PK_STUDENTS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Authors] (
	Id int NOT NULL,
	Name nvarchar NOT NULL,
  CONSTRAINT [PK_AUTHORS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [AuthorsBooks] WITH CHECK ADD CONSTRAINT [AuthorsBooks_fk0] FOREIGN KEY ([IdBook]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [AuthorsBooks] CHECK CONSTRAINT [AuthorsBooks_fk0]
GO
ALTER TABLE [AuthorsBooks] WITH CHECK ADD CONSTRAINT [AuthorsBooks_fk1] FOREIGN KEY ([IdAuthors]) REFERENCES [Authors]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [AuthorsBooks] CHECK CONSTRAINT [AuthorsBooks_fk1]
GO


ALTER TABLE [BooksAtStudents] WITH CHECK ADD CONSTRAINT [BooksAtStudents_fk0] FOREIGN KEY ([IdBook]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BooksAtStudents] CHECK CONSTRAINT [BooksAtStudents_fk0]
GO
ALTER TABLE [BooksAtStudents] WITH CHECK ADD CONSTRAINT [BooksAtStudents_fk1] FOREIGN KEY ([IdStudents]) REFERENCES [Students]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BooksAtStudents] CHECK CONSTRAINT [BooksAtStudents_fk1]
GO

ALTER TABLE [BooksInLibraries] WITH CHECK ADD CONSTRAINT [BooksInLibraries_fk0] FOREIGN KEY ([IdBook]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BooksInLibraries] CHECK CONSTRAINT [BooksInLibraries_fk0]
GO
ALTER TABLE [BooksInLibraries] WITH CHECK ADD CONSTRAINT [BooksInLibraries_fk1] FOREIGN KEY ([IdLibraries]) REFERENCES [Libraries]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BooksInLibraries] CHECK CONSTRAINT [BooksInLibraries_fk1]
GO



