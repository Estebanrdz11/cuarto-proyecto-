pragma foreign_keys = ON;


create table if not exists clientes(
    id integer primary key autoincrement,
    nome text not null,
    apellido text not null unique,
    telefone text
)

create table if not exists pedidos(
    id integer primary key autoincrement,
    cliente_id integer not null,
    data_pedido text not null,
    valor_total real not null,
    status text not null,
    foreign key (cliente_id) references clientes(id)
)

insert into clientes (nome, apellido, telefone) values
('Juan', 'Perez', '123456789'),
('Maria', 'Gomez', '987654321'),
('Carlos', 'Lopez', '456789123');

insert into pedidos (cliente_id, data_pedido, valor_total, status) values
(1, '2024-01-15', 150.00, 'pendente'),
(2, '2024-02-20', 200.00, 'concluido'),
(3, '2024-03-10', 300.00, 'pendente');

select 
c.nome, c.apellido, p.data_pedido, p.valor_total, p.status
from clientes c
inner join pedidos p on 
c.id = p.cliente_id
