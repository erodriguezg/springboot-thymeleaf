
create table regiones (
   code				int4			not null,
   nombre			varchar(100) 	not null,
   primary key (code)
);

create table provincias (
   code				int4     		not null,
   region_code 		int4          	null,
   nombre      		varchar(100)   	not null,
   primary key (code),
   foreign key (region_code) references regiones (code)
);

create table comunas (
   code       		int4                 not null,
   provincia_code  	int4                 null,
   nombre         	varchar(100)         not null,
   primary key (code),
   foreign key (provincia_code) references provincias (code)
);

--REGIONES

INSERT INTO regiones (code, nombre) VALUES (1, 'Tarapacá');
INSERT INTO regiones (code, nombre) VALUES (2, 'Antofagasta');
INSERT INTO regiones (code, nombre) VALUES (3, 'Atacama');
INSERT INTO regiones (code, nombre) VALUES (4, 'Coquimbo');
INSERT INTO regiones (code, nombre) VALUES (5, 'Valparaíso');
INSERT INTO regiones (code, nombre) VALUES (6, 'Región del Libertador Gral. Bernardo O’Higgins');
INSERT INTO regiones (code, nombre) VALUES (7, 'Región del Maule');
INSERT INTO regiones (code, nombre) VALUES (8, 'Región del Biobío');
INSERT INTO regiones (code, nombre) VALUES (9, 'Región de la Araucanía');
INSERT INTO regiones (code, nombre) VALUES (10, 'Región de Los Lagos');
INSERT INTO regiones (code, nombre) VALUES (11, 'Región Aisén del Gral. Carlos Ibáñez del Campo');
INSERT INTO regiones (code, nombre) VALUES (12, 'Región de Magallanes y de la Antártica Chilena');
INSERT INTO regiones (code, nombre) VALUES (13, 'Región Metropolitana de Santiago');
INSERT INTO regiones (code, nombre) VALUES (14, 'Región de Los Ríos');
INSERT INTO regiones (code, nombre) VALUES (15, 'Arica y Parinacota');

--PROVINCIAS

INSERT INTO provincias (code, nombre, region_code) VALUES (11, 'Iquique', 1);
INSERT INTO provincias (code, nombre, region_code) VALUES (14, 'Tamarugal', 1);
INSERT INTO provincias (code, nombre, region_code) VALUES (21, 'Antofagasta', 2);
INSERT INTO provincias (code, nombre, region_code) VALUES (22, 'El Loa', 2);
INSERT INTO provincias (code, nombre, region_code) VALUES (23, 'Tocopilla', 2);
INSERT INTO provincias (code, nombre, region_code) VALUES (31, 'Copiapó', 3);
INSERT INTO provincias (code, nombre, region_code) VALUES (32, 'Chañaral', 3);
INSERT INTO provincias (code, nombre, region_code) VALUES (33, 'Huasco', 3);
INSERT INTO provincias (code, nombre, region_code) VALUES (41, 'Elqui', 4);
INSERT INTO provincias (code, nombre, region_code) VALUES (42, 'Choapa', 4);
INSERT INTO provincias (code, nombre, region_code) VALUES (43, 'Limarí', 4);
INSERT INTO provincias (code, nombre, region_code) VALUES (51, 'Valparaíso', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (52, 'Isla de Pascua', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (53, 'Los Andes', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (54, 'Petorca', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (55, 'Quillota', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (56, 'San Antonio', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (57, 'San Felipe de Aconcagua', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (58, 'Marga Marga', 5);
INSERT INTO provincias (code, nombre, region_code) VALUES (61, 'Cachapoal', 6);
INSERT INTO provincias (code, nombre, region_code) VALUES (62, 'Cardenal Caro', 6);
INSERT INTO provincias (code, nombre, region_code) VALUES (63, 'Colchagua', 6);
INSERT INTO provincias (code, nombre, region_code) VALUES (71, 'Talca', 7);
INSERT INTO provincias (code, nombre, region_code) VALUES (72, 'Cauquenes', 7);
INSERT INTO provincias (code, nombre, region_code) VALUES (73, 'Curicó', 7);
INSERT INTO provincias (code, nombre, region_code) VALUES (74, 'Linares', 7);
INSERT INTO provincias (code, nombre, region_code) VALUES (81, 'Concepción', 8);
INSERT INTO provincias (code, nombre, region_code) VALUES (82, 'Arauco', 8);
INSERT INTO provincias (code, nombre, region_code) VALUES (83, 'Biobío', 8);
INSERT INTO provincias (code, nombre, region_code) VALUES (84, 'Ñuble', 8);
INSERT INTO provincias (code, nombre, region_code) VALUES (91, 'Cautín', 9);
INSERT INTO provincias (code, nombre, region_code) VALUES (92, 'Malleco', 9);
INSERT INTO provincias (code, nombre, region_code) VALUES (101, 'Llanquihue', 10);
INSERT INTO provincias (code, nombre, region_code) VALUES (102, 'Chiloé', 10);
INSERT INTO provincias (code, nombre, region_code) VALUES (103, 'Osorno', 10);
INSERT INTO provincias (code, nombre, region_code) VALUES (104, 'Palena', 10);
INSERT INTO provincias (code, nombre, region_code) VALUES (111, 'Coihaique', 11);
INSERT INTO provincias (code, nombre, region_code) VALUES (112, 'Aisén', 11);
INSERT INTO provincias (code, nombre, region_code) VALUES (113, 'Capitán Prat', 11);
INSERT INTO provincias (code, nombre, region_code) VALUES (114, 'General Carrera', 11);
INSERT INTO provincias (code, nombre, region_code) VALUES (121, 'Magallanes', 12);
INSERT INTO provincias (code, nombre, region_code) VALUES (122, 'Antártica Chilena', 12);
INSERT INTO provincias (code, nombre, region_code) VALUES (123, 'Tierra del Fuego', 12);
INSERT INTO provincias (code, nombre, region_code) VALUES (124, 'Última Esperanza', 12);
INSERT INTO provincias (code, nombre, region_code) VALUES (131, 'Santiago', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (132, 'Cordillera', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (133, 'Chacabuco', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (134, 'Maipo', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (135, 'Melipilla', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (136, 'Talagante', 13);
INSERT INTO provincias (code, nombre, region_code) VALUES (141, 'Valdivia', 14);
INSERT INTO provincias (code, nombre, region_code) VALUES (142, 'Ranco', 14);
INSERT INTO provincias (code, nombre, region_code) VALUES (151, 'Arica', 15);
INSERT INTO provincias (code, nombre, region_code) VALUES (152, 'Parinacota', 15);

--COMUNAS

INSERT INTO comunas (code, nombre, provincia_code) VALUES (1101, 'Iquique', 11);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1107, 'Alto Hospicio', 11);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1401, 'Pozo Almonte', 14);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1402, 'Camiña', 14);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1403, 'Colchane', 14);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1404, 'Huara', 14);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (1405, 'Pica', 14);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2101, 'Antofagasta', 21);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2102, 'Mejillones', 21);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2103, 'Sierra Gorda', 21);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2104, 'Taltal', 21);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2201, 'Calama', 22);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2202, 'Ollagüe', 22);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2203, 'San Pedro de Atacama', 22);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2301, 'Tocopilla', 23);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (2302, 'María Elena', 23);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3101, 'Copiapó', 31);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3102, 'Caldera', 31);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3103, 'Tierra Amarilla', 31);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3201, 'Chañaral', 32);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3202, 'Diego de Almagro', 32);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3301, 'Vallenar', 33);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3302, 'Alto del Carmen', 33);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3303, 'Freirina', 33);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (3304, 'Huasco', 33);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4101, 'La Serena', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4102, 'Coquimbo', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4103, 'Andacollo', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4104, 'La Higuera', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4105, 'Paiguano', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4106, 'Vicuña', 41);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4201, 'Illapel', 42);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4202, 'Canela', 42);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4203, 'Los Vilos', 42);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4204, 'Salamanca', 42);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4301, 'Ovalle', 43);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4302, 'Combarbalá', 43);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4303, 'Monte Patria', 43);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4304, 'Punitaqui', 43);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (4305, 'Río Hurtado', 43);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5101, 'Valparaíso', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5102, 'Casablanca', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5103, 'Concón', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5104, 'Juan Fernández', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5105, 'Puchuncaví', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5107, 'Quintero', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5109, 'Viña del Mar', 51);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5201, 'Isla de Pascua', 52);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5301, 'Los Andes', 53);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5302, 'Calle Larga', 53);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5303, 'Rinconada', 53);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5304, 'San Esteban', 53);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5401, 'La Ligua', 54);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5402, 'Cabildo', 54);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5403, 'Papudo', 54);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5404, 'Petorca', 54);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5405, 'Zapallar', 54);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5501, 'Quillota', 55);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5502, 'Calera', 55);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5503, 'Hijuelas', 55);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5504, 'La Cruz', 55);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5506, 'Nogales', 55);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5601, 'San Antonio', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5602, 'Algarrobo', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5603, 'Cartagena', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5604, 'El Quisco', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5605, 'El Tabo', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5606, 'Santo Domingo', 56);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5701, 'San Felipe', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5702, 'Catemu', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5703, 'Llaillay', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5704, 'Panquehue', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5705, 'Putaendo', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5706, 'Santa María', 57);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5801, 'Quilpué', 58);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5802, 'Limache', 58);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5803, 'Olmué', 58);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (5804, 'Villa Alemana', 58);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6101, 'Rancagua', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6102, 'Codegua', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6103, 'Coinco', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6104, 'Coltauco', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6105, 'Doñihue', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6106, 'Graneros', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6107, 'Las Cabras', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6108, 'Machalí', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6109, 'Malloa', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6110, 'Mostazal', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6111, 'Olivar', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6112, 'Peumo', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6113, 'Pichidegua', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6114, 'Quinta de Tilcoco', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6115, 'Rengo', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6116, 'Requínoa', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6117, 'San Vicente', 61);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6201, 'Pichilemu', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6202, 'La Estrella', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6203, 'Litueche', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6204, 'Marchihue', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6205, 'Navidad', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6206, 'Paredones', 62);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6301, 'San Fernando', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6302, 'Chépica', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6303, 'Chimbarongo', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6304, 'Lolol', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6305, 'Nancagua', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6306, 'Palmilla', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6307, 'Peralillo', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6308, 'Placilla', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6309, 'Pumanque', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (6310, 'Santa Cruz', 63);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7101, 'Talca', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7102, 'Constitución', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7103, 'Curepto', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7104, 'Empedrado', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7105, 'Maule', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7106, 'Pelarco', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7107, 'Pencahue', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7108, 'Río Claro', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7109, 'San Clemente', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7110, 'San Rafael', 71);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7201, 'Cauquenes', 72);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7202, 'Chanco', 72);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7203, 'Pelluhue', 72);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7301, 'Curicó', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7302, 'Hualañé', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7303, 'Licantén', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7304, 'Molina', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7305, 'Rauco', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7306, 'Romeral', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7307, 'Sagrada Familia', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7308, 'Teno', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7309, 'Vichuquén', 73);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7401, 'Linares', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7402, 'Colbún', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7403, 'Longaví', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7404, 'Parral', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7405, 'Retiro', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7406, 'San Javier', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7407, 'Villa Alegre', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (7408, 'Yerbas Buenas', 74);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8101, 'Concepción', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8102, 'Coronel', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8103, 'Chiguayante', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8104, 'Florida', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8105, 'Hualqui', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8106, 'Lota', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8107, 'Penco', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8108, 'San Pedro de la Paz', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8109, 'Santa Juana', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8110, 'Talcahuano', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8111, 'Tomé', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8112, 'Hualpén', 81);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8201, 'Lebu', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8202, 'Arauco', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8203, 'Cañete', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8204, 'Contulmo', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8205, 'Curanilahue', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8206, 'Los Álamos', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8207, 'Tirúa', 82);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8301, 'Los Ángeles', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8302, 'Antuco', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8303, 'Cabrero', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8304, 'Laja', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8305, 'Mulchén', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8306, 'Nacimiento', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8307, 'Negrete', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8308, 'Quilaco', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8309, 'Quilleco', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8310, 'San Rosendo', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8311, 'Santa Bárbara', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8312, 'Tucapel', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8313, 'Yumbel', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8314, 'Alto Biobío', 83);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8401, 'Chillán', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8402, 'Bulnes', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8403, 'Cobquecura', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8404, 'Coelemu', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8405, 'Coihueco', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8406, 'Chillán Viejo', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8407, 'El Carmen', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8408, 'Ninhue', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8409, 'Ñiquén', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8410, 'Pemuco', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8411, 'Pinto', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8412, 'Portezuelo', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8413, 'Quillón', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8414, 'Quirihue', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8415, 'Ránquil', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8416, 'San Carlos', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8417, 'San Fabián', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8418, 'San Ignacio', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8419, 'San Nicolás', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8420, 'Treguaco', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (8421, 'Yungay', 84);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9101, 'Temuco', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9102, 'Carahue', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9103, 'Cunco', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9104, 'Curarrehue', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9105, 'Freire', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9106, 'Galvarino', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9107, 'Gorbea', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9108, 'Lautaro', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9109, 'Loncoche', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9110, 'Melipeuco', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9111, 'Nueva Imperial', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9112, 'Padre las Casas', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9113, 'Perquenco', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9114, 'Pitrufquén', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9115, 'Pucón', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9116, 'Saavedra', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9117, 'Teodoro Schmidt', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9118, 'Toltén', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9119, 'Vilcún', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9120, 'Villarrica', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9121, 'Cholchol', 91);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9201, 'Angol', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9202, 'Collipulli', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9203, 'Curacautín', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9204, 'Ercilla', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9205, 'Lonquimay', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9206, 'Los Sauces', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9207, 'Lumaco', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9208, 'Purén', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9209, 'Renaico', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9210, 'Traiguén', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (9211, 'Victoria', 92);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10101, 'Puerto Montt', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10102, 'Calbuco', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10103, 'Cochamó', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10104, 'Fresia', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10105, 'Frutillar', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10106, 'Los Muermos', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10107, 'Llanquihue', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10108, 'Maullín', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10109, 'Puerto Varas', 101);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10201, 'Castro', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10202, 'Ancud', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10203, 'Chonchi', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10204, 'Curaco de Vélez', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10205, 'Dalcahue', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10206, 'Puqueldón', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10207, 'Queilén', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10208, 'Quellón', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10209, 'Quemchi', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10210, 'Quinchao', 102);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10301, 'Osorno', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10302, 'Puerto Octay', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10303, 'Purranque', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10304, 'Puyehue', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10305, 'Río Negro', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10306, 'San Juan de la Costa', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10307, 'San Pablo', 103);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10401, 'Chaitén', 104);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10402, 'Futaleufú', 104);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10403, 'Hualaihué', 104);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (10404, 'Palena', 104);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11101, 'Coihaique', 111);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11102, 'Lago Verde', 111);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11201, 'Aisén', 112);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11202, 'Cisnes', 112);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11203, 'Guaitecas', 112);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11301, 'Cochrane', 113);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11302, 'O’Higgins', 113);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11303, 'Tortel', 113);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11401, 'Chile Chico', 114);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (11402, 'Río Ibáñez', 114);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12101, 'Punta Arenas', 121);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12102, 'Laguna Blanca', 121);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12103, 'Río Verde', 121);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12104, 'San Gregorio', 121);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12201, 'Cabo de Hornos', 122);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12202, 'Antártica', 122);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12301, 'Porvenir', 123);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12302, 'Primavera', 123);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12303, 'Timaukel', 123);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12401, 'Natales', 124);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (12402, 'Torres del Paine', 124);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13101, 'Santiago', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13102, 'Cerrillos', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13103, 'Cerro Navia', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13104, 'Conchalí', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13105, 'El Bosque', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13106, 'Estación Central', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13107, 'Huechuraba', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13108, 'Independencia', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13109, 'La Cisterna', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13110, 'La Florida', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13111, 'La Granja', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13112, 'La Pintana', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13113, 'La Reina', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13114, 'Las Condes', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13115, 'Lo Barnechea', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13116, 'Lo Espejo', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13117, 'Lo Prado', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13118, 'Macul', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13119, 'Maipú', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13120, 'Ñuñoa', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13121, 'Pedro Aguirre Cerda', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13122, 'Peñalolén', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13123, 'Providencia', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13124, 'Pudahuel', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13125, 'Quilicura', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13126, 'Quinta Normal', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13127, 'Recoleta', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13128, 'Renca', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13129, 'San Joaquín', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13130, 'San Miguel', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13131, 'San Ramón', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13132, 'Vitacura', 131);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13201, 'Puente Alto', 132);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13202, 'Pirque', 132);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13203, 'San José de Maipo', 132);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13301, 'Colina', 133);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13302, 'Lampa', 133);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13303, 'Tiltil', 133);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13401, 'San Bernardo', 134);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13402, 'Buin', 134);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13403, 'Calera de Tango', 134);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13404, 'Paine', 134);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13501, 'Melipilla', 135);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13502, 'Alhué', 135);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13503, 'Curacaví', 135);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13504, 'María Pinto', 135);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13505, 'San Pedro', 135);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13601, 'Talagante', 136);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13602, 'El Monte', 136);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13603, 'Isla de Maipo', 136);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13604, 'Padre Hurtado', 136);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (13605, 'Peñaflor', 136);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14101, 'Valdivia', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14102, 'Corral', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14103, 'Lanco', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14104, 'Los Lagos', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14105, 'Máfil', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14106, 'Mariquina', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14107, 'Paillaco', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14108, 'Panguipulli', 141);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14201, 'La Unión', 142);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14202, 'Futrono', 142);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14203, 'Lago Ranco', 142);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (14204, 'Río Bueno', 142);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (15101, 'Arica', 151);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (15102, 'Camarones', 151);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (15201, 'Putre', 152);
INSERT INTO comunas (code, nombre, provincia_code) VALUES (15202, 'General Lagos', 152);