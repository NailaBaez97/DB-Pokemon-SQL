--UPDATE(actualizar)--
--En este caso Actualizamos el nombre de Balbasaur por el de pikachu--
UPDATE pokemones
SET nombre_pokemon = 'Pikachu',
    ataque_pokemon = 120
WHERE pokemon_id = 1;