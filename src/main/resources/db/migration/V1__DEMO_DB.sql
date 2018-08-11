create table users (
	id bigserial,
	email varchar(100),
	first_name varchar(50),
	last_name varchar(50),
	password varchar(255),
	telefono_movil varchar(20),
	telefono_fijo varchar(20),
	primary key (id),
	constraint user_uq unique (email)
);

create table profiles (
	code int4, 
	name varchar(50),
	primary key (code)
);

create table users_profiles (
	user_id bigint,
	profile_code int4,
	primary key (user_id, profile_code),
	foreign key (user_id) references users (id),
	foreign key (profile_code) references profiles (code)
);

insert into profiles (code, name) values (1, 'Administrador');
insert into profiles (code, name) values (2, 'Usuario');

-- password cambiame (BCrypt Hash Generator)
insert into users (id, email, first_name, last_name, password) values 
	(1, 'admin@sistema.net', 'admin', 'admin', '$2a$10$uuNRHa/RQGApTtTl8qb3SujtGb/ZULO0THxkriszIb0Jt..C6VS6W');
	
insert into users_profiles (user_id, profile_code) values (1, 1);

ALTER SEQUENCE users_id_seq RESTART WITH 2;

