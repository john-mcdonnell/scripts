BEGIN TRANSACTION

SELECT count(*) "casedocument Total" FROM casedocument
DELETE FROM casedocument

GO

SELECT count(*) "casenote Total" FROM casenote
DELETE FROM casenote

GO

SELECT count(*) "caseaudit Total" FROM caseaudit
DELETE FROM caseaudit

GO

SELECT count(*) "casedata Total" FROM casedata
DELETE FROM casedata

GO

-- COMMIT

GO
