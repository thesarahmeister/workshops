
proc export data=sashelp.fish
    outfile="data/fish.csv"
    dbms=csv
    replace;
run;

data playing;
    set sashelp.fish;
run;

proc print data=playing;
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
