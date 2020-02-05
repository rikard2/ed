CREATE OR REPLACE FUNCTION Get_Lesson(
    _LessonID int,
    OUT Name text,
    OUT Markdown text
)
RETURNS RECORD
LANGUAGE plpgsql STABLE
AS $$
BEGIN

SELECT Lessons.Name, Lessons.Markdown
INTO Get_Lesson.Name, Get_Lesson.Markdown
FROM Lessons
WHERE LessonID = _LessonID;

END;
$$;
