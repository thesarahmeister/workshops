/* Tests to check assumptions in linear regression
   DNS Data-related Workshop
   2015-02-13
   Daiva Nielsen and Luke Johnston */

proc contents data=sashelp.fish;
run;

/*1) Model Fit -- scatter plot*/
proc sgplot data=sashelp.fish;
scatter x=weight y=length1;
run;

/*2) Residual Distribution -- 2 step process:
Step 1: Run a linear regression and output residual and predicted terms in a new dataset*/
proc reg data=sashelp.fish;
model length1=weight;
output out=resid residual=r predicted=fit;
run;
quit;

/*Step 2: Plot the output of the new dataset*/
goptions reset=all;
proc univariate data=resid normal;
var r;
qqplot r / normal(mu=est sigma=est);
run;

/*3) Residual Variance -- linear regression and predicted plot*/
proc reg data=sashelp.fish;
model length1=weight / spec;
plot r.*p.;
run;
quit;


/*Log transforming variables*/
data new;
set sashelp.fish;
logWt = log(weight);
logLg=log(length1);
run;

/*trying square root transformation too*/
data new;
set sashelp.fish;
sqWt = sqrt(weight);
sqLg=sqrt(length1);
run;

/*Model Fit with transformed data*/
proc sgplot data=new;
scatter x=weight y=sqLg;
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


/*Example of a non-parametric test that can handle the fish data: PROC LOESS*/

/*LOESS stands for Local Regression - a way of fitting curves to data. Strength of relationship between variables
depends on the fit of the curve. Does not generate a p-value, but instead gives a smoothing parameter (alpha).
Intermediate alphas represent the best fit (small alpha = “over-fitting”, large alpha = “lack of fit”).
Helpful info:
http://www.ats.ucla.edu/stat/sas/library/loesssugi.pdf
http://www.med.upenn.edu/beat/docs/Jacoby2000.pdf */

proc loess data=sashelp.fish;
model length1 = weight;
run;
quit;






/*Analyses specifically on Perch species -- still not fit for linear regression*/

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

/*Transforming data*/
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
