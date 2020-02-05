CREATE OR REPLACE FUNCTION Exercises()
RETURNS TABLE (ExerciseID int, Name text)
LANGUAGE sql
AS $$
SELECT ExerciseID, Name
FROM Exercises;
$$;
