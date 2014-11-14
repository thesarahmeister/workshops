data playing;
    set sashelp.fish;
run;

proc print data=playing;
run;

/*1. Scatterplot to check model fit*/
proc sgplot data=playing;
  scatter x=weight y=length1;
run;

data playing; set playing;
loglength=log(length1);
elength=length1**2;
run;

proc sgplot data=playing;
  scatter x=weight y=loglength;
run;

proc sgplot data=playing;
  scatter x=weight y=elength;
run;

proc sgplot data=playing;
  scatter x=weight y=length1;
run;

proc sgplot data=playing;
  scatter x=weight y=height;
run;

proc sgplot data=playing;
  scatter x=weight y=width;
run;

proc sgplot data=playing;
  scatter x=weight y=length1 / group=species;
run;

/*2. Checking distribution of residuals -- this also gives scatterplot of residuals vs. fitted values*/
proc reg data=playing;
 model length1=weight;
 output out=resid residual=r predicted=fit;
run;
quit;


proc reg data=playing;
 model elength=weight;
 output out=resid residual=r predicted=fit;
run;
quit;

goptions reset=all;
proc univariate data=resid normal;
 var r;
 qqplot r / normal(mu=est sigma=est);
run;
/*check Shapiro-Wilk p-value, should be greater than 0.05 if residuals are normally distributed*/

/*3. Checking homoscedasticity of residuals*/
proc reg data=playing;
 model length1=weight;
 plot r.*p.; /*r. tells SAS to calculate residuals, p. tells SAS to calculate predicted value*/
run;
quit;

/*White test to examine a p-value: Look at "Test of First and Second Moment Moment Specification" chi-sq p-value
will be >0.05 when residuals are homoscedastic*/
proc reg data=playing;
 model height=weight / spec;
run;
quit;




proc glm data=playing;
	model length1 = weight; 

	output out = mydata.resid1
	predicted=fit residual=resid;

symbol1 value=circle h=1;
proc gplot data=playing.resid1;
plot length1*fit/;
run;

title 'predicted vs. actual plot'
run;




proc means data=playing;
run;

proc freq data=playing;
    table Species;
run;

proc glm data=playing;
    class Species;
    model Weight = Species / ss3;
    lsmeans Species / adjust=tukey pdiff;
    where Weight > 350;
run;
