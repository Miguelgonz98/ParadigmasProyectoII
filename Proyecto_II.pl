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
    %X: Valor inicial de la secuencia.
    %P: Lista que representa el polinomio lineal.
    %D: Resultado.
  %Regresa: La suma del valor de sus exponentes multiplicados y .
  %elevados del valor de según los elementos de la lista y el valor x.
  %Ejemplo: [-32, 0, 6, 1] representa (-32 * X^0 + 0*X^1 + 6*X^2 + 1*X^3)
  %Ejemplo de la consulta:
  %?- evaluar(1.5, [-32, 0, 6, 1], D).
  %D = -15.125.
evaluar(X,P,D) :-
sub_evaluar(X,P,0,0,D).
sub_evaluar(X,([H|T]),Potencia,Acum,D) :-
        R is (Acum+H*(X**Potencia)),
        I is Potencia+1,
        sub_evaluar(X,T,I,R,D).
sub_evaluar(_X,[],_Potencia,Acum,Acum).
% ===============================================
%Predicado para derivar un polinomio lineal
  %Recibe una lista, representando al polinomio
  %Ejemplo: [-32, 0, 6, 1] representa (-32 * X^0 + 0*X^1 + 6*X^2 + 1*X^3)
  %Regresa: Una lista, representando al polinomio lineal derivado.
    %P: Lista que representa el polinomio lineal.
    %D: Resultado.
derivar([_|T],D) :- sub_derivar(T,1,[],D).
    sub_derivar([],_,D,D).
    sub_derivar([X|T],A,B,D) :-
        X1 is X*A,
        T1 = [X1],
        append(B,T1,R),
        A1 is A+1,
        sub_derivar(T,A1,R,D).
% ===============================================
%Predicado para calcular las raices de un polinomio lineal.
  %Recibe:
    %X0:la aproximación inicial de la raíz
    %P:los coeficientes del polinomio por evalua
    %E:error máximo (diferencia máxima entre dos aproximaciones sucesivas)
    %R:La raíz calculada para el polinomio

calcular(X0,P,E,D) :-
        evaluar(X0,P,F),
        derivar(P,FPrime),
        evaluar(X0, FPrime, FPrimDer),
        H is (F/FPrimDer),
        ( abs(H) < E
        ->
          D is X0
        ;
          NewX0 is X0-H,
          calcular(NewX0,P,E,D)
        ).
