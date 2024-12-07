% Solución en Prolog
% Aquí va el código.
%Marzocca, Damian

%Punto 1
%casa(metrosCuadrados).
%departamento(ambientes,banios).
%loft(anio).
viveEn(juan,casa(120),almagro).
viveEn(nico,departamento(3,2),almagro).
viveEn(alf,departamento(3,1),almagro).
viveEn(julian,loft(2000),almagro).
viveEn(vale,departamento(4,1),flores).
viveEn(fer,casa(110),flores).

%Punto2
barrioCopado(Barrio):-
    esBarrio(Barrio),
    forall(viveEn(_,Propiedad,Barrio), propiedadCopada(Propiedad)).
    
esBarrio(Barrio):-viveEn(_,_,Barrio).

propiedadCopada(casa(Metros)):- Metros>100.

propiedadCopada(departamento(Ambientes,_)):-Ambientes > 3.

propiedadCopada(departamento(_,Banios)):- Banios>1.

propiedadCopada(loft(Anio)):-Anio>2015.

%Punto3
barrioCaro(Barrio):-
    esBarrio(Barrio),
    forall(viveEn(_,Propiedad,Barrio), not(propiedadBarata(Propiedad))).

propiedadBarata(loft(Anio)):- Anio<2005.

propiedadBarata(casa(Metros)):-Metros<90.

propiedadBarata(departamento(1,_)).

propiedadBarata(departamento(2,_)).

%Punto4

propiedad(juan,casa(120),150000).
propiedad(nico,departamento(3,2),80000).
propiedad(alf,departamento(3,1),75000).
propiedad(julian,loft(2000),140000).
propiedad(vale,departamento(4,1),95000).
propiedad(fer,casa(110),60000).

esPropiedad(Propiedad):-propiedad(_,Propiedad,_).

compraDePropiedades(Plata,Propiedades,RestoPlata):-
    propiedadesHabilitadas(PropiedadesHabilitadas),
    sublista(PropiedadesHabilitadas,Propiedades),
    alMenosUnaPropiedad(Propiedades),
    costosPropiedades(Propiedades,Costos),
    sum_list(Costos, CostoTotal),
    CostoTotal =< Plata,
    RestoPlata is Plata - CostoTotal.
    
propiedadesHabilitadas(PropiedadesHabilitadas):-
    findall(Propiedad,esPropiedad(Propiedad) , PropiedadesHabilitadas).

costosPropiedades(Propiedades, Costos):-
    findall(Costo,(member(Propiedad,Propiedades),propiedad(_,Propiedad,Costo)), Costos).

alMenosUnaPropiedad(Propiedades):-
    length(Propiedades, Cant),
    Cant > 0.
    
sublista([],[]).
sublista([_|Cola],Sublista):-sublista(Cola,Sublista).
sublista([Cabeza|Cola],[Cabeza|Sublista]):-sublista(Cola,Sublista).




