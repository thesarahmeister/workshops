/* Tests to check assumptions in linear regression
   DNS Data-related Workshop
   2015-02-13
   Daiva Nielsen and Luke Johnston */

proc contents data=sashelp.class;
run;

/*1) Model Fit -- scatter plot*/
proc sgplot data=sashelp.class;
scatter x=height y=weight;
run;

/*2) Residual Distribution -- 2 step process:
Step 1: Run a linear regression and output residual and predicted terms in a new dataset*/
proc reg data=sashelp.class;
model height=weight age;
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
proc reg data=sashelp.class;
model height=weight / spec;
plot r.*p.;
run;
quit;


/*4) Collinearity*/
proc reg data=sashelp.class;
model height = weight age / vif tol;
run;
quit;


/*5) Influence/outliers*/
/*Visual inspection of scatterplot -- this is the more complex code to make a scatterplot.
Using the code from "1) Model Fit" will also work.*/
proc gplot data=sashelp.class;
plot height*weight=1 / vaxis=axis1;
run;
quit;

/*Proc univariate to determine extreme observations*/
proc univariate data=sashelp.class;
var height weight;
run;
quit;
