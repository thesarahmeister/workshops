/**

    SAS ODS practice code
    
    */

proc contents data=sashelp.fish short;
run;

ods trace on;
proc means data=sashelp.fish stackods;
    ods output Summary = meansDS;
run;
ods trace off;

proc print data=meansDS;
run;

data meansDS (drop=Mean StdDev);
    set meansDS;
    rawMeanSD = Mean||' ('||
        StdDev||')';
    roundMeanSD = round(Mean, 0.01)||' ('||
        round(StdDev, 0.01)||')';
    striproundMeanSD = round(Mean, 0.01)||' ('||
        strip(round(StdDev, 0.01))||')';
run;

proc print data=meansDS;
run;

/**
proc export data=meansDS
    dbms = csv
    outfile = 'means.csv'
    replace;
run;
*/

/** ANOVA */
ods listing close;
ods trace on;
proc glm data=sashelp.fish;
    class Species ;
    model Height = Species / ss3;
    lsmeans Species / adjust=tukey pdiff;

    * Output the results;
    ods output Diff=diffFish ModelANOVA=modelFish;
run;
ods trace off;
ods listing;

proc print data=modelFish;
run;

/** Linear Regression */
ods listing close;
ods trace on;
proc glm data=sashelp.fish;
    class Species;
    model Height = Length1 Species / solution;
    ods output ParameterEstimates = betas;
run;
ods trace off;
ods listing;

proc print data=betas;
run;

data betas;
    set betas;
    betaSE = round(Estimate, 0.01)||' ('||
        strip(round(StdErr, 0.01))||')';
    keep Dependent Parameter betaSE Probt;
run;

proc print data=betas;
run;
