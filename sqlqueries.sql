-- Listar todos os veículos disponíveis com as respetivas marcas e capacidade
Select `Veículos`.ID, Marca, Modelo, Ano, `Matrícula`, Capacidade
from Transportadora.`Veículos`
join Entregas on `Veículos`.ID = Entregas.VeículoID
where Entregas.Estado <> 0;

-- listar as entregas realizadas num determinado período
Select * 
from Entregas
where DataEntrega 
between '2024-07-15 10:00:00' -- starting time
and '2025-05-15 10:00:00'; -- ending time this is not interchangeable

-- Listar os motoristas que realizaram mais de um determinado numero de entregas
DROP VIEW IF EXISTS NumeroDeEntregas;
CREATE VIEW NumeroDeEntregas AS
Select Motoristas.ID,
    Motoristas.Nome,
    Motoristas.CartaCondução,
    Motoristas.Telefone,
    count(*) as numerodeentregas
From Motoristas
join Entregas on Motoristas.ID = Entregas.MotoristaID
group by Motoristas.ID,CartaCondução;
-- parte 2 da listagem dos motoristas que realizaram mais do que determinado numero de entregas
Select * 
from NumeroDeEntregas
where numerodeentregas > 0;

-- Listar as Rotas para um determinado destino
Select * 
from Rotas
where Destino = 'Home';
