Create schema `Transportadora`;

CREATE TABLE `Veículos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Marca` varchar(30) NOT NULL,
  `Modelo` varchar(40) NOT NULL,
  `Ano` year NOT NULL,
  `Matrícula` varchar(6) NOT NULL,
  `Capacidade` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Motoristas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `CartaCondução` tinyint NOT NULL,
  `Telefone` tinyint NOT NULL,
  PRIMARY KEY (`ID`,`CartaCondução`),
  UNIQUE KEY `CartaCondução_UNIQUE` (`CartaCondução`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Rotas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Origem` varchar(60) NOT NULL,
  `Destino` varchar(60) NOT NULL,
  `Distância` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Entregas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VeículoID` int NOT NULL,
  `MotoristaID` int NOT NULL,
  `RotaID` int NOT NULL,
  `DataEntrega` datetime NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MotoristaKey_idx` (`MotoristaID`),
  KEY `VeículoKey_idx` (`VeículoID`),
  KEY `RotaKey_idx` (`RotaID`),
  CONSTRAINT `MotoristaKey` FOREIGN KEY (`MotoristaID`) REFERENCES `Motoristas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RotaKey` FOREIGN KEY (`RotaID`) REFERENCES `Rotas` (`ID`),
  CONSTRAINT `VeículoKey` FOREIGN KEY (`VeículoID`) REFERENCES `Veículos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
