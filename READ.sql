--READ (Leer)--
--TRAER O LEER UN ENTRENADOR ESPECIFICO CON SU POKEMON 
SELECT entrenadores.nombre_entrenador, pokemones.nombre_pokemon
FROM entrenadores
JOIN pokemones ON entrenadores.entrenador_id = pokemones.pokemon_id
WHERE entrenadores.entrenador_id = 3;
