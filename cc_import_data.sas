%let data_path=/ordsrv3/OR_CENTER/FILES/Cleveland Clinic/Customer_Input/05052020;

/* Point to ordsrv3 cc library */
libname ccin "&data_path.";

cas mysess;
/* cas mysess sessopts=(nworkers=2); */
caslib _all_ assign;


proc casutil;
/* 	load file="&data_path./Input_Opt_Parameters.csv" casout="Input_Opt_Parameters" replace;   */
/*     droptable casdata="Input_Opt_Parameters" incaslib="cc" quiet; */
/* 	promote casdata="Input_Opt_Parameters" outcaslib="cc" incaslib="casuser" drop;   */

/* 	load file="&data_path./Input_Utilization.csv" casout="Input_Utilization" replace;  */
/*     droptable casdata="Input_Utilization" incaslib="cc" quiet; */
/* 	promote casdata="Input_Utilization" outcaslib="cc" incaslib="casuser" drop;   */

/* 	load file="&data_path./Input_Service_Attributes.csv" casout="Input_Service_Attributes" replace;     */
/*     droptable casdata="Input_Service_Attributes" incaslib="cc" quiet; */
/* 	promote casdata="Input_Service_Attributes" outcaslib="cc" incaslib="casuser" drop;   */
 
	load file="&data_path./Input_Demand.csv" casout="Input_Demand" replace;   
    droptable casdata="Input_Demand" incaslib="cc" quiet; run;
	promote casdata="Input_Demand" outcaslib="cc" incaslib="casuser" drop;  
/*  */
/* 	load file="&data_path./Input_Financials.csv" casout="Input_Financials" replace;    */
/*     droptable casdata="Input_Financials" incaslib="cc" quiet; */
/* 	promote casdata="Input_Financials" outcaslib="cc" incaslib="casuser" drop;   */
/*  */
/* 	load file="&data_path./Input_Capacity.csv" casout="Input_Capacity" replace;  */
/*     droptable casdata="Input_Capacity" incaslib="cc" quiet; */
/* 	promote casdata="Input_Capacity" outcaslib="cc" incaslib="casuser" drop;                    */
quit;

/* Fix date */
data cc.input_demand;
set cc.input_demand (rename = (date=datechar1));
date=input(datechar1,MMDDYY10.);
run;

