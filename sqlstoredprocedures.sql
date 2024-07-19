-- stored procedures

-- Registar uma nova Entrega
DROP PROCEDURE IF EXISTS insert_into_entregas;
DELIMITER $$
CREATE PROCEDURE `insert_into_entregas`(in _VeiculoID int, in _MotoristaID int,in _RotaID int,in _DataEntrega datetime,in _Estado tinyint(1))
BEGIN
INSERT INTO `Transportadora`.`Entregas`
(`VeículoID`,`MotoristaID`,`RotaID`,`DataEntrega`,`Estado`)
VALUES
(_VeiculoID, _MotoristaID, _RotaID, _DataEntrega, _Estado);
END$$
DELIMITER ;
CALL insert_into_entregas(2,2,1,"2024-07-15 14:20:00",0);

-- Atualizar os dados de um motorista utilizando o seu ID
DROP PROCEDURE IF EXISTS update_into_motoristas;
DELIMITER $$
CREATE PROCEDURE `update_into_motoristas`(in _ID int, in _Nome varchar(50),in _CartaConducao tinyint,in _Telefone tinyint)
UPDATE `Transportadora`.`Motoristas`
SET
`Nome` = _Nome,
`CartaCondução` = _CartaConducao,
`Telefone` = _Telefone
WHERE `ID` = _ID;
END$$
DELIMITER ;
CALL update_into_motoristas(3,'John Doe',000000001,000000001);

-- Calcula o Total de Entregas Realizadas num determinado período
DROP PROCEDURE IF EXISTS calculate_total_entregas_between;
DELIMITER $$
CREATE PROCEDURE `calculate_total_entregas_between`(in _InitialDate datetime,in _FinalDate datetime, OUT total INT)
begin
SELECT count(*)
FROM `Transportadora`.`Entregas`
WHERE DataEntrega 
BETWEEN _InitialDate
AND _FinalDate;
END$$
DELIMITER ;
SET @total_entregas = 0;
CALL calculate_total_entregas_between("2024-07-15 14:20:00", "2025-07-15 14:20:00", @total_entregas);

