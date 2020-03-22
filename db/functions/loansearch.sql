CREATE OR REPLACE FUNCTION LoanSearch(LoanSearchID bigint)
RETURNS json
LANGUAGE sql
AS $$
SELECT json_build_object(
    'companies',
    (
        SELECT json_agg(
            json_build_object(
                'name', Companies.Name,
                'logo', Companies.Logo
            )
        )
        FROM Companies
    )
);
$$;
