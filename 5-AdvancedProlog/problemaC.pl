programa(X):- append([[begin],XS,[end]],X), instruccions(XS).

instruccions(X):- instruccio(X).
instruccions(X):- append([A,[';'],B],X), instruccio(A), instruccions(B).

instruccio([A,'=',B,'+',C]):- variable(A), variable(B), variable(C).
instruccio(X):- append([[if],A,[=],B,[then],Y,[else],Z,[endif]],X), variable(A), variable(B), instruccions(Y), instruccions(Z).

variable([x]).
variable([y]).
variable([z]).
variable(x).
variable(y).
variable(z).