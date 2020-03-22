CREATE OR REPLACE FUNCTION Companies()
RETURNS TABLE (CompanyID int, Name text, Logo text)
LANGUAGE sql
AS $$
SELECT CompanyID, Name, Logo FROM Companies;
$$;
