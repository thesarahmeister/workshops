;
options nodate nonumber nocenter formdlim="";
title '';

%include 'macros.sas';

%macro glm(y, x, ccovar=, dcovar=, outdata=, data=);
    %local i j count;
    %let count = 0;
    %do i = 1 %to %sysfunc(countw(&y));
        %let yvar = %scan(&y, &i);
        %do j = 1 %to %sysfunc(countw(&x));
            %let count = %eval(&count + 1);
            %let xvar = %scan(&x, &j);
            ods listing close;
            proc glm data=&data;
                class &dcovar;
                model &yvar = &xvar &dcovar &ccovar / solution clparm;
                ods output ParameterEstimates = beta&count;
            run;
            ods listing;
            
            data beta&count;
                set beta&count;
                betaCI = trim(round(Estimate, 0.01))||' ('||
                    strip(round(LowerCL, 0.01)) || ' to ' ||
                    strip(round(StdErr, 0.01)) || ')';
                if Parameter = "&xvar" then output;
                else delete;
                keep Dependent Parameter betaCI;
            run;
            %end;
        %end;

    data &outdata;
        set beta1-beta&count;
    proc print data=&outdata;
    run;
    %mend glm;


%glm(Height Length1, Weight Length2 Length3,
    outdata = betas, data = sashelp.fish);
