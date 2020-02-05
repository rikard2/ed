CREATE OR REPLACE FUNCTION transactions ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT 25 into total;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;
