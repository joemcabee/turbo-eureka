DECLARE @String VARCHAR(10)	
DECLARE @StringInput VARCHAR(MAX)
DECLARE @Delimiter CHAR(1) = '~'
DECLARE @Total DECIMAL(10, 2) = 0

--SET @StringInput = '0.20'
--SET @StringInput = '2.00'
--SET @StringInput = ''
SET @StringInput = '1.20~10~6.8'

WHILE LEN(@StringInput) > 0
BEGIN
    SET @String = LEFT(@StringInput, ISNULL(NULLIF(CHARINDEX(@Delimiter, @StringInput) - 1, -1), LEN(@StringInput)))
    SET @StringInput = SUBSTRING(@StringInput, ISNULL(NULLIF(CHARINDEX(@Delimiter, @StringInput), 0), LEN(@StringInput)) + 1, LEN(@StringInput))
	
	IF ISNULL(@String, '') <> ''
		SET @Total += CONVERT(DECIMAL(10, 2), @String)
END

SELECT @Total