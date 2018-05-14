?= ? ?- ?20 ?: ?0.01 ?: ?20 ?;
xx ?= ? ?- ?20 ?: ?0.01 ?: ?20 ?;
% plotting boundaries
% Y1 = sqrt(2.*x - 1);
Y2 ?= ? ?( ?9 ? ?- ? ?0.8 ?* ?( ?x ?.^ ?2 ?)) ? ?./ ? ?2 ?;
figure
hold on
plot ?(( ?x ?.^ ?2 ? ?+ ? ?1 ?) ? ?/ ? ?2 ?, ? x ?, ?'LineWidth' ?, ?1 ?); ? ?% pirmas constraint
plot ?( ?x ?, ? Y2 ?, ?'LineWidth' ?, ?1 ?);
legend ?( ?'2 * x - y^2 - 1 = 0' ?, ? ?'9 - 0.8 * x^2 - 2 * y = 0' ? ?);
xlabel ?( ?'x' ?);
ylabel ?( ?'y' ?);
plot ?( ?x ?, ? ?10 ?* ?ones ?( ?size ?( ?x ?)), ? ?'b' ?);
plot ?( ?x ?, ? ?- ?10 ?* ?ones ?( ?size ?( ?x ?)), ? ?'b' ?);
plot ?( ?10 ?* ?ones ?( ?size ?( ?x ?)), ? x ?, ? ?'b' ?);
plot ?( ?- ?10 ?* ?ones ?( ?size ?( ?x ?)), ? x ?, ? ?'b' ?);
% f(x,y) = -x - y
% subject to 2x - y^2 - 1 >= 0
% and 9 - 0.8*x^2 - 2y >= 0
% linearization of constraints
% new constraints -5 <= x <= 5 , -5 <= y <= 5
x_min ?= ? ?- ?500 ?; ? x_max ?= ? ?500 ?;
y_min ?= ? ?- ?500 ?; ? y_max ?= ? ?500 ?;
% Iterate while most demaged function is more than EPS
EPS ?= ? ?1e-5 ?;
f ?= ? ?[ ?- ?1 ?; ? ?- ?1 ?];
A ?= ? ?[];
b ?= ? ?[];
lb ?= ? ?[ ?- ?10 ?; ? ?- ?10 ?];
ub ?= ? ?[ ?10 ?; ? ?10 ?];
hold on
X ?= ? ?[ ?0 ?, ?0 ?];
ITER ?= ? ?6 ?;DELETE_DRAW ?= ? ?3 ?;
str ?= ? ?sprintf ?( ?'Cutting plane algoritmo eiga atmetant nereikalingus
ribojimus\n, kai atmetamas %s - as ribojimas ' ?,
int2str ?( ?DELETE_DRAW ?));
title ?( ?str ?)
oldpnt ?= ?X ?;
x_low ?= ? ?- ?15 ?;
x_high ?= ? ?15 ?;
for ? ?i ? ?= ? ?1 ?: ?500
?[ ?x ?, ?fval ?, ?exitflag ?, ?output ?, ?lambda ?] ? ?= ? ?linprog ?( ?f ?, ?A ?, ?b ?,[],[], ?lb ?, ?ub ?);
x
X ?= ? x ?;
val1 ?= ? ?g1 ?( ?X ?);
val2 ?= ? ?g2 ?( ?X ?);
minval ?= ? ?min ?( ?val1 ?, ? val2 ?);
?if ?( ?abs ?( ?minval ?) ? ?< ? EPS ?)
?break ?;
?end ?% stuff ?if ?( ?g1 ?( ?X ?) ? ?< ? ?g2 ?( ?X ?))
?[ ?grad_x ?, ? grad_y ?] ? ?= ? ?grad_g1 ?( ?X ?);
A ?= ? ?[ ?A ?; ? ?- ?grad_x ?- ?grad_y ?];
b ?= ? ?[ ?b ?g1 ?( ?X ?) ?- ?X ?( ?1 ?) ?* ?grad_x ?- ?X ?( ?2 ?) ?* ?grad_y ?];
?% Draw line ?%p1 = plot(xx, (-g1(X) -grad_x.*(xx-X(1)) +
grad_y*X(2))./grad_y, ?'black' ?);
?else?[ ?grad_x ?, ? grad_y ?] ? ?= ? ?grad_g2 ?( ?X ?);
A ?= ? ?[ ?A ?; ? ?- ?grad_x ?- ?grad_y ?];
b ?= ? ?[ ?b ?g2 ?( ?X ?) ?- ?X ?( ?1 ?) ?* ?grad_x ?- ?X ?( ?2 ?) ?* ?grad_y ?];
?% Draw line
pnt1 ?= ? ?[ ?x_low ?, ? ?( ?- ?g2 ?( ?X ?) ? ?- ?grad_x ?.* ?( ?x_low ?- ?X ?( ?1 ?)) ? ?+
grad_y ?* ?X ?( ?2 ?)) ?./ ?grad_y ?];
pnt2 ?= ? ?[ ?x_high ?, ? ?( ?- ?g2 ?( ?X ?) ? ?- ?grad_x ?.* ?( ?x_high ?- ?X ?( ?1 ?)) ? ?+
grad_y ?* ?X ?( ?2 ?)) ?./ ?grad_y ?];
?end?% Ziurim, ar yra ka ismesti ?[ ?Asize ?, ? ?~ ?] ? ?= ? ?size ?( ?A ?);
xParamLst ?= ? ?A ?( ?end ?, ? ?1 ?);
yParamLst ?= ? ?A ?( ?end ?, ? ?2 ?);
constParamLst ?= ? ?b ?( ?end ?);
?for ? ?j ? ?= ? ?1 ?: ?Asize ?-1
xParam ?= ? ?A ?( ?j ?, ? ?1 ?);
yParam ?= ? ?A ?( ?j ?, ? ?2 ?);
constParam ?= ? ?b ?( ?j ?);
aSolve ?= ? ?[ ?xParam yParam
xParamLst yParamLst ?];
bSolve ?= ? ?[ ?constParam constParamLst ?] ?' ?;
res ?= ? ?linsolve ?( ?aSolve ?, ? bSolve ?);
?if ?( ?isnan ?( ?res ?( ?1 ?)))
?continue ?;
?end ?if ?( ?- ?10 ? ?<= ? ?res ?( ?1 ?) ? ?&& ? ?res ?( ?1 ?) ? ?<= ? ?10 ? ?&& ? ?- ?10 ? ?<= ? ?res ?( ?2 ?) ? ?&& ? ?res ?( ?2 ?) ? ?<=
10 ?)
?continue ?;
?end
DELETE_DRAW ?= ? DELETE_DRAW ?- ? ?1 ?;
?if ?( ?DELETE_DRAW ?<= ? ?0 ?)
pnt1 ?= ? ?[ ?x_low ?, ? ?( ?constParam ?- ? xParam ?* ? x_low ?) ? ?/ ? yParam ?];
pnt2 ?= ? ?[ ?x_high ?, ? ?( ?constParam ?- ? xParam ?* ? x_high ?) ? ?/ ? yParam ?];
pl ?= ? ?plot ?([ ?pnt1 ?( ?1 ?), ? ?pnt2 ?( ?1 ?)], ? ?[ ?pnt1 ?( ?2 ?) ? ?, ? ?pnt2 ?( ?2 ?)] ? ?, ?'LineWidth' ?, ?2 ?,
'color' ?, ? ?'red' ?);
?%pl.Color=[0,0,0,1];
?end ?A ?( ?j ?, ? ?: ?) ? ?= ? ?[];
?b ?( ?j ?) ? ?= ? ?[];
?[ ?Asize ?, ? ?~ ?] ? ?= ? ?size ?( ?A ?);
?j ? ?= ? ?j ? ?- ? ?1 ?;
?end ?if ?( ?DELETE_DRAW ?<= ? ?0 ?)
?% draw all the lines that are fine ?[ ?Asize ?for ? ?j ?, ? ? ?= ?~ ? ?] ?1 ? ?= ?: ?Asize ? ?size ?( ?A ?);xParam ?= ? ?A ?( ?j ?, ? ?1 ?);
yParam ?= ? ?A ?( ?j ?, ? ?2 ?);
constParam ?= ? ?b ?( ?j ?);
pnt1 ?= ? ?[ ?x_low ?, ? ?( ?constParam ?- ? xParam ?* ? x_low ?) ? ?/ ? yParam ?];
pnt2 ?= ? ?[ ?x_high ?, ? ?( ?constParam ?- ? xParam ?* ? x_high ?) ? ?/ ? yParam ?];
?if ?( ?j ? ?== ? Asize ?)
pl ?= ? ?plot ?([ ?pnt1 ?( ?1 ?), ? ?pnt2 ?( ?1 ?)], ? ?[ ?pnt1 ?( ?2 ?) ? ?,
pnt2 ?( ?2 ?)], ?'LineWidth' ?, ?2 ?, ? ?'color' ?, ? ?'black' ?);
pl ?. ?Color ?= ?[ ?0 ?, ?0.9 ?, ?0 ?, ?1 ?];
?else
pl ?= ? ?plot ?([ ?pnt1 ?( ?1 ?), ? ?pnt2 ?( ?1 ?)], ? ?[ ?pnt1 ?( ?2 ?) ? ?, ? ?pnt2 ?( ?2 ?)], ? ?'--'
, ?'LineWidth' ?, ?1 ?, ? ?'color' ?, ? ?'black' ?);
pl ?. ?Color ?= ?[ ?0 ?, ?0 ?, ?0 ?, ? ?0.14 ?];
?end
?end
?break ?;
?end
end
% f(x,y) = -x -2y
% g1(x,y) = 1 - x^2 - y >= 0
% g2(x,y) = y >= 0
%
% Limits: -2 <= x <= 2
% -1 <= y <= 2
%
% LPP0 yields X0 = [2; 2]
%
% Linearize g1 at X0: -4x -y >= -5
%
xlim ?([ ?- ?15 ? ?15