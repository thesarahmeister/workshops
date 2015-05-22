/********************Macro practice with SAS practice Class database************/


proc contents data=sashelp.class;
run;

/*Example of a simple macro variable*/

%let var = height age; 
proc glm data=sashelp.class;
	model weight = &var;
run;

%let var = height age; 
proc glm data=sashelp.class;
	class sex;
	model &var = weight sex;
run;


/*Example of a simple macro*/

%macro means(vars, class=, data=);
    proc means data=&data;
        var &vars;
        class &class;
    run;
    %mend means;

%let vars = height weight age;

%means(&vars, class = sex, data = sashelp.class);


/*Example of a slightly more complex macro*/

%macro glm(vars, class=, data=);
    proc glm data=&data;
        class &class;
		model &vars = weight;
    run;
    %mend glm;

%let vars = height age;

%glm(&vars, class = sex, data = sashelp.class);


/*What this code would look like without a macro*/

proc glm data=sashelp.class;
    class sex;
	model height = weight;
run;

proc glm data=sashelp.class;
    class sex;
	model age = weight;
run;

	 

/***Other tasks with macros***/

/*Creating new variables*/
data newvar; set sashelp.class;
	BMI = 703*(weight/(height**2)); /*height is inches so must multiply by 703*/
	run;

proc print data = newvar;
run;

 
/*Transforming variables*/

%macro transform(x);
	&x._log= log(&x);
	&x._sqrt= sqrt(&x);
	&x._inv= 1/(&x);
%mend transform;

data transf; set newvar;
	%transform(age);
	%transform(height);
	%transform(weight);
	%transform(bmi);
	run;

proc print data=transf;
run;


/*Proc contents*/
%macro contents(db);
	proc contents data =&db;
	run;
%mend contents;

%contents(sashelp.fish);
%contents(sashelp.class);
%contents(newvar);
%contents(transf);

/*Proc print*/
%macro print(db);
	proc print data =&db;
	run;
%mend print;

%print(sashelp.fish);
%print(sashelp.class);
%print(newvar);
%print(transf);



/*************Macro practice with fish database******************/
proc contents data=sashelp.fish;
run;


%macro means(vars, where=, class=, data=);
    proc means data=&data;
        var &vars;
        where &where;
        class &class;
    run;
	%mend means;

%let length = Length1 Length2 Length3;
%let others = Weight Height Width;

%means(&length, where = Weight < 200,
    class = Species, data = sashelp.fish);

%means(&others, class = Species, data = sashelp.fish);


/***Checking model fit, for males*/
/*Regular Code*/
proc sgplot data=sashelp.class;
	scatter x=height y=weight;
	where sex = "M";
run;

/*Macro*/
%macro sgplot(vars, where=, class=, data=);
    proc sgplot data=&data;
       scatter x=&var1 y=&var2;
	   where &where;
    run;
    %mend sgplot;

%let var1 = height;
%let var2 = weight;

%sgplot(&vars, where = sex = "M" , data = sashelp.class);
%sgplot(&vars, where = sex = "F" , data = sashelp.class);



/***Checking Residual Distribution -- 2 step process:
Regular code:
Step 1: Run a linear regression and output residual and predicted terms in a new dataset*/
proc reg data=sashelp.class;
	model height=weight age;
	where sex = "m";
	output out=resid residual=r predicted=fit;
run;
quit;

/*Step 2: Plot the output of the new dataset*/
goptions reset=all;
proc univariate data=resid normal;
	var r;
	qqplot r / normal(mu=est sigma=est);
run;


/****Checking Residual Distribution -- 2 step process:
Macro code:
Step 1: Run a linear regression and output residual and predicted terms in a new dataset*/
%macro reg(vars, where=, class=, data=);
    proc reg data=&data;
       model &var1 = &var2 &var3;
	   where &where;
    output out=resid residual=r predicted=fit;
	run;
	quit;

/*Step 2: Plot the output of the new dataset*/
goptions reset=all;
proc univariate data=resid normal;
	var r;
	qqplot r / normal(mu=est sigma=est);
	run;
	%mend reg;

%let var1 = height;
%let var2 = weight;
%let var3 = age;

%reg(&vars, where = sex = "M" , data = sashelp.class);







