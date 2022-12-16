CREATE OR REPLACE FUNCTION  toplamaF(x Numeric,y Numeric)
RETURNS Numeric
LANGUAGE plpgsql
AS 
$$
BEGIN

RETURN x+y;

END
$$


select * from toplamaF(4,6);