create table empresas( 
  id_empresa number(10) not null, 
  nome varchar(200) not null, 
  descricao varchar(500) not null, 
  cnpj number(14) not null, 
  constraint pk_empresas primary key(id_empresa) 
);

create table pessoas( 
  id_pessoa number(10) not null, 
  nome varchar(150) not null, 
  data_nascimento date not null, 
  cpf number(11) not null, 
  constraint pk_pessoas primary key(id_pessoa) 
);

create table cargos( 
  id_cargo number(10) not null, 
  id_pessoa number(10) not null, 
  id_empresa number(10) not null, 
  nome varchar(150) not null, 
  data_inicio date, 
  data_fim date, 
  constraint pk_cargos primary key(id_cargo) 
);

create table partidos( 
  id_partido number(10) not null, 
  nome varchar(200) not null, 
  sigla varchar(20) not null, 
  numero_eleitoral number(2) not null, 
  constraint pk_partidos primary key(id_partido) 
);

create table codinomes( 
  id_pessoa number(10) not null, 
  codinome varchar(150) not null, 
  constraint pk_codinomes primary key(id_pessoa, codinome) 
);

create table pagamentos( 
  id_pagamento number(10) not null, 
  id_empresa number(10) not null, 
  id_operador number(10) not null, 
  id_destinatario number (10) not null, 
  motivo varchar(1000) not null, 
  valor number(11,2), 
  data_pagamento date, 
  constraint pk_pagamentos primary key(id_pagamento) 
);

create table mandatos_legislativos(
  id_mandato_legislativo number(10) not null,
  id_pessoa number(10) not null,
  id_partido number(10) not null,
  id_esfera number(10) not null,
  ocupacao varchar(150) not null,
  data_inicio date not null, 
  data_fim date,
  constraint pk_mandatos_legislativos primary key (id_mandato_legislativo)
);

create table mandatos_executivos(
  id_mandato_executivo number(10) not null,
  id_pessoa number(10) not null,
  id_partido number(10) not null,
  id_esfera number(10) not null,
  ocupacao varchar(150) not null,
  data_inicio date not null, 
  data_fim date,
  constraint pk_mandatos_executivos primary key (id_mandato_executivo)
);

create table mandatos_judiciarios(
  id_mandato_judiciario number(10) not null,
  id_pessoa number(10) not null,
  orgao: varchar(150) not null,
  ocupacao varchar(150) not null,
  data_inicio date not null, 
  data_fim date,
  constraint pk_mandatos_judiciarios primary key (id_mandato_judiciario)
);

create table esferas(
  id_esfera number(10) not null,
  id_cidade number(10) not null,
  id_estado number(10) not null,
  id_pais number(10) not null,
  constraint pk_esferas primary key(id_esfera)
);

create table cidades(
  id_cidade number(10) not null,
  id_estado number (10) not null,
  cidade varchar(100) not null,
  constraint pk_cidades primary key(id_cidade)
);

create table estados(
  id_estado number(10) not null,
  id_pais number(10) not null,
  estado varchar(100) not null,
  constraint pk_estados primary key(id_estado)
);

create table paises(
  id_pais number(10) not null,
  pais varchar(100) not null,
  constraint pk_paises primary key(id_pais)
);


alter table cargos 
add constraint fk_pessoas_cargos 
foreign key(id_pessoa) references pessoas;

alter table cargos 
add constraint fk_empresas_cargos 
foreign key(id_empresa) references empresas;

alter table mandatos 
add constraint fk_pessoas_mandatos 
foreign key(id_pessoa) references pessoas;

alter table mandatos 
add constraint fk_partidos_mandatos 
foreign key(id_partido) references partidos;

alter table mandatos 
add constraint fk_cidades_mandatos 
foreign key(cidade, uf) references cidades(cidade, uf);

alter table codinomes 
add constraint fk_pessoas_codinomes 
foreign key(id_pessoa) references pessoas;

alter table pagamentos 
add constraint fk_empresas_pagamentos 
foreign key(id_empresa) references empresas;

alter table pagamentos 
add constraint fk_pessoas_pagamentos_op 
foreign key(id_operador) references pessoas;

alter table pagamentos 
add constraint fk_pessoas_pagamentos_de 
foreign key(id_destinatario) references pessoas;