/**
    SAS code showing the use of a simple macro
    */

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

