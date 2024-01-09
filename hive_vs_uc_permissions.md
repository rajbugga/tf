Hive Metastore Permission	Unity Catalog Equivalent
SELECT	                    SELECT
CREATE	                    CREATE TABLE / CREATE FUNCTION / CREATE MODEL
OWN	                        ALL PRIVILEGES (closest equivalent)
READ_METADATA	            USE SCHEMA (to access metadata within a schema)
MODIFY	                    MODIFY (for altering data within tables)
USAGE	                    USE SCHEMA (for accessing the schema)
CREATE_NAMED_FUNCTION	    CREATE FUNCTION

