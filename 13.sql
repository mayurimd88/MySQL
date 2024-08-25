-- create index
CREATE INDEX Accindex
ON Accountdetails(AccountID);

-- based on datatype of column
CREATE UNIQUE INDEX Accountindex
ON Accountdetails(AccountID);

-- based on search criteria
CREATE INDEX AccIDindex
USING HASH
ON Accountdetails(AccountID);

DROP INDEX AccIDindex
ON Accountdetails;
