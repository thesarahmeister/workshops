
%macro means(var, outdata=, data=, class=, where=);
    ods listing close;
    proc means data=&data stackods;
        class &class;
        where &where;
        var &var;
        ods output Summary = &outdata;
    run;
    ods listing;

    /** Combining Mean and SD together as one variable */
    data &outdata;
        set &outdata;
        meanSD = round(Mean, 0.01) || ' (' ||
            strip(round(StdDev, 0.01)) || ')';
        keep Variable N meanSD;
    run;

    /** Output new dataset */
    proc print data=&outdata;
    run;
    %mend means;
