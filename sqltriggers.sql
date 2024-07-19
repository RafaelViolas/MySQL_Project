-- triggers


drop trigger  if exists entregas_before_insert;
delimiter //
create trigger entregas_before_insert
before insert on Entregas
for each row
begin
DECLARE mensagem_veiculo VARCHAR(255);
DECLARE mensagem_motorista VARCHAR(255);
DECLARE nome_do_veiculo VARCHAR(255);
DECLARE nome_do_motorista VARCHAR(255);
    -- Verificar se o Veículo ainda está numa entrega
if (select count(*) from Entregas where Entregas.`VeículoID` = new.`VeículoID` and Entregas.Estado = 0) > 0 then
set nome_do_veiculo = (select concat(`Veículos`.Marca,' ',`Veículos`.Modelo) from Transportadora.`Veículos` where `Veículos`.ID = new.`VeículoID`);
set mensagem_veiculo = concat('O veiculo ',new.`VeículoID`,' - ', nome_do_veiculo,' ainda está numa Entrega.');
signal sqlstate '45000' set message_text = mensagem_veiculo;
end if;
     -- Verificar se o Motorista ainda está numa entrega
if (select count(*) from Entregas where Entregas.MotoristaID = new.MotoristaID and Entregas.Estado = 0) > 0 then
set nome_do_motorista = (select Nome from Motoristas where Motoristas.ID = new.MotoristaID);
set mensagem_motorista = concat('O motorista ',new.MotoristaID,' - ', nome_do_motorista,' ainda está numa Entrega.');
signal sqlstate '45000' set message_text = mensagem_motorista;
end if;
end;
//