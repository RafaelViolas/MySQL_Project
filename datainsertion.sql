-- Inserir valores para a tabela Motorista
INSERT INTO `Transportadora`.`Motoristas`
(`Nome`,`CartaCondução`,`Telefone`)
VALUES
('John Doe',000000001,000000001);

-- Inserir valores para a tabela Rotas
INSERT INTO `Transportadora`.`Rotas`
(`Origem`, `Destino`, `Distância`)
VALUES
('SuperMercado','Home',15);

-- Inserir valores para a tabela Veículos
INSERT INTO `Transportadora`.`Veículos`
(`Marca`, `Modelo`, `Ano`, `Matrícula`, `Capacidade`)
VALUES
('Mercedes','Mercedes-Benz S-class',2024,'00AA00',5);

-- Inserir valores para a tabela Entregas
INSERT INTO `Transportadora`.`Entregas`
(`VeículoID`,`MotoristaID`,`RotaID`,`DataEntrega`,`Estado`)
VALUES
(2,2,1,"2024-07-15 14:20:00",0);
