CREATE TABLE Exercises (
    ExerciseID serial PRIMARY KEY,
    LessonID int,
    Name text NOT NULL,
    Datestamp timestamptz NOT NULL DEFAULT (now())
);

INSERT INTO Exercises (LessonID, Name) VALUES (
    1,
    'Complete con el, la, los, las y los adjetivos entre paréntesis.'
);
