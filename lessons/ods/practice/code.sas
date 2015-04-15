/**

    SAS ODS practice code
    
    */

proc contents data=sashelp.fish;
run;

ods trace on;
proc means data=sashelp.fish stackods;
    ods output Summary = meansDS;
run;
ods trace off;

proc print data=meansDS;
run;

ods trace on;
proc glm data=sashelp.fish;
    class Species ;
    model Height = Species / ss3;
    lsmeans Species / adjust=tukey pdiff;

    * Output the results;
    ods output Diff=diffFish ModelANOVA=modelFish;
run;
ods trace off;

proc print data=modelFish;
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

proc export data=meansDS
    dbms = csv
    outfile = 'means.csv'
    replace;
run;
