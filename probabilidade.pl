% 1. Definindo os fatos básicos
% Formato: evento_prob(Evento, Valor, Probabilidade)
evento_prob(street, dry, 0.6).
evento_prob(street, wet, 0.3).
evento_prob(street, snow_covered, 0.1).

evento_prob(flywheel, ok, 0.9).
evento_prob(flywheel, worn, 0.1).

evento_prob(bulb, working, 0.95).
evento_prob(bulb, broken, 0.05).

evento_prob(cable, working, 0.9).
evento_prob(cable, broken, 0.1).

% 2. Regras do sistema
luz(ligada) :-
    evento_prob(street, _, _),
    evento_prob(flywheel, ok, _),
    evento_prob(bulb, working, _),
    evento_prob(cable, working, _).

luz(desligada) :-
    (evento_prob(flywheel, worn, _); 
     evento_prob(bulb, broken, _); 
     evento_prob(cable, broken, _)).

% 3. Consulta de probabilidade básica
consulta_prob(Evento, Valor, Probabilidade) :-
    evento_prob(Evento, Valor, Probabilidade).

% 4. Exemplos de USO PRÁTICO:
% Para consultar probabilidade de neve:
% ?- consulta_prob(street, snow_covered, P).
% Para verificar estado da luz:
% ?- luz(ligada). ou ?- luz(desligada).

% 5. Regra condicional adicional (exemplo)
dynamo(slipping) :-
    evento_prob(street, snow_covered, _),
    evento_prob(flywheel, worn, _).