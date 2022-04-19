use dsmzg_db;

select *
from uc_message_file
limit 1;

select file_name
from uc_message_file
limit 1000 offset 80000000;

select count(*)
from uc_message_file;

select file_name
from uc_message_file where file_name = '09225732351640069515279';

select *
from uc_message_file where `__#alibaba_rds_row_id#__` > 0 and `__#alibaba_rds_row_id#__` < (1 + 1000);

select *
from uc_message_file where `__#alibaba_rds_row_id#__` = 110000000;

select *
from uc_message_file where `__#alibaba_rds_row_id#__` = 210000000;

select *
from uc_message_file where `__#alibaba_rds_row_id#__` = 333999588;

select *
from uc_message_file where `__#alibaba_rds_row_id#__` = 333999587;