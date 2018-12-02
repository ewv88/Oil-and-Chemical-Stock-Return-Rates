data stocks;
input Allied Dow Union Standard Texas;
*Allied, Dow, and Union are Chemical;
*Standard and Texas are Oil;
datalines;
2.12     1.92     2.25     5.15     6.42
3.98     3.45     2.78     4.2          4.9
1.03     1.86     2.81     5.9          4.7    
2.56     2.90     2.33     4.76     5.23
2.37     2.98     2.41     4.82     5.18
1.75     1.22     2.79     4.25     4.72
2.82     4.09     2.98     4.71     4.21
4.01     3.69     3.04     4.76     4.1
2.25     2.82     2.21     5.04     5.76
2.44     1.73     2.18     5.12     5.81
2.81     2.16     2.74     4.98     4.72
1.32     1.99     2.36     4.24     4.96
4.12     3.91     2.31     4.26     5.62
2.40     2.56     2.29     4.31     5.75
3.63     3.00     2.18     4.18     5.01
4.01     3.70     2.70     4.57     5.00
;

ods graphics on;
ods rtf file='Canonical Correlation-Stocks.rtf';

Proc means data=stocks n mean std skew maxdec=2;
title 'Simple Statistics';
run;

Proc cancorr all
vprefix=Chemical wprefix=Oil
vname='Chemical Companies' wname='Oil Companies';
var Allied Dow Union;
with Texas Standard;
run;

ods graphics off;
ods rtf close;
run;
quit;
