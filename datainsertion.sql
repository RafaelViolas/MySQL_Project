INSERT INTO `Transportadora`.`Motoristas`
(`Nome`,`CartaCondução`,`Telefone`)
VALUES
('John Doe',000000001,000000001);

INSERT INTO `Transportadora`.`Rotas`
(`Origem`, `Destino`, `Distância`)
VALUES
('SuperMercado','Home',15);

INSERT INTO `Transportadora`.`Veículos`
(`Marca`, `Modelo`, `Ano`, `Matrícula`, `Capacidade`)
VALUES
('Mercedes','Mercedes-Benz S-class',2024,'00AA00',5);

INSERT INTO `Transportadora`.`Entregas`
(`VeículoID`,`MotoristaID`,`RotaID`,`DataEntrega`,`Estado`)
VALUES
(2,2,1,"2024-07-15 14:20:00",0);