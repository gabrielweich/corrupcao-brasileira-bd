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

create table cidades( 
  cidade varchar(100) not null, 
  uf varchar(2) not null, 
  constraint pk_cidades primary key(cidade, uf) 
);

create table mandatos( 
  id_mandato number(10) not null, 
  id_pessoa number(10) not null, 
  id_partido number(10) not null, 
  data_inicio date not null, 
  data_fim date, 
  ocupacao varchar(150) not null, 
  cidade varchar(100) not null, 
  uf varchar(2) not null, 
  constraint pk_mandatos primary key(id_mandato) 
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