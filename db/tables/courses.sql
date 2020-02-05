CREATE TABLE Courses (
    CourseID serial PRIMARY KEY,
    Name text NOT NULL,
    Datestamp timestamptz NOT NULL DEFAULT (now())
);

INSERT INTO Courses (Name) VALUES ('Svenska A1');
