
proc contents data=fats.FApool position;
run;

proc contents data=fats.baselineFA position;
run;



proc univariate data=fats.baselineFA plots normal;
    id sid;
    var age;
run;
 /*normal - missing 5*/
proc freq data=fats.baselineFA;
    tables sex ethnicity smoking;
run;

/*missing 5 for sex, ethnicity;
missing 17 for smoking*/
proc univariate data=fats.baselineFA plots normal;
id sid;
var BMI waist SBP DBP totExp1ctivity;
run;

proc univariate data=fats.baselineFA plots normal;
    id sid;
    var GL01 GL03;
run;

proc univariate data=fats.baselineFA plots normal;
    id sid;
run;


/****************FAMILY HISTORY OF DIABETES************************/

data t012dx;

    set .t012dx;

    if dx NE 1 then delete;

run;

data t012dx;

    set t012dx;

    if (DXmother=1 OR DXfather=1 OR DXsiblings=1) then famhistory=1;

    else famhistory=0;

run;


proc freq data=t012dx;

    tables famhistory;

run;


proc print data=t012dx;

    var SID dx DXmother DXfather DXsiblings famhistory;

run;


data fats.baselineFA;
    
    merge fats.baselineFA t012dx;

    by SID;

run;

data fats.baselineFA;
    set fats.baselineFA;
    if SFA140=""  then delete;
run;


proc freq data = fats.baselineFA;
    tables famhistory;
run;
 /*missing 12*/
/*289 (62.02%) have fam history of diabetes*/

/*Table 1*/
/*PERCENT_Exp3 = percent Exp3 of total FA in NEFA pool*/

proc univariate data=fats.baselineFA plots normal;
    id sid;
    var PERCENT_Exp3;
run;
 /*n=482*/

/*proc univariate data=fats.baselineFA noprint;

    var PERCENT_Exp3;

    output out=tertiles pctlpts=33 66 pctlpre=P;

run;

proc print data=tertiles;

run;
*/

data quartiles;
    set fats.baselineFA;
    
    if percent_Exp3<0.104 then quartile=0;

    else if percent_Exp3>=0.104 AND percent_Exp3<0.14 then quartile=1;

    else if percent_Exp3>=0.14 AND percent_Exp3<0.23 then quartile=2;

    else if percent_Exp3>=0.23 then quartile=3;
    
run;

proc freq data=quartiles;
    tables quartile;
run;



proc univariate data=fats.baselineFA plots normal;
    id sid;
    var age;
run;
 /*normal - missing 5*/
proc glm data=quartiles;
    class quartile;
    model age=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var age;
    class quartile;
run;


proc freq data=quartiles;
    tables sex*quartile/chisq;
run;

proc freq data=quartiles;
    tables ethnicity*quartile/chisq;
run;

proc freq data=quartiles;
    tables smoking*quartile/chisq;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
    var BMI;
run;
 /*normal*/
proc npar1way data=quartiles Wilcoxon;
    
    class quartile;

    var BMI;

run;

proc univariate data=quartiles plots normal;
    id sid;
    var BMI;
    class quartile;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
    var waist;
run;
 /*normal*/
proc glm data=quartiles;
    class quartile;
    model waist=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var waist;
    class quartile;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
    var SBP;
run;
 /*normal*/
proc glm data=quartiles;
    class quartile;
    model SBP=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var SBP;
    class quartile;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
    var DBP;
run;
 /*normal*/
proc glm data=quartiles;
    class quartile;
    model DBP=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var DBP;
    class quartile;
run;


proc npar1way data=quartiles Wilcoxon;
    
    class quartile;

    var totExp1ctivity;

run;

proc univariate data=quartiles plots normal;
    id sid;
    var totExp1ctivity;
    class quartile;
run;


proc freq data=quartiles;
    tables famhistory*quartile/chisq;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
    var GL01 GL03;
run;
 /*both normal*/
proc glm data=quartiles;
    class quartile;
    model GL01=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var GL01;
    class quartile;
run;


proc glm data=quartiles;
    class quartile;
    model GL03=quartile;
run;

proc univariate data=quartiles plots normal;
    id sid;
    var GL03;
    class quartile;
run;


proc univariate data=fats.baselineFA plots normal;
    id sid;
run;
 /*all not normal*/
proc npar1way data=quartiles Wilcoxon;
    
    class quartile;


run;

proc univariate data=quartiles plots normal;
    id sid;
    class quartile;
run;


proc npar1way data=quartiles Wilcoxon;
    
    class quartile;


run;

proc univariate data=quartiles plots normal;
    id sid;
    class quartile;
run;


proc univariate data=quartiles plots normal;
    id sid;
    var RATIO_INDEX_IR;
run;

/*outlier sid=1354*/
proc npar1way data=quartiles Wilcoxon;
    
    class quartile;

    var RATIO_INDEX_IR;

run;


/*testing Outcome3 REMOVING OUTLIER sid=1354*/
data exclude;
    set quartiles;
    if sid=1354 then delete;
run;

proc univariate data=exclude plots normal;
    id sid;
    var RATIO_INDEX_IR;
run;

proc npar1way data=exclude Wilcoxon;
    
    class quartile;

    var RATIO_INDEX_IR;

run;
 /*still significant even when outlier excluded*/

proc univariate data=exclude plots normal;
    id sid;
    var RATIO_INDEX_IR;
    class quartile;
run;



proc npar1way data=quartiles Wilcoxon;
    
    class quartile;

    var Outcome4;

run;

proc univariate data=quartiles plots normal;
    id sid;
    var Outcome4;
    class quartile;
run;


/*****TABLE 2*****/
/*Importing Exp3 in all 4 FA pools*/
PROC IMPORT OUT= FATS.Exp3_allpools 
    DATAFILE= "C:\Users\User\Documents\Miscellaneous\FA Analys
    is 2013\Complete data set with indices and ratios_SAS.xlsx" 
    DBMS=EXCEL REPLACE;

    RANGE="Exp3_all_pools$";
    
    GETNAMES=YES;

    MIXED=NO;

    SCANTEXT=YES;

    USEDATE=YES;

    SCANTIME=YES;

RUN;

proc contents data=fats.Exp3_allpools position;
run;

proc sort data=fats.Exp3_allpools;
    by sid;
run;

data fats.testmerge;
    merge fats.baselineFA FATS.Exp3_allpools;
    by SID;
run;


/*Exp3*/
proc univariate data=fats.testmerge plots normal;
    var Exp3 PERCENT_Exp3;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp3 PERCENT_Exp3;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp3 PERCENT_Exp3;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp3 PERCENT_Exp3;
run;


proc corr data=fats.testmerge spearman;
    var PERCENT_Exp3 PERCENT_Exp3 PERCENT_Exp3 PERCENT_Exp3;
run;

proc corr data=fats.testmerge spearman;
    var Exp3 Exp3 Exp3 Exp3;
run;



/*Exp4*/
proc univariate data=fats.testmerge plots normal;
    var Exp4 PERCENT_Exp4;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp4 PERCENT_Exp4;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp4 PERCENT_Exp4;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp4 PERCENT_Exp4;
run;


proc corr data=fats.testmerge spearman;
    var PERCENT_Exp4 PERCENT_Exp4 PERCENT_Exp4 PERCENT_Exp4;
run;

proc corr data=fats.testmerge spearman;
    var Exp4 Exp4 Exp4 Exp4;
run;



/*Exp2*/
proc univariate data=fats.testmerge plots normal;
    var Exp2 PERCENT_Exp2;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp2 PERCENT_Exp2;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp2 PERCENT_Exp2;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp2 PERCENT_Exp2;
run;


proc corr data=fats.testmerge spearman;
    var Exp2 Exp2 Exp2 Exp2;
run;

proc corr data=fats.testmerge spearman;
    var PERCENT_Exp2 PERCENT_Exp2 PERCENT_Exp2 PERCENT_Exp2;
run;



/*Exp1*/
proc univariate data=fats.testmerge plots normal;
    var Exp1 PERCENT_Exp1;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp1 PERCENT_Exp1;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp1 PERCENT_Exp1;
run;

proc univariate data=fats.testmerge plots normal;
    var Exp1 PERCENT_Exp1;
run;


proc corr data=fats.testmerge spearman;
    var PERCENT_Exp1 PERCENT_Exp1 PERCENT_Exp1 PERCENT_Exp1;
run;

proc corr data=fats.testmerge spearman;
    var Exp1 Exp1 Exp1 Exp1;
run;


/*total omega 3 FAs*/
proc univariate data=fats.testmerge plots normal;
run;

proc univariate data=fats.testmerge plots normal;
run;

proc univariate data=fats.testmerge plots normal;
run;

proc univariate data=fats.testmerge plots normal;
run;


proc corr data=fats.testmerge spearman;
run;

proc corr data=fats.testmerge spearman;
run;


/*total omega-3 long-chain PUFAs (Exp3, Exp4, Exp2)*/
data calctotal;
    set fats.testmerge;

    

    

    

    

RUN;


proc univariate data=calctotal plots normal;
run;

proc univariate data=calctotal plots normal;
run;

proc univariate data=calctotal plots normal;
run;

proc univariate data=calctotal plots normal;
run;



proc corr data=calctotal spearman;
run;

proc corr data=calctotal spearman;
run;



/*Table 3 - CORRELATION ANALYSIS*/

/*Exp3*/
proc univariate data=fats.baselineFA plots normal;
    id sid;
    var Exp3 PERCENT_Exp3;
run;
 /*not normal*/
proc corr data=fats.testmerge spearman;
    var age bmi waist totExp1ctivity
    with Exp3 PERCENT_Exp3;
run;


/*Exp4*/
proc corr data=fats.testmerge spearman;
    var age bmi waist totExp1ctivity
    with Exp4 PERCENT_Exp4;
run;


/*Exp2*/
proc corr data=fats.testmerge spearman;
    var age bmi waist totExp1ctivity
    with Exp2 PERCENT_Exp2;
run;


/*Exp1*/
proc corr data=fats.testmerge spearman;
    var age bmi waist totExp1ctivity
    with Exp1 PERCENT_Exp1;
run;


/*TOTAL OMEGA-3 PUFAS*/
proc corr data=fats.testmerge spearman;
    var age bmi waist totExp1ctivity
    
run;



/*importing DHQ data*/
PROC IMPORT OUT= FATS.dietarydata 
    DBMS=EXCEL REPLACE;

    RANGE="SAS$";
    
    GETNAMES=YES;

    MIXED=NO;

    SCANTEXT=YES;

    USEDATE=YES;

    SCANTIME=YES;

RUN;


/*Food energy - kcal and Total fat - g*/
proc univariate data=fats.dietarydata plots normal;
    id sid;
    var kcal fat;
run;


/*Oz lean meat from fish/other seafood*/
proc univariate data=fats.dietarydata plots normal;
    id sid;
    var fish;
run;


data fats.testmerge;
    merge fats.testmerge fats.dietarydata;
    by sid;
run;

data fats.testmerge;
    set fats.testmerge;
    if SFA140="" then delete;
run;
 /*n=478*/


/*multivariate linear regression analysis*/
proc univariate data=fats.testmerge plots normal;
    id sid;
    var Exp3 PERCENT_Exp3;
run;
 /*not normal*/
proc univariate data=fats.testmerge plots normal;
    id sid;
    var Exp3 PERCENT_Exp3;
run;
 /*not normal*/

proc contents data=fats.testmerge position;
run;

/*log transform outcome vars*/
data fats.testmerge;
    set fats.testmerge;



    logOutcome3=log(RATIO_INDEX_IR);

    logOutcome4=log(Outcome4);

RUN;

proc univariate data=fats.testmerge plots normal;
    id sid;
run;

/*log transformation ok for igi/ir with outlier included*/

/*Outcome3 outlier*/
data exclude;
    set fats.testmerge;
    if sid=1354 then delete;
run;

proc univariate data=exclude plots normal;
    id sid;
    var logOutcome3;
run;


proc freq data=fats.testmerge;
    tables q07a;
run;

data fats.testmerge;
    set fats.testmerge;

    if q07a=2 then smokingcurr=1;
    else if q07a=1 OR q07a=3 then smokingcurr=0;
run;

proc freq data=fats.testmerge;
    tables smokingcurr;
run;


proc freq data=fats.testmerge;
    tables q12a;
run;

data fats.testmerge;
    set fats.testmerge;
    if q12a>=4 then highalcohol=1;
    else if q12a=1 or q12a=2 or q12a=3 then highalcohol=0;
run;

proc freq data=fats.testmerge;
    tables highalcohol;
run;


data test;
    set fats.testmerge;
    logFAPERCENTExp3=log(PERCENT_Exp3);
run;

proc univariate data=test plots normal ;
    var logFAPERCENTExp3;
run;
 /*more normal but one outlier when log transformed*/
/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;



proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp3;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory omega3suppl;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5 omega3suppl/solution CLPARM;
run;


/*dhq data for Exp3 intake fa_20_5 - - not normal*/
proc univariate data=fats.testmerge plots normal;
    var fa_20_5;
run;


/*MULTIPLE LINEAR REGRESSION FOR %Exp4 IN NEFA POOL*/ 
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp4;
run;


/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp4;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;

/*note: even log transforming PERCENT_Exp4 still results in non significant findings*/
proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp4;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp4;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5/solution CLPARM;
run;




/*MULTIPLE LINEAR REGRESSION FOR %Exp2 IN NEFA POOL*/  
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp2;
run;
 /*not normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp2;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp2;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp2;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp2 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp2 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


/*MULTIPLE LINEAR REGRESSION FOR %Exp1 IN NEFA POOL*/   
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp1;
run;
 /*not normal*/
data test;
    set fats.testmerge;
    logExp1percentFA=log(PERCENT_Exp1);
run;

proc univariate data=test plots normal;
    var logExp1percentFA;
run;
 /*more normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp1;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp1 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp1;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp1 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp1;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp1 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp1 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;



/*MULTIPLE LINEAR REGRESSION FOR %TOTAL N-3 PUFA IN NEFA POOL*/   
proc univariate data=fats.testmerge plots normal;
run;
 /*not normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
run;

proc glm data=exclude;
    class sex ethnicity;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;



/*MULTIPLE LINEAR REGRESSION FOR %Exp3 IN TG POOL*/   
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp3;
run;
 /*not normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp3;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;



/*MULTIPLE LINEAR REGRESSION FOR %Exp3 IN PHOSPHOLIPIDS POOL*/   
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp3;
run;
 /*not normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp3;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;



/*MULTIPLE LINEAR REGRESSION FOR %Exp3 IN CHOLESTEROL ESTERS POOL*/   
proc univariate data=fats.testmerge plots normal;
    var PERCENT_Exp3;
run;
 /*not normal*/

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp3;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc univariate data=fats.testmerge plots normal;
    var logOutcome4;
run;
 /*13 missing*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


/*MULTIPLE LINEAR REGRESSION FOR total fa (conc) in the NEFA POOL*/
proc univariate data=fats.testmerge plots normal;
    var totalfa;
run;


/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=totalfa;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=totalfa sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=totalfa;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=totalfa sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat fa_20_5/solution CLPARM;
run;


/*Outcome4*/
proc univariate data=fats.testmerge plots normal;
    var logOutcome4;
run;
 /*13 missing*/
proc glm data=fats.testmerge;
    model logOutcome4=totalfa;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=totalfa sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=totalfa sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;




/****MULTIPLE LINEAR REGRESSION ANALYSIS USING Exp3 CONCENTRATION IN NEFA POOL****/
    
    ods output "Parameter Estimates"='C:\Users\User\Documents\SAS\FattyAcids\regressiontest.rtf';

proc glm data=fats.testmerge;

    model logOutcome2=Exp3;
run;

run;

quit;

ods output close;


ods trace on /listing;

proc glm data=fats.testmerge;

    model logOutcome2=Exp3;
run;

run;

quit;

ods trace off;


ods output 'Parameter Estimates'=testoutput;

proc glm data=fats.testmerge;

    model logOutcome2=Exp3;
run;

quit;

ods output close;


ods output ParameterEstimates=fats.Parms;

proc glm data=fats.testmerge;

    model logOutcome2=Exp3;
run;

quit;

ods output close;

proc print data=fats.parms;
    run

        ods rtf file='C:\Users\User\Documents\SAS\FattyAcids\regressiontest.rtf';

proc glm data=fats.testmerge;

    model logOutcome2=Exp3;
run;

quit;

ods rtf close;


ods output ParameterEstimates=work.Parmstest;

/*Outcome2*/
proc glm data=fats.testmerge;
    model logOutcome2=Exp3;
run;


ods output ParameterEstimates=work.Parmstest;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=Exp3 sex ethnicity age /solution CLPARM ;
run ;

ods output close;

proc print data=work.Parmstest;
run;


proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory waist kcal fat/solution CLPARM;
run;

/*ns when bmi replaced with waist;
still significant when iliac crest replaces bmi*/

proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/

data exclude;
    set fats.testmerge;
    if sid=1354 then delete;
run;

proc glm data=exclude;
    model logOutcome3=Exp3;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=Exp3;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=Exp3 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=Exp3 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;






/*MULTPLE LINEAR REGRESSION ANALYSIS FOR PERCENT Exp4 IN NEFA - ALL NOT SIGNIFICANT*/

/*Outcome2*/
proc glm data=fats.testmerge;
    class model logOutcome2=PERCENT_Exp4;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age /solution CLPARM ;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome2=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


proc glm data=fats.testmerge;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
run;


/*Outcome3*/
proc glm data=exclude;
    model logOutcome3=PERCENT_Exp4;
run;

proc glm data=exclude;
    class sex ethnicity;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=exclude;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome3=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;


/*Outcome4*/
proc glm data=fats.testmerge;
    model logOutcome4=PERCENT_Exp4;
run;

proc glm data=fats.testmerge;
    class sex ethnicity;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI/solution CLPARM;
run;

proc glm data=fats.testmerge;
    class sex ethnicity smokingcurr highalcohol famhistory;
    model logOutcome4=PERCENT_Exp4 sex ethnicity age smokingcurr highalcohol totExp1ctivity famhistory BMI kcal fat/solution CLPARM;
run;



/*IMPORT MEDS*/
PROC IMPORT OUT= FATS.T121MED 
    DATATABLE= "t121 Med" 
    DBMS=ACCESS REPLACE;

    
    SCANMEMO=YES;

    USEDATE=NO;

    SCANTIME=YES;

RUN;

PROC EXPORT DATA= FATS.T121MED 
    OUTFILE= "C:\Users\User\Documents\SAS\FattyAcids\t121meds.xls" 
    DBMS=EXCEL REPLACE;

    SHEET="sas";
    
RUN;

/*to get screeningdate*/
PROC IMPORT OUT= FATS.copyoft010 
    DATATABLE= "Copy Of t010" 
    DBMS=ACCESS REPLACE;

    
    SCANMEMO=YES;

    USEDATE=NO;

    SCANTIME=YES;

RUN;

/*IMPORTING EXCEL MEDS FILE*/
PROC IMPORT OUT= FATS.T121MEDCATEGORY 
    DATAFILE= "C:\Users\User\Documents\SAS\FattyAcids\t121meds
    .xls" 
    DBMS=EXCEL REPLACE;

    RANGE="sas$";
    
    GETNAMES=YES;

    MIXED=NO;

    SCANTEXT=YES;

    USEDATE=YES;

    SCANTIME=YES;

RUN;

proc transpose data=FATS.T121MEDCATEGORY out=FATS.meds_transposed prefix=meds;

    by SID;

    var MedCategory;

run;

data fats.testmerge;
    set fats.testmerge;
    
    drop _name_ _label_ meds1-meds26;
run;

data screendate;
    set fats.testmerge;

    keep SID date;
run;
proc print;
run;

data fats.medsmerge;
    merge screendate fats.t121medcategory;
    by sid;
run;



data calcmeds;
    set fats.medsmerge;
    
    if (StartDate<=date AND StopDate > date) OR (StartDate<=date AND StopDate="") 
        then medsbaseline=1;
    else medsbaseline=0;
run;

proc print data=calcmeds;
    var SID medsbaseline date StartDate StopDate;
run;

proc freq data=calcmeds;
    tables medsbaseline;
run;

data calcmeds;
    set calcmeds;
    if medsbaseline ne 1 then delete;
run;


proc transpose data=calcmeds out=fats.meds_transposed prefix=meds;

    by SID;

    var MedCategory;

run;

data FATS.TESTTRANSPOSEMERGE;
    merge FATS.TESTMERGE fats.meds_transposed;
    by SID;
run;

data FATS.TESTTRANSPOSEMERGE;
    set FATS.TESTTRANSPOSEMERGE;
    IF SFA140="" THEN DELETE;
run;


/*GO TO MEDICATION CODE FILE*/

/*creating a omega-3 supplement variable*/
data fats.testmerge;

    set fats.testmerge;

    if omega3_take=1 OR flax_take=1 OR omega369_take=1 OR fishoil_take=1 then omega3suppl=1;
    
    else if omega3_take=0 AND flax_take=0 AND omega369_take=0 AND fishoil_take=0 then omega3suppl=0;
    
run;

proc freq data=fats.testmerge;
    tables omega3suppl;
run;

/*n=51 taking omega3 supplements*/
