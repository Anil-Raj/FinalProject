A = LOAD '/access' using PigStorage(' ') ;
B = foreach A generate $0 as c;
C = group B by $0;
D = foreach C generate group,COUNT(B);
STORE D INTO '/prg/ipout'
USING PigStorage(',');
