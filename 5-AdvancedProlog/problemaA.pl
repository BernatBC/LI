main(L):- L = [[1,_,_,_,_,_],[2,_,_,_,_,_],[3,_,_,_,_,_],[4,_,_,_,_,_],[5,_,_,_,_,_]],
member([_,red,_,_,_,peruan],L),% 1 - El que vive en la casa roja es de Perú
member([_,_,_,dog,_,french],L),% 2 - Al francés le gusta el perro
member([_,_,painter,_,_,japanese],L),% 3 - El pintor es japonés
member([_,_,_,_,rum,chinese],L),% 4 - Al chino le gusta el ron
member([1,_,_,_,_,hungarian],L),% 5 - El húngaro vive en la primera casa
member([_,green,_,_,cognac,_],L),% 6 - Al de la casa verde le gusta el coñac
member([A1,green,_,_,_,_],L),member([A2,white,_,_,_,_],L), A2 is A1 + 1,% 7 - La casa verde está justo a la izquierda de la blanca
member([_,_,sculptor,snails,_,_],L),% 8 - El escultor crı́a caracoles
member([_,yellow,actor,_,_,_],L),% 9 - El de la casa amarilla es actor
member([3,_,_,_,champagne,_],L),% 10 - El de la tercera casa bebe cava
member([B1,_,actor,_,_,_],L),member([B2,_,_,horse,_,_],L), (B2 is B1 + 1;B2 is B1 - 1),% 11 - El que vive al lado del actor tiene un caballo
member([C1,_,_,_,_,hungarian],L),member([C2,blue,_,_,_,_],L), (C2 is C1 + 1;C2 is C1 - 1),% 12 - El húngaro vive al lado de la casa azul
member([_,_,notary,_,whisky,_],L),% 13 - Al notario la gusta el whisky
member([D1,_,doctor,_,_,_],L),member([D2,_,_,squirrel,_,_],L), (D2 is D1 + 1;D2 is D1 - 1),% 14 - El que vive al lado del médico tiene un ardilla
member([_,_,_,_,unk_beverage,_],L),% fill missing beverage
member([_,_,_,unk_animal,_,_],L).% fill missing animal