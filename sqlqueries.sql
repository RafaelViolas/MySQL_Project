Select `Veículos`.ID, Marca, Modelo, Ano, `Matrícula`, Capacidade
from Transportadora.`Veículos`
join Entregas on `Veículos`.ID = Entregas.VeículoID
where Entregas.Estado <> 0;

Select * 
from Entregas
where DataEntrega 
between '2024-07-15 10:00:00' -- starting time
and '2025-05-15 10:00:00'; -- ending time this is not interchangeable

-- determinado numero de entregas(?)
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

Select * 
from NumeroDeEntregas
where numerodeentregas > 0;

Select * 
from Rotas
where Destino = 'Home';
