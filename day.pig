A = LOAD '/access' using PigStorage(' ')  as (url:chararray,a:chararray,b:chararray,timestamp:chararray);
B = foreach A generate timestamp; 
C = foreach B generate FLATTEN(
				REGEX_EXTRACT_ALL(
						  timestamp,'.([0-9]*.[A-Za-z]*.[0-9]*).*'
						)
			      ) 
	AS (date:chararray);



D = group C by date;
E = foreach D generate group,COUNT(C);
dump E;
STORE E INTO '/prg/dayout'
USING PigStorage(',');


