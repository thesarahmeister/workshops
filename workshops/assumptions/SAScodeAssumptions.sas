/*Assessing raw variables from fish practice database*/
proc contents data=sashelp.fish;
run;

proc freq data=sashelp.fish;
tables species;
run;

/*Model Fit -- scatter plot*/
proc sgplot data=sashelp.fish;
scatter x=weight y=length1;
run;

/*Residual Distribution -- 2 step process*/
proc reg data=sashelp.fish;
model length1=weight;
output out=resid residual=r predicted=fit;
run;
quit;

goptions reset=all;
proc univariate data=resid normal;
var r;
qqplot r / normal(mu=est sigma=est);
run;

/*Residual Variance -- linear regression and predicted plot*/
proc reg data=sashelp.fish;
model length1=weight;
plot r.*p.;
run;
quit;

/*Log transforming variables*/
data new;
set sashelp.fish;
logWt = log(weight);
logLg=log(length1);
run;

/*Model Fit with transformed data*/
proc sgplot data=new;
scatter x=logWt y=logLg;
run;

/*Residual Distribution with transformed data*/
proc reg data= new;
model logLg=logWt;
output out=resid residual=r predicted=fit;
run;
quit;

goptions reset=all;
proc univariate data=resid normal;
var r;
qqplot r / normal(mu=est sigma=est);
run;

/*Residual variance with transformed data*/
proc reg data=new;
model logLg=logWt;
plot r.*p.;
run;
quit;


/*Collinearity*/
proc reg data=sashelp.fish;
model height = weight length1 / vif tol;
run;
quit;

/*Influence/outliers*/
/*Visual inspection of scatterplot*/
proc gplot data=sashelp.fish;
plot height*weight=1 / vaxis=axis1;
run;
quit;

/*Proc univariate to determine extreme observations*/
proc univariate data=sashelp.fish;
var height;
run;
quit;


/*....give an example of a non-parametric test that could handle the fish data?*/

/*Analyses specifically on Perch species*/

/*Model Fit*/
proc sgplot data=sashelp.fish;
scatter x=weight y=length1;
where species="Perch";
run;

/*Residual Distribution -- 2 step process*/
proc reg data=sashelp.fish;
model length1=weight;
output out=resid residual=r predicted=fit;
where species="Perch";
run;
quit;

goptions reset=all;
proc univariate data=resid normal;
var r;
qqplot r / normal(mu=est sigma=est);
run;

/*Residual Variance*/
proc reg data=sashelp.fish;
model length1=weight;
plot r.*p.;
where species="Perch";
run;
quit;


data newPerch;
set sashelp.fish;
if species ne "Perch" then delete;
logWt = log(weight);
logLg=log(length1);
run;

/*Model Fit*/
proc sgplot data=newPerch;
scatter x=logWt y=logLg;
where species="Perch";
run;

/*Residual Distribution -- 2 step process*/
proc reg data=newPerch;
model logLg=LogWt;
output out=resid residual=r predicted=fit;
where species="Perch";
run;
quit;

goptions reset=all;
proc univariate data=resid normal;
var r;
qqplot r / normal(mu=est sigma=est);
run;

/*Residual Variance*/
proc reg data=newPerch;
model logLg=logWt;
plot r.*p.;
where species="Perch";
run;
quit;
