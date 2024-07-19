-- `Entregas`.`ID`, `Entregas`.`VeículoID`, `Entregas`.`MotoristaID`, `Entregas`.`DataEntrega`, `Entregas`.`Estado`

-- not working.
DROP PROCEDURE  IF EXISTS NESTED_CURSOR;

DELIMITER $$
CREATE PROCEDURE NESTED_CURSOR (in _data1 datetime, in _data2 datetime)
BEGIN
DECLARE done1 INT DEFAULT FALSE;
    declare _ID INT;
    declare _VeiculoID INT;
    declare _MotoristaID INT;
    declare _DataEntrega datetime;
    declare _Estado tinyint(1);
	declare numero int;

    declare cursor1 cursor for 
select Entregas.VeículoID, MotoristaID
from Entregas
where DataEntrega
BETWEEN _data1
AND _data2
group by Entregas.`VeículoID`, Entregas.MotoristaID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done1 = TRUE;
    
    open cursor1;
read_loop1: LOOP
fetch cursor1 into _VeiculoID, _MotoristaID;
IF done1 THEN
LEAVE read_loop1;
END IF;       
        BEGIN  
DECLARE done2 INT DEFAULT FALSE;
declare cursor2 cursor for
select Entregas.ID, count(*) as numero
from Entregas
where _VeiculoID = Entregas.VeículoID and _MotoristaID = Entregas.MotoristaID
group by Entregas.ID, Entregas.`VeículoID`, Entregas.MotoristaID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;  
            open cursor2;
read_loop2: LOOP
fetch cursor2 into _ID, numero, _DataEntrega;
IF done2 THEN
LEAVE read_loop2;
END IF;
SELECT _VeiculoID, _MotoristaID, numero, _ID, _DataEntrega;
END LOOP;
CLOSE cursor2;      
END;        
END LOOP;
CLOSE cursor1;
END$$
call NESTED_CURSOR("2023-07-16 00:00:00","2025-07-16 00:00:00")
