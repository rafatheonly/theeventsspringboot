create table EVENTO (
    ID serial primary key not null ,
    TITULO varchar(100) not null,
    DATA varchar(100) not null,
    DESCRICAO varchar(100) not null
);

insert into evento (TITULO, DATA, DESCRICAO) values ('Encontro de Carros', 'Seg 18 Mai 2018', 'Praesent tincidunt sed tellus ut rutrum sed vitae justo...');
insert into evento (TITULO, DATA, DESCRICAO) values ('Festival de Rua', 'Seg 18 Mai 2019', 'Praesent tincidunt sed tellus ut rutrum sed vitae justo...');
insert into evento (TITULO, DATA, DESCRICAO) values ('Passeio em Veneza', 'Seg 18 Mai 2020', 'Praesent tincidunt sed tellus ut rutrum sed vitae justo...');