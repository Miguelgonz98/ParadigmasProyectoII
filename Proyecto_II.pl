%
% ===============================================
%
% (c) 2021
% version 1.0.0 2021-11-19
%
% -----------------------------------------------
% EIF400 Paradigmas de Programación
% 2do ciclo 2021, grupo 01
% Proyecto 2
%
% A00148103 González Carvajal, Miguel GRUPO 3PM
% 117620480 González Quesada, Arnoldo GRUPO 3PM
% 117960315 Ocampo Marín, Victor      GRUPO 3PM
%
% ===============================================
%Predicado para evaluar un polinomio lineal
  %Recibe:
    %V: Valor inicial de la secuencia.
    %P: Lista que representa el polinomio lineal.
    %D: Resultado.
  %Regresa: La suma del valor de sus exponentes multiplicados y .
  %elevados del valor de según los elementos de la lista y el valor x.
  %Ejemplo: [-32, 0, 6, 1] representa (-32 * X^0 + 0*X^1 + 6*X^2 + 1*X^3)
  %Ejemplo de la consulta:
  %?- evaluar(1.5, [-32, 0, 6, 1], D).
  %D = -15.125.
%i: indice: inicia en 0
%acumulador inicia en 0
evaluar(P,A,R) :-
accEval(P,A,0,0,R).
accEval(([H|T]),A,Pow,Accres,R) :-
        Rnew is (Accres+H*(A**Pow)),
        Pownew is Pow+1,
        accEval(T,A,Pownew,Rnew,R).  % *See below
accEval([],_A,_Pow,Accres,Accres).

% ===============================================
%Predicado para derivar un polinomio lineal
  %Recibe una lista, representando al polinomio
  %Ejemplo: [-32, 0, 6, 1] representa (-32 * X^0 + 0*X^1 + 6*X^2 + 1*X^3)
  %Regresa: Una lista, representando al polinomio lineal derivado.
% ===============================================
%Predicado para calcular las raices de un polinomio lineal.
  %Recibe:
    %X0:la aproximación inicial de la raíz
    %P:los coeficientes del polinomio por evalua
    %E:error máximo (diferencia máxima entre dos aproximaciones sucesivas)
    %R:La raíz calculada para el polinomio.
