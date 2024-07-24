-- CREACION DE BASE DE DATOS --
CREATE DATABASE Db_Pokemon;

-- CREAR TABLAS (POKEMON, ENTRENADOR, BATALLAS, TABLA RELACION POKEMON_ENTRENADOR) --
CREATE TABLE pokemones (
    pokemon_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_pokemon VARCHAR(50),
    tipo_pokemon VARCHAR(50),
    habilidad_pokemon VARCHAR(50),
    punto_salud_pokemon INT,
    ataque_pokemon INT,
    defensa_pokemon INT,
    velocidad_pokemon INT,
    descripcion_pokemon VARCHAR(100)
);


CREATE TABLE entrenadores (
    entrenador_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_entrenador VARCHAR(50),
    ciudad_entrenador VARCHAR(50),
    descripcion_entrenador VARCHAR(100)
	
);

CREATE TABLE relacion_pokemon_entrenador (
    pokemon_id INT,
    entrenador_id INT,
    PRIMARY KEY (pokemon_id, entrenador_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemones(pokemon_id),
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores(entrenador_id)
);

CREATE TABLE batalla (
    batalla_id INT IDENTITY(1,1) PRIMARY KEY,
    entrenador1_id INT,
    entrenador2_id INT,
    pokemon1_id INT,
    pokemon2_id INT,
    fecha DATE,
    ganador BIT, -- Indica si el primer entrenador ganó falso o verdadero(boolean)
    FOREIGN KEY (entrenador1_id) REFERENCES entrenadores(entrenador_id),
    FOREIGN KEY (entrenador2_id) REFERENCES entrenadores(entrenador_id),
    FOREIGN KEY (pokemon1_id) REFERENCES pokemones(pokemon_id),
    FOREIGN KEY (pokemon2_id) REFERENCES pokemones(pokemon_id)
);

-- INSERTAR DATOS EN LAS TABLAS --

-- Pokemones --
INSERT INTO pokemones (nombre_pokemon, tipo_pokemon, habilidad_pokemon, punto_salud_pokemon, ataque_pokemon, defensa_pokemon, velocidad_pokemon, descripcion_pokemon)
VALUES 
	('Bulbasaur','Planta, Veneno','Espesura',42,54,52,62,'Tras nacer, crece alimentándose durante un tiempo de los nutrientes que contiene el bulbo de su lomo'),
    ('Ivysaur','Planta,Veneno','Espesura',60, 62, 63, 60,'Cuanta más luz solar recibe, más aumenta su fuerza y más se desarrolla el capullo que tiene en el lomo'),
    ('Venusaur','Planta,Veneno','Espesura',80,82,83,80,'Puede convertir la luz del sol en energía. Por esa razón, es más poderoso en verano'),
    ('Charmander','Fuego','Mar llamas',39,52,43,65,'La llama de su cola indica su fuerza vital. Si está débil, la llama arderá más tenue'),
    ('Charmeleon','Fuego','Mar llamas',58,64,58,80,'Al agitar su ardiente cola, eleva poco a poco la temperatura a su alrededor para sofocar a sus rivales');

ALTER TABLE pokemones
ALTER COLUMN descripcion_pokemon VARCHAR (500);

SELECT * FROM pokemones --Verificamos si se cargaron los datos--

-- Entrenadores --
INSERT INTO entrenadores (nombre_entrenador, ciudad_entrenador, descripcion_entrenador)
VALUES
    ('Ash Ketchum','Pueblo Paleta de la region Kanto','Campeon de la liga de Alola, campeon de la liga Naranja y Campeon actual del mundo'),
    ('Misty','Ciudad Celeste de la region Kanto','Actualmente es la líder del Gimnasio Celeste y una entrenadora de Pokémon de tipo agua. Sus hermanas son Daisy, Violet y Lily.'),
    ('Brock','Ciudad Plateada de la Region Kanto','Líder de Gimnasio con fama de ser más duro que una roca. Siempre dispuesto a ayudar a los Entrenadores con sus primeros pasos.'),
    ('Teniente Surge', 'Ciudad Carmin de la Region Kanto','Experto en tipo Eléctrico, este cauto Líder tiene un gimnasio lleno de obstáculos. En combates, su especialidad consiste en paralizar al rival.'),
    ('Mento','Isla Canela Region Kanto','Apodado el Maestro de los Acertijos, este Líder de Gimnasio se especializa en Pokémon de tipo Fuego. Destila habilidad en combate y conocimiento en la materia.');

ALTER TABLE entrenadores
ALTER COLUMN descripcion_entrenador VARCHAR (500);

SELECT * FROM entrenadores

-- Relacion Pokemon-Entrenador --
INSERT INTO relacion_pokemon_entrenador (pokemon_id, entrenador_id)
VALUES 
    (1,1),
    (2,2),
    (3,3),
    (4,4);

-- Batallas (TRUE es 1, FALSE es 0) --
INSERT INTO batalla (entrenador1_id, entrenador2_id, pokemon1_id, pokemon2_id, fecha, ganador)
VALUES
    (1,2,1,2,'2023-04-02', 1),
    (3,4,3,4,'2024-05-06', 0),
    (2,3,2,3,'2024-05-10', 1);