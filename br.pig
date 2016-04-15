A = LOAD '/access' using PigStorage(' ')  as (url:chararray,
						a:chararray,
						b:chararray,
						timestamp:chararray,
						c:chararray,
						d:chararray,
						e:chararray,
						f:chararray,
						g:chararray,
						h:chararray,
						i:chararray,
						browser:chararray);
B = foreach A generate browser; 
C = foreach B generate FLATTEN(
				REGEX_EXTRACT_ALL(
						  browser,'.([0-9A-Za-z]*.[0-9].[0-9])'
						)
			      ) 
	AS (br:chararray);



D = group C by br;
E = foreach D generate group,COUNT(C);
STORE E INTO '/prg/brout'
USING PigStorage(',');


