--replace //loginname// and //password with secret values from vault

--IMPORTANT - create login in MASTER 
create login //loginname// with password = '//password//'

--IMPORTANT - switch to HeartyHearthDB
create user dev_user from login //loginname//

alter role db_datareader add member dev_user
alter role db_datawriter add member dev_user