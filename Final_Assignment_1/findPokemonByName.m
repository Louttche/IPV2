function foundPokemon = findPokemonByName(pname)
%FINDPOKEMONBYNAME Checks if pokemon with pname exists
%   Looks through a list of existing pokemon (names) and checks if the text
%   given is a pokemon (name)
    foundPokemon = "not found.";

    fid = fopen('pokemon_names.txt');
    tline = fgetl(fid);
    while ischar(tline)
        if (lower(tline) == lower(pname))
            foundPokemon = tline;
        end
        tline = fgetl(fid); % goes to next line
    end
end

