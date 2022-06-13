# računanje godina, mjeseci i dana od rođendana.

SELECT  
	TIMESTAMPDIFF( YEAR, '1983-09-12', now() ) as godina, 
	TIMESTAMPDIFF( MONTH, '1983-09-12', now() ) % 12 as mjeseci,
	FLOOR( TIMESTAMPDIFF( DAY, '1983-09-12', now() ) % 30.4375 ) as dana;

