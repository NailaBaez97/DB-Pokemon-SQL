--DELET(eliminar) --

--Eliminamos el pokemon con id 1 el cual solo actualizamos el nombre y no los demas campos--
BEGIN TRANSACTION

-- Eliminar registros relacionados en la tabla batalla
DELETE b
FROM batalla b
JOIN pokemones p ON b.pokemon1_id = p.pokemon_id OR b.pokemon2_id = p.pokemon_id
WHERE p.pokemon_id = 1;

-- Eliminar registros relacionados en la tabla relacion_pokemon_entrenador
DELETE r
FROM relacion_pokemon_entrenador r
JOIN pokemones p ON r.pokemon_id = p.pokemon_id
WHERE p.pokemon_id = 1;
select * from entrenadores

-- Eliminar el Pokémon de la tabla pokemones
DELETE p
FROM pokemones p
WHERE p.pokemon_id = 1;


COMMIT TRANSACTION;