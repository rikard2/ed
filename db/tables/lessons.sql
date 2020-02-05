CREATE TYPE LessonType AS ENUM (
    'LESSON',
    'PRACTICE_VOCABULARY'
);

CREATE TABLE Lessons (
    LessonID serial PRIMARY KEY,
    CourseID int NOT NULL REFERENCES Courses (CourseID),
    ParentLessonID int NULL REFERENCES Lessons (LessonID),
    Name text NOT NULL,
    Markdown text,
    Datestamp timestamptz NOT NULL DEFAULT (now())
);

INSERT INTO Lessons (CourseID, ParentLessonID, Name, Markdown) VALUES
(1,  NULL,  '1. Verb',          'Cuando hablamos de alguien o algo específíco, se puede usarr
el, la, os, las en lugar de un nombre mencianado anteriormente,
o cuando no es necesario mencionarlo porque todos sabemos de qué estamos hablando.

- el, la, los, las + adjetivo
- Que camisa te gusta más? - La verde. (= la camisa verde)
- Quién es Laura? - La alta. (= la chica alta)

La forma del arículo y del adjetivo (masculino, feminino, singular o plural) es la misma que la del nombre al que se refíere.
- Que **zapatillas** te gustan más? **-Las rojas.**

Se puede usar el, la, los, las + de + nombre para indicar origen, posesión, situacion o materia.
- La de Sevilla es la más simpática (= la chica de sevilla)'),
(1,  1,     '1.1 Future tense', NULL),
(1,  1,     '1.2 Past tense', NULL),
(1,  3,     '1.2.1  Really Past tense', NULL),
(1,  NULL,  '2. Words',         NULL);
/*
INSERT INTO Lessons (Name, Markdown) VALUES (
    '7. La blanca, los de oro, lo dificil',
    'Cuando hablamos de alguien o algo específíco, se puede usarr
el, la, os, las en lugar de un nombre mencianado anteriormente,
o cuando no es necesario mencionarlo porque todos sabemos de qué estamos hablando.

- el, la, los, las + adjetivo
    - Que camisa te gusta más? - La verde. (= la camisa verde)
	- Quién es Laura? - La alta. (= la chica alta)

La forma del arículo y del adjetivo (masculino, feminino, singular o plural) es la misma que la del nombre al que se refíere.
	- Que **zapatillas** te gustan más? **-Las rojas.**

Se puede usar el, la, los, las + de + nombre para indicar origen, posesión, situacion o materia.
	- La de Sevilla es la más simpática (= la chica de sevilla)'
);
*/
