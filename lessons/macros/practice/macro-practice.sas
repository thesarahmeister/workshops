/********************Macro practice with SAS practice Class database************/


proc contents data=sashelp.class short;
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

%macro glm(y, x, class=, data=);
    proc glm data=&data;
        class &class;
	model &y = &x &class;
    run;
    %mend glm;

%let y = height age;

%glm(&y, weight, class = sex, data = sashelp.class);


/*What this code would look like without a macro*/

proc glm data=sashelp.class;
    class sex;
	model height = weight sex;
run;

proc glm data=sashelp.class;
    class sex;
	model age = weight sex;
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
	proc contents data =&db short;
	run;
%mend contents;

%contents(sashelp.fish);
%contents(sashelp.class);
%contents(newvar);
%contents(transf);

/*Proc print*/
%macro print(db);
	proc print data =&db (obs=10);
	run;
%mend print;

%print(sashelp.fish);
%print(sashelp.class);
%print(newvar);
%print(transf);



/*************Macro practice with fish database******************/
proc contents data=sashelp.fish short;
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
%macro sgplot(x, y, where=, data=);
    proc sgplot data=&data;
        scatter x=&x y=&y;
        where &where;
    run;
    %mend sgplot;

%sgplot(height, weight, where = sex = "M" , data = sashelp.class);
%sgplot(height, weight, where = sex = "F" , data = sashelp.class);



/***Linear regression
    Regular code:
Run a linear regression and output residual and predicted terms in a new dataset*/
proc reg data=sashelp.class;
    model height=weight age;
    where sex = "M";
run;
quit;


/****Linear regression
    Macro code:
Run a linear regression and output residual and predicted terms in a new dataset*/
%macro reg(y, x, where=, data=);
    proc reg data=&data;
        model &y = &x;
        where &where;
    run;
    quit;
    %mend reg;


%reg(height, weight age, where = sex = "M" , data = sashelp.class);







