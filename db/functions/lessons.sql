CREATE OR REPLACE FUNCTION Lessons()
RETURNS json
LANGUAGE sql
AS $$
SELECT
    json_agg(json_build_object(
        'lessonid',
        Lessons.LessonID,
        'name',
        Lessons.Name,
        'children',
        (
            SELECT
                json_agg(json_build_object(
                    'lessonid',
                    X.LessonID,
                    'name',
                    X.Name
                ))
            FROM Lessons X
            WHERE X.ParentLessonID = Lessons.LessonID
        )
    ))
FROM Lessons
WHERE Lessons.ParentLessonID IS NULL;
$$;
