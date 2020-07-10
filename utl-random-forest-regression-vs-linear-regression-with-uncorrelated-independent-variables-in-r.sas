                                                                                                                                                             
Random forest regression vs linerar regression with uncorrelated independent variables in r                                                                  
                                                                                                                                                             
github                                                                                                                                                       
https://tinyurl.com/y8ves3nl                                                                                                                                 
https://github.com/rogerjdeangelis/utl-random-forest-regression-vs-linear-regression-with-uncorrelated-independent-variables-in-r                            
                                                                                                                                                             
This is primarily an academic exercise.                                                                                                                      
The decision trees are very complex in this case, although it did  pass validation.                                                                          
Very sensitive to the independent variable space?                                                                                                            
                                                                                                                                                             
                                                                                                                                                             
  INPUT ANALYSIS                                                                                                                                             
                                                                                                                                                             
    d:/sd1/have.sas7bdat              https://tinyurl.com/y9fj4hq6    Input SAS Table                                                                        
    d:/pdf/gridplot.pdf               https://tinyurl.com/yczv7ztd    Matrix of histograms and scatter plots of input                                        
    d:/pdf/mds.pdf                    https://tinyurl.com/y83gnzdf    Multi-dimensional scaling of input table first 2 dimensions                            
    d:/pdf/regplots.pdf               https://tinyurl.com/y9sld6c7    Linear regression Fit statistics and plots of input data                               
                                                                                                                                                             
  RANDOM FOREST ANALYSIS                                                                                                                                     
                                                                                                                                                             
    d:/txt/regsummary.txt             https://tinyurl.com/y9pc2skx    Random Forest summary of training fit                                                  
    d:/txt/regmeta.txt                https://tinyurl.com/y8ulrkwm    Proc contents of all the Random Forest output objects (list)                           
    d:/txt/gettree.txt                https://tinyurl.com/ya6yxo8f    Splits and Income predictions for entire 1st decision tree                             
    d:/txt/top_of_simplegettree.txt   https://tinyurl.com/yba9ydyj    Splits and Income predictions for first 6 nodes of first tree                          
                                                                                                                                                             
    d:/pdf/regerr.pdf                 https://tinyurl.com/yaw7ad5j    Plot of MSE error versus tree number                                                   
    d:/pdf/important.pdf              https://tinyurl.com/y9rdzhcx    Importance Plots (very difficult to explain?)                                          
    d:/pdf/top_of_decisiontree.pdf    https://tinyurl.com/ybcz6hr5    Plot of first 6 nodes of first decision tree                                           
    d:/pdf/decisiontree.pdf           https://tinyurl.com/ybvecmfn    Plot of all nodes for first decision tree (eye opening)                                
                                                                                                                                                             
  SAS TABLES FROM R SCRIPT                                                                                                                                   
                                                                                                                                                             
    d:/wrk/imp.sas7bdat               https://tinyurl.com/y72fkql5    Input data for importance plots                                                        
    d:/wrk/msereq.sas7bdat            https://tinyurl.com/yba45u6u    MSE versus tree number                                                                 
    d:/wrk/train.sas7bdat             https://tinyurl.com/ybs3mp7x    Training Table with predicted income and residuals                                     
    d:/wrk/holdout.sas7bdat           https://tinyurl.com/y85nust5    Holdout Table with predicted income and residuals                                      
                                                                                                                                                             
                                                                                                                                                             
This is primarily an academic exercise.                                                                                                                      
The decision trees are very complex in this case, although it did  pass validation.                                                                          
Very sensitive to the independent variable space?                                                                                                            
                                                                                                                                                             
As a side note I could not get tidypredict to create the SQL code from a single tree.                                                                        
This is not a big deal because there is very little use for a single tree.                                                                                   
I like to do these just to get a feel of the trees that are generated.                                                                                       
                                                                                                                                                             
Important points                                                                                                                                             
"It is a well known fact that trees are ill-suited to model truly linear relationship."                                                                      
https://stats.stackexchange.com/users/6929/markus-loecher                                                                                                    
                                                                                                                                                             
"It is also known that you can not extrapolate a randomforest model"                                                                                         
                                                                                                                                                             
Perhaps random forest is best for more complex relationships where model response                                                                            
is different over subdomains of the independent variable space?                                                                                              
                                                                                                                                                             
What you need to know about a randomforest of trees before you start.                                                                                        
====================================================================                                                                                         
                                                                                                                                                             
Unlike CART, Logistic, and most models, randomforest does not provide insight into                                                                           
your data. It is primarily a black box with bootstrapping and randomly selected and averaged                                                                 
variables and subsets of the data. It often 'averages' 1,000 pf decision trees.                                                                              
                                                                                                                                                             
Roger DeAngelis                                                                                                                                              
                                                                                                                                                             
"Trees in RF and single trees are built using the same algorithm (usually CART).                                                                             
The only minor difference is that a single tree tries all predictors at each split,                                                                          
whereas trees in RF only try a random subset of the predictors at each split                                                                                 
(this creates independent trees). Also, each tree in a RF is built on a bootstrap                                                                            
sample of the training data, rather than on the full training                                                                                                
data set. This makes each tree in the forest an expert on                                                                                                    
some domains of the data space, and bad elsewhere.                                                                                                           
                                                                                                                                                             
So, for these reasons, it makes no sense to extract a single tree                                                                                            
from a Random Forest in order to use it as a classifier. Depending on its domains of expertise,                                                              
it could give you better results than a traditional tree built with CART on the full dataset,                                                                
or much worse. The thing that allows a RF to be much better than a single tree is that                                                                       
it grows many decorrelated trees and averages their output. Only when the committee                                                                          
of ensemble of trees has enough members (usually between 200 and 2000) is variance reduced.                                                                  
But individually, each tree of a RF would be weaker than a single tree built via traditional CART."                                                          
                                                                                                                                                             
Antoine                                                                                                                                                      
https://tinyurl.com/y9uznf5s                                                                                                                                 
https://stats.stackexchange.com/users/71672/antoine                                                                                                          
                                                                                                                                                             
Comparison of R, Python and SAS for Randomforest                                                                                                             
https://digitalcommons.usu.edu/cgi/viewcontent.cgi?article=2295&context=gradreports                                                                          
                                                                                                                                                             
                                                                                                                                                             
  Method (R)                                                                                                                                                 
                                                                                                                                                             
     1. Split the  data into a training and holdout sample,                                                                                                  
        70% training and 30% holdout                                                                                                                         
                                                                                                                                                             
        We will build the random forest model using the training data and                                                                                    
        then apply the model to the holdout sample(verification data).                                                                                       
                                                                                                                                                             
        We also run a multiple linear regression  model using the training data and                                                                          
        then apply the model to the holdout sample(verification data).                                                                                       
                                                                                                                                                             
     2. 100 decision trees will be generated. We will use mean square error(MSE) to split the tree nodes                                                     
        randomly using 2 of the six variables at each split.                                                                                                 
        instead of binary Kolmogorov-Smirnov criterion used for classification?.                                                                             
                                                                                                                                                             
     3. Do over trees                                                                                                                                        
        Generate a bootstrap sample from the training data                                                                                                   
        create a decision tree using the bootstrapped data                                                                                                   
        for each split select 2 variables at random                                                                                                          
        pick the best variable based on best reduction in the residual sum of squares                                                                        
        and split then node.                                                                                                                                 
        use defualt stopping criteria                                                                                                                        
        repeat                                                                                                                                               
                                                                                                                                                             
     4. Validate by applying the model developed using the training data to                                                                                  
        the holdout sample                                                                                                                                   
                                                                                                                                                             
     5. Compare regression output to the randomforest output.                                                                                                
        Note we applied a training model equation to the holdout sample for the regression method.                                                           
                                                                                                                                                             
/*                                    _                                                                                                                      
  ___ ___  _ __ ___  _ __   __ _ _ __(_)___  ___  _ __                                                                                                       
 / __/ _ \| `_ ` _ \| `_ \ / _` | `__| / __|/ _ \| `_ \                                                                                                      
| (_| (_) | | | | | | |_) | (_| | |  | \__ \ (_) | | | |                                                                                                     
 \___\___/|_| |_| |_| .__/ \__,_|_|  |_|___/\___/|_| |_|                                                                                                     
                    |_|                                                                                                                                      
*/                                                                                                                                                           
Comparison of RandomForest Regression and Linear Regression (Regression outperforms randomforest)                                                            
                                                                                                                                                             
Considering that randomforest is more flexible, it did quite well against the linear model.                                                                  
                                                                                                                                                             
  These Mean square errors are different from the MSE computed based on average of an ensemble of decision trees.                                            
                                                                                                                                                             
   INPUT MODEL                                                                                                                                               
                                                                                                                                                             
     age       = sin(rad)                                                                                                                                    
     famsize   = 2*sin(2*rad)                                                                                                                                
     homeval   = 3*sin(3*rad)                                                                                                                                
     educ      = cos(rad)                                                                                                                                    
     homesize  = 2*cos(2*rad)                                                                                                                                
     skill     = 3*cos(3*rad)                                                                                                                                
     income    = age + famsize + homeval + educ + skill + homesize + rand("normal",0,1)                                                                      
                                                                                                                                                             
                                                                                                  Holdout                                                    
                                                                    FROM PROC REG                 Mean RSS*                                                  
                                                          ==================================      =========                                                  
   RANDOM FOREST                                          Obs   Rsquare       MSE      Slope      MSE                                                        
   =============                                                                                                                                             
       Apply training model decision trees                187    0.9229     1.10775   0.90466     1.2427*  Mean                                              
       to holdout sample and running a linear regression                                                   Residual                                          
       on rf_holdoutprediction = income                                                                    Sum of Squares                                    
                                                                                                                                                             
   REGRESSION (PROC REG)                                                                                                                                     
   =====================                                                                                                                                     
     Apply regression equation from training              187    0.9338     0.98815   0.92739                                                                
     to holdout (proc score)                                                                                                                                 
                                                                                                                                                             
                                                                                                                                                             
                     Residual Frequencies                                                                                                                    
                                                                                                                                                             
           -40       -20        0        20        40                                                                                                        
         ---+---------+---------+---------+---------+--                                                                                                      
     BIN |                      |                      |                                                                                                     
     4.5 +     Random Forest   X|X   Regression        +  4.5                                                                                                
     4.0 +     Rediduals      XX|XX  Residuals         +  4.0                                                                                                
     3.5 +                   XXX|XX                    +  3.5                                                                                                
     3.0 +                  XXXX|XXX                   +  3.0                                                                                                
 R   2.5 +               XXXXXXX|XXXX                  +  2.5  R                                                                                             
 E   2.0 +              XXXXXXXX|XXXXXX                +  2.0  E                                                                                             
 S   1.5 +               XXXXXXX|XXXXXXXXXXXX          +  1.5  S                                                                                             
 I   1.0 +              XXXXXXXX|XXXXXXXXXXXXX         +  1.0  I                                                                                             
 D   0.5 +             XXXXXXXXX|XXXXXXXXXXXXXX        +  0.5  D                                                                                             
 U   0.0 +          XXXXXXXXXXXX|XXXXXXXXXXXXx         +  0.0  U                                                                                             
 A  -0.5 +              XXXXXXXX|XXXXXXXXXXXX          + -0.5  A                                                                                             
 L  -1.0 +            XXXXXXXXXX|XXXXXXXXX             + -1.0  L                                                                                             
    -1.5 +              XXXXXXXX|XXXXXXX               + -1.5                                                                                                
    -2.0 +                  XXXX|XXXXXX                + -2.0                                                                                                
    -2.5 +                 XXXXX|XXX                   + -2.5                                                                                                
    -3.0 +                  XXXX|XXX                   + -3.0                                                                                                
    -3.5 +                   XXX|XX                    + -3.5                                                                                                
    -4.0 +                    XX|XX                    + -4.0                                                                                                
    -4.5 +                   XXX|                      + -4.5                                                                                                
    -5.0 +                      |                      + -5.0                                                                                                
    -5.5 +                     X|XX                    + -5.5                                                                                                
    -6.0 +                     X|                      + -6.0                                                                                                
         |                      |                      |                                                                                                     
         ---+---------+---------+---------+---------+--                                                                                                      
           -40       -20        0        20        40                                                                                                        
                                                                                                                                                             
                            Frequency                                                                                                                        
                                                                                                                                                             
                                                                                                                                                             
This is a very special case, where all the independent variables are theoretically uncorrelated.                                                             
A normal error is introduced. We would like our indepenedent variables to be uncorrelated.                                                                   
                                                                                                                                                             
 Correlations                                                                                                                                                
                                                                                                                                                             
                 AGE  FAMSIZE  HOMEVAL  EDUC   SKILL  HOMESIZE                                                                                               
                                                                                                                                                             
   AGE            1      0       0       0       0       0                                                                                                   
   FAMSIZE        0      1       0       0       0       0                                                                                                   
   HOMEVAL        0      0       1       0       0       0                                                                                                   
   EDUC           0      0       0       1       0       0                                                                                                   
   SKILL          0      0       0       0       1       0                                                                                                   
   HOMESIZE       0      0       0       0       0       1                                                                                                   
                                                                                                                                                             
 MODEL                                                                                                                                                       
                                                                                                                                                             
   AGE       =sin(rad);                                                                                                                                      
   FAMSIZE   =2*sin(2*rad);                                                                                                                                  
   HOMEVAL   =3*sin(3*rad);                                                                                                                                  
   EDUC      =cos(rad);                                                                                                                                      
   HOMESIZE  =2*cos(2*rad);                                                                                                                                  
   SKILL     =3*cos(3*rad);                                                                                                                                  
   INCOME    =age+famsize+homeval+educ+skill+homesize +rand("normal",0,1) ;                                                                                  
                                                                                                                                                             
                                                                                                                                                             
All Four type os Sum of Squares are the same.                                                                                                                
                                                                                                                                                             
Sums of squares are mutually exclusive.                                                                                                                      
                                                                                                                                                             
All four sum of square types are the same.                                                                                                                   
                                                                                                                                                             
Source      DF       Type I SS    Type II SS  Type III SS   Type IV SS                                                                                       
                                                                                                                                                             
AGE          1      275.236231    275.248649   275.248649   275.248649                                                                                       
FAMSIZE      1     1319.241838   1319.296171  1319.296171  1319.296171                                                                                       
HOMEVAL      1     2773.071109   2773.189061  2773.189061  2773.189061                                                                                       
EDUC         1      342.843887    335.675194   335.675194   335.675194                                                                                       
SKILL        1     2926.550314   2918.152237  2918.152237  2918.152237                                                                                       
HOMESIZE     1     1291.969962   1291.969962  1291.969962  1291.969962                                                                                       
                                                                                                                                                             
/*                   _                                                                                                                                       
(_)_ __  _ __  _   _| |_                                                                                                                                     
| | `_ \| `_ \| | | | __|                                                                                                                                    
| | | | | |_) | |_| | |_                                                                                                                                     
|_|_| |_| .__/ \__,_|\__|                                                                                                                                    
        |_|                                                                                                                                                  
*/                                                                                                                                                           
                                                                                                                                                             
                                                                                                                                                             
options ls=171 ps=65;                                                                                                                                        
libname sd1 "d:/sd1";                                                                                                                                        
                                                                                                                                                             
data sd1.have;                                                                                                                                               
   call streaminit(12387);                                                                                                                                   
   do rad=0 to 2*constant('pi') by .01;                                                                                                                      
      age       =sin(rad);                                                                                                                                   
      famsize   =2*sin(2*rad);                                                                                                                               
      homeval   =3*sin(3*rad);                                                                                                                               
      educ      =cos(rad);                                                                                                                                   
      homesize  =2*cos(2*rad);                                                                                                                               
      skill     =3*cos( 3*rad);                                                                                                                              
      income    =age+famsize+homeval+educ+skill+homesize +rand("normal",0,1) ;                                                                               
      output;                                                                                                                                                
   end;                                                                                                                                                      
   drop rad;                                                                                                                                                 
run;quit;                                                                                                                                                    
                                                                                                                                                             
                                                                                                                                                             
options ls=171 ps=72;                                                                                                                                        
proc corr data=sd1.have;                                                                                                                                     
var age famsize homeval educ skill homesize ;                                                                                                                
with age famsize homeval educ skill homesize;                                                                                                                
run;quit;                                                                                                                                                    
                                                                                                                                                             
options orientation=landscape;                                                                                                                               
ods graphics on / reset width=10in height=8in;                                                                                                               
ODS pdf file="d:/pdf/gridplot.pdf";                                                                                                                          
                                                                                                                                                             
title1 "Uncorrelated Independent Variables";                                                                                                                 
proc sgscatter data=sd1.have;                                                                                                                                
matrix age famsize homeval educ homesize skill income /                                                                                                      
diagonal=(histogram kernel);                                                                                                                                 
run;                                                                                                                                                         
ods pdf close;                                                                                                                                               
ods graphics off;                                                                                                                                            
                                                                                                                                                             
options orientation=landscape;                                                                                                                               
ods graphics on / reset width=10in height=8in;                                                                                                               
ODS pdf file="d:/pdf/corplot.pdf";                                                                                                                           
                                                                                                                                                             
ods trace on;                                                                                                                                                
options orientation=landscape;                                                                                                                               
ods graphics on / reset width=10in height=8in ;                                                                                                              
ODS pdf file="d:/pdf/regplots.pdf";                                                                                                                          
proc reg data=sd1.have plots=all;                                                                                                                            
title1 "Uncorrelated Independent Variables";                                                                                                                 
ods exclude nobs;                                                                                                                                            
ods exclude anova;                                                                                                                                           
ods exclude fitstatistics;                                                                                                                                   
ods exclude ParameterEstimates;                                                                                                                              
ods exclude all;                                                                                                                                             
 ods select DiAgNoStIcSPAnel;                                                                                                                                
 model income = age famsize homeval educ skill homesize ;                                                                                                    
run;quit;                                                                                                                                                    
ods pdf close;                                                                                                                                               
ods graphics off;                                                                                                                                            
ods trace off;                                                                                                                                               
                                                                                                                                                             
/*                                                                                                                                                           
                                                                                                                                                             
https://tinyurl.com/yczv7ztd                                                                                                                                 
                                                                                                                                                             
                    AGE                         EDUC                      SKILL                                                                              
          ------------------------------------------------------- ---------------------------                                                                
         |             ##            ||                          ||                          |                                                               
         |             ##            ||                          ||                          |                                                               
         |             ##            ||           + +            ||           + +            |                                                               
         |          ## ##            ||        + +   +           ||        + +   +           |                                                               
  AGE    |          ## ##            ||  +  +++++++ +         x  ||  +  +++++++ +         x  |  ...                                                          
         |          ## ## ##         ||+ +++ +++ +    .. xxx. x  ||+ +++ +++ +    .. xxx. x  |                                                               
         |          ## ## ##         ||+ + +++   . .. x..xxx xxx ||+ + +++   . .. x..xxx xxx |                                                               
         |       ## ## ## ## ##      ||     x ..  .x.x .xx.     x||     x ..  .x.x .xx.     x|                                                               
         |       ## ## ## ## ##      || +   ..    .    .         || +   ..    .    .         |                                                               
         |    ## ## ## ## ## ## ##   ||      .                   ||      .                   |                                                               
         ------------------------------------------------------------------------------------                                                                
         |                           |||                         ||                                                                                          
         |                           |||                         ||                                                                                          
         |                           |||       ##                ||                                                                                          
         |  +   +                    |||       ## ## ##          ||                                                                                          
  EDUC   |+ +   +                    |||       ## ## ##          ||                             ...                                                          
         |+ + + +                   x|||       ## ## ## ##       ||      ...                                                                                 
         |  + + + +         . . .   .|||       ## ## ## ##       ||                                                                                          
         |+ + +      . . . . x . x  x|||       #### ## ## ##     ||                                                                                          
         |     . . . . x x . x x x xx|||       ## ## ## ## ##    ||                                                                                          
         |  +  . .   .   .           |||    ## ## ## ## ## ## ## ||                                                                                          
          ---------------------------------------------------------                                                                                          
                                                                                                                                                             
               ...                               ...                     ...                    ...                                                          
*/                                                                                                                                                           
                                                                                                                                                             
                                                                                                                                                             
%utl_submit_r64(resolve('                                                                                                                                    
library(haven);                                                                                                                                              
library(SASxport);                                                                                                                                           
library(data.table);                                                                                                                                         
have<-read_sas("d:/sd1/have.sas7bdat");                                                                                                                      
head(have);                                                                                                                                                  
have$INCOME<-as.factor(have$INCOME);                                                                                                                         
haveDist <- dist(have[,1:6]);                                                                                                                                
haveMds = cmdscale(haveDist, k=2);                                                                                                                           
str(haveMds);                                                                                                                                                
pdf(file="d:/pdf/mds.pdf");                                                                                                                                  
plot(haveMds);                                                                                                                                               
/* text(haveMds[,1], (haveMds[,2]+max(haveMds[,2])*0.05), labels=1:nrow(haveMds), cex = 0.4, xpd = TRUE);*/                                                  
/* points(irisMds, col=c("red", "green", "blue")[as.numeric(iris$Species)]); */                                                                              
points(haveMds);                                                                                                                                             
pdf();                                                                                                                                                       
want<-as.data.table(haveMds);                                                                                                                                
write.xport(want,file="d:/xpt/want.xpt");                                                                                                                    
'));                                                                                                                                                         
                                                                                                                                                             
Because all the aplitudes are the same and the sinusoidal harmonics                                                                                          
of the input, the pairwise distances between points fall in                                                                                                  
a circle of -pi to pi?                                                                                                                                       
                                                                                                                                                             
Not very usefull here but I include it for more pracitical modeling.                                                                                         
This can give insight on variables                                                                                                                           
                                                                                                                                                             
https://tinyurl.com/y83gnzdf                                                                                                                                 
                                                                                                                                                             
DIM2    -3              0             +3                                                                                                                     
    + ----+--------------+--------------+----+                                                                                                               
    |                                       |                                                                                                                
    |                 ******                |                                                                                                                
  3 +            ******    ******           +  3                                                                                                             
    |         ***              ***          |                                                                                                                
    |       ***                  ***        |                                                                                                                
  2 +     ***                      ***      +  2                                                                                                             
    |    **       Reducing the       **     |                                                                                                                
    |   **      Dimensionality to     **    |                                                                                                                
  1 +   *         2 components?        **    +  1                                                                                                            
    |  **                              **   |                                                                                                                
    |  **                               *   |                                                                                                                
  0 +  *                                *   +  0                                                                                                             
    |  *                                *   |                                                                                                                
    |  **                              **   |                                                                                                                
 -1 +   *                              *    + -1                                                                                                             
    |   **                            **    |                                                                                                                
    |    **                          **     |                                                                                                                
 -2 +     ***                      ***      + -2                                                                                                             
    |       ***                  ***        |                                                                                                                
    |         ***              ***          |                                                                                                                
 -3 +           ******    ******            + -3                                                                                                             
    |                ******                 |                                                                                                                
    + ----+--------------+--------------+---+-                                                                                                               
        -3              0             +3                                                                                                                     
                   DIM1                                                                                                                                      
                                                                                                                                                             
/*           _               _                                                                                                                               
  ___  _   _| |_ _ __  _   _| |_                                                                                                                             
 / _ \| | | | __| `_ \| | | | __|                                                                                                                            
| (_) | |_| | |_| |_) | |_| | |_                                                                                                                             
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                                            
                |_|                                                                                                                                          
                                                                                                                                                             
IMPORTANCE                                                                                                                                                   
                                                                                                                                                             
WORK.IMP total obs=6                                                                                                                                         
                                                                                                                                                             
  V1          X_INCMSE    INCNODEP                                                                                                                           
                                                                                                                                                             
  AGE          14.2983      977.58                                                                                                                           
  FAMSIZE      16.8066     1054.19                                                                                                                           
  HOMEVAL      14.9854     1117.01                                                                                                                           
  EDUC         15.3265     1745.00                                                                                                                           
  HOMESIZE     10.5091      513.19                                                                                                                           
  SKILL        13.8359     1135.86                                                                                                                           
*/                                                                                                                                                           
                                                                                                                                                             
options ls=64 ps=32;                                                                                                                                         
proc plot data=imp;                                                                                                                                          
  plot v1*X_INCMSE='O'/ vaxis= "HOMESIZE" "SKILL " "AGE " "HOMEVAL " "EDUC "  "FAMSIZE " hpos=24 box;                                                        
  *haxis=10 to 17 by 1 box hpos=24;                                                                                                                          
  plot v1*INCNODEP ='O'/ vaxis= "HOMESIZE" "AGE " "FAMSIZE " "HOMEVAL " "SKILL " "EDUC " hpos=24 box;                                                        
  *haxis=10 to 17 by 1 box hpos=24;                                                                                                                          
run;quit;                                                                                                                                                    
                                                                                                                                                             
https://tinyurl.com/y9rdzhcx                                                                                                                                 
                                                                                                                                                             
  plot ind_var*pct_increase_MSE='O'/ vaxis= "HOMESIZE" "AGE " "FAMSIZE " "SKILL " "EDUC " "HOMEVAL "                                                         
                                                                                                                                                             
                                                                                                                                                             
                 PCT_INCREASE_MSE             INCREASE NODE PURITY                                                                                           
                                                                                                                                                             
           10.0   12.5   15.0   17.5       500   1000   1500   2000                                                                                          
           --+------+------+------+-      --+------+------+------+--                                                                                         
           |                        |     |                        |                                                                                         
  FAMSIZE  +                     o  +     +                     O  + HOMEVAL                                                                                 
           |                        |     |                        |                                                                                         
           |   Percent              |     |  Increase              |                                                                                         
           |   Increase             |     |  Node                  |                                                                                         
  EDUC     +   MSE             O    +     +  Purity         O      + EDUC                                                                                    
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
  HOMEVAL  +                O       +     +                O       + SKILL                                                                                   
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
  AGE      +              O         +     +              O         + FAMSIZE                                                                                 
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
  SKILL    +            O           +     +             O          + AGE                                                                                     
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
           |                        |     |                        |                                                                                         
  HOMESIZE +    O                   +     +   O                    + HOMESIZE                                                                                
           |                        |     |                        |                                                                                         
           --+------+------+------+--     --+------+------+------+--                                                                                         
           10.0   12.5   15.0   17.5       500   1000   1500   2000                                                                                          
                                                                                                                                                             
                PCT_INCREASE_MSE            INCREASE NODE PURITY                                                                                             
                                                                                                                                                             
For completely uncorrelated independent variables of equal amplitude, importance plots                                                                       
do not yeild useful information?                                                                                                                             
                                                                                                                                                             
However the PCT_INCREASE_MSE ranging from 11 to 17 seems very small and                                                                                      
may support the hypothesis that random noise is contributing to the                                                                                          
PCT_INCREASE_MSE? If you remove Homesize the range is 14-17.                                                                                                 
                                                                                                                                                             
INCREASE NODE PURITY                                                                                                                                         
                                                                                                                                                             
Measures the reduction in residual sums of squares                                                                                                           
before and after the split, summed ober all splits for that variable.                                                                                        
https://stats.stackexchange.com/users/4257/nick-sabbe                                                                                                        
                                                                                                                                                             
MSE OF TRAINING BASED ON 100 TREES                                                                                                                           
===================================                                                                                                                          
                                                                                                                                                             
DATA for MSE vs Trees                                                                                                                                        
                                                                                                                                                             
WORK.MSERSQ total obs=100                                                                                                                                    
                                                                                                                                                             
           MSE          RSQUARE                                                                                                                              
Obs    RF_TRAINMSE    RF_TRAINRSQ                                                                                                                            
                                                                                                                                                             
  1      2.65225        0.82140                                                                                                                              
  2      2.56710        0.82713                                                                                                                              
  3      2.81344        0.81054                                                                                                                              
  4      2.33962        0.84245                                                                                                                              
  5      2.12182        0.85712                                                                                                                              
 ..                                                                                                                                                          
 98      1.31484        0.91146                                                                                                                              
 99      1.31383        0.91153                                                                                                                              
100      1.31374        0.91153                                                                                                                              
                                                                                                                                                             
proc means data=WORK.MSERSQ;run;quit;                                                                                                                        
proc sql;select tree from msersq having round(RF_TRAINMSE,.01)=min(round(RF_TRAINMSE,.01));quit;                                                             
                                                                                                                                                             
options ls=80 ps=32;                                                                                                                                         
proc plot data=MSERSQ;                                                                                                                                       
  plot RF_TRAINMSE * tree='.' / hpos=50 haxis=0 to 100 by 10 href=97 vaxis=1.25  to 3 by .25 box;;                                                           
run;quit;                                                                                                                                                    
                                                                                                                                                             
d:/pdf/regerr.pdf                                                                                                                                            
                                                                                                                                                             
              0  10  20  30  40  50  60  70  80  90  100                                                                                                     
         -----+---+---+---+---+---+---+---+---+---+---+--                                                                                                    
  MSE    |                                              |                                                                                                    
    3.00 +             TRAINING                         + 3.00                                                                                               
         |        Mean Square Error MSE by Tree         |                                                                                                    
         |     .                                        |                                                                                                    
    2.75 +                                              + 2.75                                                                                               
         |     .                      MSE = 1.31 ===>|  |                                                                                                    
         |     .                      Close to min   |  |                                                                                                    
    2.50 +                            in 1st 100     |  + 2.50                                                                                               
         |                            trees          |  |                                                                                                    
         |     .                                     |  |                                                                                                    
    2.25 +                                           |  + 2.25                                                                                               
         |                                           |  |                                                                                                    
         |      .                                    |  |                                                                                                    
    2.00 +      .                                    |  + 2.00                                                                                               
         |                                           |  |                                                                                                    
         |                                           |  |                                                                                                    
    1.75 +       .                                   |  + 1.75                                                                                               
         |        .                                  |  |                                                                                                    
         |        ...                                |  |                                                                                                    
    1.50 +          ....                             |  + 1.50                                                                                               
         |             ............                  |  |                                                                                                    
         |                        ..................... |                                                                                                    
    1.25 +                                           |  + 1.25                                                                                               
         -----+---+---+---+---+---+---+---+---+---+---+--                                                                                                    
              0  10  20  30  40  50  60  70  80  90  100                                                                                                     
                           TREES                                                                                                                             
                                                                                                                                                             
MSE TRAINING MODEL                                                                                                                                           
==================================================                                                                                                           
                                                                                                                                                             
https://tinyurl.com/ybs3mp7x                                                                                                                                 
                                                                                                                                                             
 TRAINING                                                                                                                                                    
 ========                                                                                                                                                    
 WORK.TRAIN total obs=442                                                                                                                                    
                                                                                PREDICTED       RESIDUAL                                                     
     AGE      FAMSIZE    HOMEVAL      EDUC     HOMESIZE      SKILL      INCOME  RF_TRAINPRED  RF_TRAINRESIDUAL    RF_TRAINMSE                                
                                                                                                                                                             
   0.00000    0.00000    0.00000    1.00000     2.00000     3.00000     7.5194     5.97400        -1.54540          0.005403                                 
   0.02000    0.07998    0.17989    0.99980     1.99840     2.99460     5.2071     6.03407         0.82692          0.001547                                 
   0.04998    0.19967    0.44831    0.99875     1.99001     2.96631     4.9406     6.51357         1.57302          0.005598                                 
   0.05996    0.23942    0.53709    0.99820     1.98562     2.95153     7.3058     5.78247        -1.52331          0.005250                                 
   0.07991    0.31864    0.71311    0.99680     1.97445     2.91401     7.5636     7.37096        -0.19261          0.000084                                 
   0.08988    0.35806    0.80019    0.99595     1.96769     2.89131     7.9948     7.49377        -0.50102          0.000568                                 
   0.10978    0.43646    0.97213    0.99396     1.95179     2.83813     7.9124     8.11712         0.20477          0.000095                                 
   0.11971    0.47541    1.05682    0.99281     1.94268     2.80769     8.6332     7.71626        -0.91691          0.001902                                 
   0.12963    0.51416    1.14057    0.99156     1.93278     2.77473     7.6509     7.91167         0.26073          0.000154                                 
   0.13954    0.55271    1.22328    0.99022     1.92211     2.73927     7.6014     7.87756         0.27617          0.000173                                 
   0.15932    0.62913    1.38534    0.98723     1.89847     2.66098     7.9970     7.80695        -0.19006          0.000082                                 
   0.16918    0.66697    1.46453    0.98558     1.88551     2.61823     7.9197     7.61564        -0.30411          0.000209                                 
   0.17903    0.70455    1.54241    0.98384     1.87179     2.57313     7.0409     7.86616         0.82525          0.001541                                 
   0.20846    0.81552    1.76743    0.97803     1.82618     2.42408     8.7085     8.54526        -0.16322          0.000060                                 
...                                                                                                                                                          
                                                                                                                                                             
data sstrain;                                                                                                                                                
   retain mse 0;                                                                                                                                             
   set train end=dne;                                                                                                                                        
   * calulate MSE;                                                                                                                                           
   mse=sum(mse, rf_trainresidual**2/442);                                                                                                                    
   if dne then put mse=;                                                                                                                                     
run;quit;                                                                                                                                                    
                                                                                                                                                             
MSE=1.313742987                                                                                                                                              
                                                                                                                                                             
Agrees with the randomforest summary.                                                                                                                        
                                                                                                                                                             
Call:                                                                                                                                                        
 randomForest(formula = INCOME ~ ., data = train, ntree = 100,      importance = TRUE)                                                                       
               Type of random forest: regression                                                                                                             
                     Number of trees: 100                                                                                                                    
No. of variables tried at each split: 2                                                                                                                      
                                                                                                                                                             
          Mean of squared residuals: 1.313743                                                                                                                
                    % Var explained: 91.15                                                                                                                   
                                                                                                                                                             
/*     __   _           _     _             _      __ _ _                                                                                                    
 _ __ / _| | |__   ___ | | __| | ___  _   _| |_   / _(_) |_                                                                                                  
| `__| |_  | `_ \ / _ \| |/ _` |/ _ \| | | | __| | |_| | __|                                                                                                 
| |  |  _| | | | | (_) | | (_| | (_) | |_| | |_  |  _| | |_                                                                                                  
|_|  |_|   |_| |_|\___/|_|\__,_|\___/ \__,_|\__| |_| |_|\__|                                                                                                 
                                                                                                                                                             
*/                                                                                                                                                           
                                                                                                                                                             
                                                                                                                                                             
                                                                                              Holdout                                                        
                                                                FROM PROC REG                 Mean RSS*                                                      
                                                      ==================================      =========                                                      
 RANDOM FOREST                                        Obs   Rsquare       MSE      Slope      MSE                                                            
 =============                                                                                                                                               
     Apply training model decision trees              187    0.9229     1.10775   0.90466     1.2427*  Mean                                                  
     to holdout sample and running linear regression                                                   Residual                                              
     model rf_holdoutpredict = income                                                                  Sum of Squares                                        
                                                                                                                                                             
TRAINING                                                                                                                                                     
                                                                                                                                                             
HOW WELL DOES THE TRAINING DATASET PREDICT INCOME                                                                                                            
                                                                                                                                                             
proc reg data=train;                                                                                                                                         
  model RF_TRAINPRED=INCOME;                                                                                                                                 
run;quit;                                                                                                                                                    
                                                                                                                                                             
                                    Sum of           Mean                                                                                                    
Source                   DF        Squares         Square    F Value    Pr > F                                                                               
Model                     1     5440.76797     5440.76797    4533.71    <.0001                                                                               
Error                   440      528.03104        1.20007                                                                                                    
Corrected Total         441     5968.79901                                                                                                                   
                                                                                                                                                             
R-Square     0.9115                                                                                                                                          
                                                                                                                                                             
Variable        DF       Estimate                                                                                                                            
Intercept        1       -0.00827                                                                                                                            
INCOME           1        0.91045                                                                                                                            
                                                                                                                                                             
                                                                                                                                                             
HOW WELL DOES THE HOLDOUT DATASET PREDICT OF INCOME                                                                                                          
                                                                                                                                                             
proc reg data=holdout;                                                                                                                                       
  model RF_HOLDOUTPRED=INCOME;                                                                                                                               
run;quit;                                                                                                                                                    
                                    Sum of           Mean                                                                                                    
Source                   DF        Squares         Square    F Value    Pr > F                                                                               
Model                     1     2454.33388     2454.33388    2215.59    <.0001                                                                               
Error                   185      204.93458        1.10775                                                                                                    
Corrected Total         186     2659.26846                                                                                                                   
                                                                                                                                                             
R-Square     0.9229                                                                                                                                          
                          Parameter                                                                                                                          
Variable          DF       Estimate                                                                                                                          
                                                                                                                                                             
Intercept          1       -0.03032                                                                                                                          
INCOME             1        0.90466                                                                                                                          
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
MSE OF HOLDOUT BASED ON FITTING THE TRAINING MODEL                                                                                                           
==================================================                                                                                                           
                                                                                                                                                             
https://tinyurl.com/y85nust5                                                                                                                                 
                                                                                                                                                             
 WORK.HOLDOUT total obs=187                                                                                                                                  
                                                                                                                                                             
  AGE      FAMSIZE     HOMEVAL      EDUC     HOMESIZE      SKILL       INCOME    RF_HOLDOUTPRED    RF_HOLDOUTRESIDUAL    RF_HOLDOUTMSE                       
                                                                                                                                                             
   0.01000    0.04000     0.08999    0.99995     1.99960     2.99865      7.3958        6.52216            -0.87364            0.004082                      
   0.03000    0.11993     0.26964    0.99955     1.99640     2.98786      5.2628        5.51706             0.25431            0.000346                      
   0.03999    0.15983     0.35914    0.99920     1.99360     2.97843      6.9879        5.59546            -1.39239            0.010368                      
   0.06994    0.27909     0.62538    0.99755     1.98043     2.93409      6.3917        7.13733             0.74558            0.002973                      
   0.09983    0.39734     0.88656    0.99500     1.96013     2.86601      6.8405        7.82596             0.98543            0.005193                      
   0.14944    0.59104     1.30490    0.98877     1.91067     2.70134      7.5665        7.81372             0.24725            0.000327                      
   0.18886    0.74184     1.61890    0.98200     1.85733     2.52570      8.3167        7.58216            -0.73458            0.002886                      
   0.19867    0.77884     1.69393    0.98007     1.84212     2.47601      7.7250        8.45410             0.72912            0.002843                      
   ....                                                                                                                                                      
                                                                                                                                                             
data ssholdout;                                                                                                                                              
   retain mse 0;                                                                                                                                             
   set holdout end=dne;                                                                                                                                      
   mse=sum(mse, rf_holdoutresidual**2/187);                                                                                                                  
   if dne then put mse=;                                                                                                                                     
run;quit;                                                                                                                                                    
                                                                                                                                                             
   MSE HOLDOUT = 1.2426677127  ** agrees with computaion in R script                                                                                         
                                                                                                                                                             
/*                _           _     _             _    __ _ _                                                                                                
 _ __ ___  __ _  | |__   ___ | | __| | ___  _   _| |_ / _(_) |_                                                                                              
| `__/ _ \/ _` | | `_ \ / _ \| |/ _` |/ _ \| | | | __| |_| | __|                                                                                             
| | |  __/ (_| | | | | | (_) | | (_| | (_) | |_| | |_|  _| | |_                                                                                              
|_|  \___|\__, | |_| |_|\___/|_|\__,_|\___/ \__,_|\__|_| |_|\__|                                                                                             
          |___/                                                                                                                                              
*/                                                                                                                                                           
                                                                                                                                                             
HOW WELL DOES THE EQUATION FROM A REGRESSION USING THE TRAINING DATASET PREDICT INCOME                                                                       
                                                                                                                                                             
REGRESSION (PROC REG)                                                                                                                                        
=====================                                                                                                                                        
 Apply regression equation from training            187    0.9338     0.98815   0.92739                                                                      
 to holdout (proc score)                                                                                                                                     
                                                                                                                                                             
proc reg data=sd1.have outest=RegOut ;                                                                                                                       
   reg_train442: model income = age famsize homeval educ skill homesize;                                                                                     
   output out=reg_train442 pred=reg_trainpred442;                                                                                                            
quit;                                                                                                                                                        
                                                                                                                                                             
proc score data=holdout score=RegOut type=parms predict out=reg_train_est ;                                                                                  
   var age famsize homeval educ skill homesize;                                                                                                              
run;                                                                                                                                                         
                                                                                                                                                             
proc reg data=reg_train_est ;                                                                                                                                
   model reg_train442=income;                                                                                                                                
   output out=reg_holdoutp pred=reg_holdoutpr residual=reg_holdoutpres;                                                                                      
run;quit;                                                                                                                                                    
                                                                                                                                                             
                             Analysis of Variance                                                                                                            
                                                                                                                                                             
                                    Sum of           Mean                                                                                                    
Source                   DF        Squares         Square    F Value    Pr > F                                                                               
                                                                                                                                                             
Model                     1     2579.24732     2579.24732    2610.17    <.0001                                                                               
Error                   185      182.80817        0.98815                                                                                                    
Corrected Total         186     2762.05549                                                                                                                   
                                                                                                                                                             
R-Square     0.9338                                                                                                                                          
                        Parameter                                                                                                                            
Variable        DF       Estimate                                                                                                                            
                                                                                                                                                             
Intercept        1       -0.02024                                                                                                                            
INCOME           1        0.92739                                                                                                                            
                                                                                                                                                             
/*   _           _     _               _                   _     _      __                                                                                   
  __| | ___  ___(_)___(_) ___  _ __   | |_ _ __ ___  ___  / |___| |_   / /_                                                                                  
 / _` |/ _ \/ __| / __| |/ _ \| `_ \  | __| `__/ _ \/ _ \ | / __| __| | `_ \                                                                                 
| (_| |  __/ (__| \__ \ | (_) | | | | | |_| | |  __/  __/ | \__ \ |_  | (_) |                                                                                
 \__,_|\___|\___|_|___/_|\___/|_| |_|  \__|_|  \___|\___| |_|___/\__|  \___/                                                                                 
                                                                                                                                                             
*/                                                                                                                                                           
DECISION TREE                                                                                                                                                
                                                                                                                                                             
https://tinyurl.com/yba9ydyj                                                                                                                                 
                                                                                                                                                             
The decision gettree output represent the first 6 nodes                                                                                                      
of the first tree. Note the full tree is very complex and                                                                                                    
looks like overfitting, even though the vaildation looks very good.                                                                                          
The first full tree starts with these splits.                                                                                                                
                                                                                                                                                             
                                                                                                                                                             
If you run with maxnodes=6 and 30 trees                                                                                                                      
                                                                                                                                                             
   left daughter right daughter split var split point status  prediction                                                                                     
1              2              3     SKILL   0.3662468     -3  0.05884075                                                                                     
2              4              5   FAMSIZE   1.6820761     -3 -1.78038117                                                                                     
3              6              7   HOMEVAL  -0.5015062     -3  2.22423011                                                                                     
4              8              9      EDUC   0.1683972     -3 -2.84282357                                                                                     
5             10             11       AGE   0.7377838     -3  2.33929346                                                                                     
6              0              0      <NA>   0.0000000     -1 -0.57144088                                                                                     
7              0              0      <NA>   0.0000000     -1  3.86231857                                                                                     
8              0              0      <NA>   0.0000000     -1 -1.69383414                                                                                     
9              0              0      <NA>   0.0000000     -1 -4.68435458                                                                                     
10             0              0      <NA>   0.0000000     -1  4.01289236                                                                                     
11             0              0      <NA>   0.0000000     -1  0.44739906                                                                                     
                                                                                                                                                             
d:/pdf/top_of_decisiontree.pdf                                                                                                                               
                                                                                                                                                             
                                                                                                                                                             
                                  SKILL                                                                                                                      
                                                                                                                                                             
                           <=0.366 /\ > 0.366                                                                                                                
                                  /  \                                                                                                                       
                                 /    \                                                                                                                      
                                /      \                                                                                                                     
                               /        \                                                                                                                    
                              /          \                                                                                                                   
                             /            \ HOMEVAL                                                                                                          
                            /      <=2.224 * > 2.224                                                                                                         
                           /              / \                                                                                                                
                          /              /   \                                                                                                               
                FAMSIZE  /              /     \                                                                                                              
                 <=1.682* >1.682     INCOME   INCOME                                                                                                         
                       / \          -0.57      3.862                                                                                                         
                      /   \                                                                                                                                  
                     /     \                                                                                                                                 
                    /       \                                                                                                                                
                   /         \                                                                                                                               
                  /           \                                                                                                                              
                 /             \                                                                                                                             
          EDUC  /               \                                                                                                                            
      <=-2.483 *\ >-2.483        \                                                                                                                           
              /  \                \                                                                                                                          
             /    \                \                                                                                                                         
            /      \                \                                                                                                                        
           /        \                \                                                                                                                       
      INCOME      INCOME          AGE \                                                                                                                      
      -1.69       -4.68         <=.7378* >.7378                                                                                                              
                                      / \                                                                                                                    
                                     /   \                                                                                                                   
                                    /     \                                                                                                                  
                                   /       \                                                                                                                 
    Keeps going                 INCOME     INCOME                                                                                                            
                                4.012       0.447                                                                                                            
                                                                                                                                                             
 /*          _               _                     _        _     _                                                                                          
  ___  _   _| |_ _ __  _   _| |_   ___  __ _ ___  | |_ __ _| |__ | | ___  ___                                                                                
 / _ \| | | | __| `_ \| | | | __| / __|/ _` / __| | __/ _` | `_ \| |/ _ \/ __|                                                                               
| (_) | |_| | |_| |_) | |_| | |_  \__ \ (_| \__ \ | || (_| | |_) | |  __/\__ \                                                                               
 \___/ \__,_|\__| .__/ \__,_|\__| |___/\__,_|___/  \__\__,_|_.__/|_|\___||___/                                                                               
                |_|                                                                                                                                          
*/                                                                                                                                                           
                                                                                                                                                             
https://tinyurl.com/y72fkql5                                                                                                                                 
                                                                                                                                                             
WORK.IMP total obs=6                                                                                                                                         
                                                                                                                                                             
Obs    V1          X_INCMSE    INCNODEP                                                                                                                      
                                                                                                                                                             
 1     AGE          14.2983      977.58                                                                                                                      
 2     FAMSIZE      16.8066     1054.19                                                                                                                      
 3     HOMEVAL      14.9854     1117.01                                                                                                                      
 4     EDUC         15.3265     1745.00                                                                                                                      
 5     HOMESIZE     10.5091      513.19                                                                                                                      
 6     SKILL        13.8359     1135.86                                                                                                                      
                                                                                                                                                             
https://tinyurl.com/ybs3mp7x                                                                                                                                 
                                                                                                                                                             
WORK.TRAIN total obs=442                                                                                                                                     
                                                                                                                                                             
   AGE      FAMSIZE    HOMEVAL      EDUC     HOMESIZE      SKILL      INCOME   TRAINRES    RF_TRAINPRED    RF_TRAINRESIDUAL    RF_TRAINMSE                   
                                                                                                                                                             
 0.00000    0.00000    0.00000    1.00000     2.00000     3.00000     7.5194    1.54540       5.97400          -1.54540          0.005403                    
 0.02000    0.07998    0.17989    0.99980     1.99840     2.99460     5.2071   -0.82692       6.03407           0.82692          0.001547                    
 0.04998    0.19967    0.44831    0.99875     1.99001     2.96631     4.9406   -1.57302       6.51357           1.57302          0.005598                    
 0.05996    0.23942    0.53709    0.99820     1.98562     2.95153     7.3058    1.52331       5.78247          -1.52331          0.005250                    
 0.07991    0.31864    0.71311    0.99680     1.97445     2.91401     7.5636    0.19261       7.37096          -0.19261          0.000084                    
 0.08988    0.35806    0.80019    0.99595     1.96769     2.89131     7.9948    0.50102       7.49377          -0.50102          0.000568                    
 0.10978    0.43646    0.97213    0.99396     1.95179     2.83813     7.9124   -0.20477       8.11712           0.20477          0.000095                    
 0.11971    0.47541    1.05682    0.99281     1.94268     2.80769     8.6332    0.91691       7.71626          -0.91691          0.001902                    
 0.12963    0.51416    1.14057    0.99156     1.93278     2.77473     7.6509   -0.26073       7.91167           0.26073          0.000154                    
                                                                                                                                                             
https://tinyurl.com/y85nust5                                                                                                                                 
                                                                                                                                                             
WORK.HOLDOUT total obs=187                                                                                                                                   
                                                                                                                                                             
   AGE      FAMSIZE     HOMEVAL      EDUC     HOMESIZE      SKILL       INCOME    RF_HOLDOUTPRED    RF_HOLDOUTRESIDUAL    RF_HOLDOUTMSE                      
                                                                                                                                                             
 0.01000    0.04000     0.08999    0.99995     1.99960     2.99865      7.3958        6.52216            -0.87364            0.004082                        
 0.03000    0.11993     0.26964    0.99955     1.99640     2.98786      5.2628        5.51706             0.25431            0.000346                        
 0.03999    0.15983     0.35914    0.99920     1.99360     2.97843      6.9879        5.59546            -1.39239            0.010368                        
 0.06994    0.27909     0.62538    0.99755     1.98043     2.93409      6.3917        7.13733             0.74558            0.002973                        
 0.09983    0.39734     0.88656    0.99500     1.96013     2.86601      6.8405        7.82596             0.98543            0.005193                        
 0.14944    0.59104     1.30490    0.98877     1.91067     2.70134      7.5665        7.81372             0.24725            0.000327                        
                                                                                                                                                             
                                                                                                                                                             
https://tinyurl.com/yba45u6u                                                                                                                                 
                                                                                                                                                             
Up to 40 obs from MSERSQ total obs=100                                                                                                                       
                                                                                                                                                             
Obs    RF_TRAINMSE    RF_TRAINRSQ    TREE                                                                                                                    
                                                                                                                                                             
  1      2.65225        0.82140        1                                                                                                                     
  2      2.56710        0.82713        2                                                                                                                     
  3      2.81344        0.81054        3                                                                                                                     
  4      2.33962        0.84245        4                                                                                                                     
  5      2.12182        0.85712        5                                                                                                                     
  6      1.99200        0.86586        6                                                                                                                     
  7      1.77421        0.88052        7                                                                                                                     
  8      1.71963        0.88420        8                                                                                                                     
  9      1.63409        0.88996        9                                                                                                                     
 ...                                                                                                                                                         
                                                                                                                                                             
/*__       _ _              _   _                                                                                                                            
 / _|_   _| | |   __ _  ___| |_| |_ _ __ ___  ___                                                                                                            
| |_| | | | | |  / _` |/ _ \ __| __| `__/ _ \/ _ \                                                                                                           
|  _| |_| | | | | (_| |  __/ |_| |_| | |  __/  __/                                                                                                           
|_|  \__,_|_|_|  \__, |\___|\__|\__|_|  \___|\___|                                                                                                           
                 |___/                                                                                                                                       
*/                                                                                                                                                           
                                                                                                                                                             
https://tinyurl.com/ya6yxo8f                                                                                                                                 
                                                                                                                                                             
First tree very complex;                                                                                                                                     
                                                                                                                                                             
    left daughter right daughter split var split point status  prediction                                                                                    
1               2              3     SKILL  0.36624681     -3  0.05884075                                                                                    
2               4              5   FAMSIZE  1.68207612     -3 -1.78038117                                                                                    
3               6              7   HOMEVAL -0.50150616     -3  2.22423011                                                                                    
4               8              9      EDUC  0.16839723     -3 -2.84282357                                                                                    
5              10             11       AGE  0.73778379     -3  2.33929346                                                                                    
6              12             13  HOMESIZE -1.71670947     -3 -0.57144088                                                                                    
7              14             15  HOMESIZE  0.98821810     -3  3.86231857                                                                                    
8              16             17   FAMSIZE -0.75779807     -3 -1.69383414                                                                                    
9              18             19   FAMSIZE -1.23440596     -3 -4.68435458                                                                                    
10             20             21     SKILL -0.05216423     -3  4.01289236                                                                                    
11             22             23  HOMESIZE -0.68416245     -3  0.44739906                                                                                    
12             24             25   FAMSIZE -0.53036577     -3 -2.98962137                                                                                    
13             26             27       AGE -0.72655058     -3  0.19219507                                                                                    
14             28             29   FAMSIZE  0.96548573     -3  1.97094662                                                                                    
15             30             31   HOMEVAL  0.35849037     -3  7.23389467                                                                                    
16             32             33  HOMESIZE  1.55082154     -3  0.55030945                                                                                    
17             34             35       AGE  0.99439636     -3 -2.46767676                                                                                    
18             36             37       AGE -0.51252100     -3 -5.62992018                                                                                    
19             38             39     SKILL -2.90766975     -3 -3.24970332                                                                                    
20             40             41   FAMSIZE  1.94541172     -3  4.72836446                                                                                    
...                                                                                                                                                          
270 records not shown                                                                                                                                        
                                                                                                                                                             
290             0              0      <NA>  0.00000000     -1 -0.18444127                                                                                    
291             0              0      <NA>  0.00000000     -1 -0.64366597                                                                                    
292             0              0      <NA>  0.00000000     -1  7.77820959                                                                                    
293           296            297   HOMEVAL  2.37528076     -3  8.03542407                                                                                    
294             0              0      <NA>  0.00000000     -1 -2.02150597                                                                                    
295           298            299      EDUC -0.98439933     -3 -2.41102315                                                                                    
296             0              0      <NA>  0.00000000     -1  7.74920417                                                                                    
297             0              0      <NA>  0.00000000     -1  8.09266804                                                                                    
298           300            301  HOMESIZE  1.94379158     -3 -2.51349529                                                                                    
299             0              0      <NA>  0.00000000     -1 -2.24706773                                                                                    
300             0              0      <NA>  0.00000000     -1 -2.82766032                                                                                    
301             0              0      <NA>  0.00000000     -1 -2.32499627                                                                                    
                                                                                                                                                             
/*              _          _             _       _                                                                                                           
 _ __ ___   ___| |_ __ _  | |_ _ __ __ _(_)_ __ (_)_ __   __ _                                                                                               
| `_ ` _ \ / _ \ __/ _` | | __| `__/ _` | | `_ \| | `_ \ / _` |                                                                                              
| | | | | |  __/ || (_| | | |_| | | (_| | | | | | | | | | (_| |                                                                                              
|_| |_| |_|\___|\__\__,_|  \__|_|  \__,_|_|_| |_|_|_| |_|\__, |                                                                                              
                                                         |___/                                                                                               
*/                                                                                                                                                           
                                                                                                                                                             
https://tinyurl.com/y8ulrkwm                                                                                                                                 
                                                                                                                                                             
R Proc contents                                                                                                                                              
                                                                                                                                                             
List of 18                                                                                                                                                   
 $ call           : language randomForest(formula = INCOME ~ ., data = train, ntree = 100, importance = TRUE)                                                
 $ type           : chr "regression"                                                                                                                         
 $ predicted      : Named num [1:442] 5.97 6.03 6.51 5.78 7.37 ...                                                                                           
  ..- attr(*, "names")= chr [1:442] "1" "2" "3" "4" ...                                                                                                      
 $ mse            : num [1:100] 2.65 2.57 2.81 2.34 2.12 ...                                                                                                 
 $ rsq            : num [1:100] 0.821 0.827 0.811 0.842 0.857 ...                                                                                            
 $ oob.times      : int [1:442] 37 30 27 33 31 45 35 41 36 34 ...                                                                                            
 $ importance     : num [1:6, 1:2] 5.17 5.93 6.12 7.76 2.68 ...                                                                                              
  ..- attr(*, "dimnames")=List of 2                                                                                                                          
  .. ..$ : chr [1:6] "AGE" "FAMSIZE" "HOMEVAL" "EDUC" ...                                                                                                    
  .. ..$ : chr [1:2] "%IncMSE" "IncNodePurity"                                                                                                               
 $ importanceSD   : Named num [1:6] 0.362 0.353 0.408 0.506 0.255 ...                                                                                        
  ..- attr(*, "names")= chr [1:6] "AGE" "FAMSIZE" "HOMEVAL" "EDUC" ...                                                                                       
 $ localImportance: NULL                                                                                                                                     
 $ proximity      : NULL                                                                                                                                     
 $ ntree          : num 100                                                                                                                                  
 $ mtry           : num 2                                                                                                                                    
 $ forest         :List of 11                                                                                                                                
  ..$ ndbigtree    : int [1:100] 301 297 275 277 277 283 289 303 287 305 ...                                                                                 
  ..$ nodestatus   : int [1:315, 1:100] -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 ...                                                                                    
  ..$ leftDaughter : int [1:315, 1:100] 2 4 6 8 10 12 14 16 18 20 ...                                                                                        
  ..$ rightDaughter: int [1:315, 1:100] 3 5 7 9 11 13 15 17 19 21 ...                                                                                        
  ..$ nodepred     : num [1:315, 1:100] 0.0588 -1.7804 2.2242 -2.8428 2.3393 ...                                                                             
  ..$ bestvar      : int [1:315, 1:100] 6 2 3 4 1 5 5 2 2 6 ...                                                                                              
  ..$ xbestsplit   : num [1:315, 1:100] 0.366 1.682 -0.502 0.168 0.738 ...                                                                                   
  ..$ ncat         : Named int [1:6] 1 1 1 1 1 1                                                                                                             
  .. ..- attr(*, "names")= chr [1:6] "AGE" "FAMSIZE" "HOMEVAL" "EDUC" ...                                                                                    
  ..$ nrnodes      : int 315                                                                                                                                 
  ..$ ntree        : num 100                                                                                                                                 
  ..$ xlevels      :List of 6                                                                                                                                
  .. ..$ AGE     : num 0                                                                                                                                     
  .. ..$ FAMSIZE : num 0                                                                                                                                     
  .. ..$ HOMEVAL : num 0                                                                                                                                     
  .. ..$ EDUC    : num 0                                                                                                                                     
  .. ..$ HOMESIZE: num 0                                                                                                                                     
  .. ..$ SKILL   : num 0                                                                                                                                     
 $ coefs          : NULL                                                                                                                                     
 $ y              : Named num [1:442] 7.52 5.21 4.94 7.31 7.56 ...                                                                                           
  ..- attr(*, "names")= chr [1:442] "1" "2" "3" "4" ...                                                                                                      
 $ test           : NULL                                                                                                                                     
 $ inbag          : NULL                                                                                                                                     
 $ terms          :Classes 'terms', 'formula'  language INCOME ~ AGE + FAMSIZE + HOMEVAL + EDUC + HOMESIZE + SKILL                                           
  .. ..- attr(*, "variables")= language list(INCOME, AGE, FAMSIZE, HOMEVAL, EDUC, HOMESIZE, SKILL)                                                           
  .. ..- attr(*, "factors")= int [1:7, 1:6] 0 1 0 0 0 0 0 0 0 1 ...                                                                                          
  .. .. ..- attr(*, "dimnames")=List of 2                                                                                                                    
  .. .. .. ..$ : chr [1:7] "INCOME" "AGE" "FAMSIZE" "HOMEVAL" ...                                                                                            
  .. .. .. ..$ : chr [1:6] "AGE" "FAMSIZE" "HOMEVAL" "EDUC" ...                                                                                              
  .. ..- attr(*, "term.labels")= chr [1:6] "AGE" "FAMSIZE" "HOMEVAL" "EDUC" ...                                                                              
  .. ..- attr(*, "order")= int [1:6] 1 1 1 1 1 1                                                                                                             
  .. ..- attr(*, "intercept")= num 0                                                                                                                         
  .. ..- attr(*, "response")= int 1                                                                                                                          
  .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv>                                                                                                  
  .. ..- attr(*, "predvars")= language list(INCOME, AGE, FAMSIZE, HOMEVAL, EDUC, HOMESIZE, SKILL)                                                            
  .. ..- attr(*, "dataClasses")= Named chr [1:7] "numeric" "numeric" "numeric" "numeric" ...                                                                 
  .. .. ..- attr(*, "names")= chr [1:7] "INCOME" "AGE" "FAMSIZE" "HOMEVAL" ...                                                                               
 - attr(*, "class")= chr [1:2] "randomForest.formula" "randomForest"                                                                                         
                                                                                                                                                             
/*                                                                                                                                                           
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                                           
| `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                                                                          
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                                          
| .__/|_|  \___/ \___\___||___/___/                                                                                                                          
|_|                                                                                                                                                          
*/                                                                                                                                                           
                                                                                                                                                             
/* Turn off the full gettree and decision tree plot to run faster */                                                                                         
                                                                                                                                                             
options ls=171 ps=65;                                                                                                                                        
libname sd1 "d:/sd1";                                                                                                                                        
                                                                                                                                                             
data sd1.have;                                                                                                                                               
   call streaminit(12387);                                                                                                                                   
   do rad=0 to 2*constant('pi') by .01;                                                                                                                      
      age       =sin(rad);                                                                                                                                   
      famsize   =2*sin(2*rad);                                                                                                                               
      homeval   =3*sin(3*rad);                                                                                                                               
      educ      =cos(rad);                                                                                                                                   
      homesize  =2*cos(2*rad);                                                                                                                               
      skill     =3*cos(3*rad);                                                                                                                               
      income    =age+famsize+homeval+educ+skill+homesize +rand("normal",0,1) ;                                                                               
      output;                                                                                                                                                
   end;                                                                                                                                                      
   drop rad;                                                                                                                                                 
run;quit;                                                                                                                                                    
                                                                                                                                                             
options ls=171 ps=65;                                                                                                                                        
                                                                                                                                                             
* detete;                                                                                                                                                    
%utlfkil(d:/xpt/want.xpt);                                                                                                                                   
%utlfkil(d:/txt/regsummary.txt);                                                                                                                             
%utlfkil(d:/txt/regmeta.txt);                                                                                                                                
%utlfkil(d:/txt/gettree.txt);                                                                                                                                
%utlfkil(d:/pdf/regerr.pdf);                                                                                                                                 
%utlfkil(d:/pdf/important.pdf);                                                                                                                              
%utlfkil(d:/txt/top_of_simplegettree.txt);                                                                                                                   
%utlfkil(d:/pdf/top_of_decisiontree.pdf);                                                                                                                    
                                                                                                                                                             
proc datasets lib=work nolist;                                                                                                                               
 delete xpt holdout imp;                                                                                                                                     
run;quit;                                                                                                                                                    
                                                                                                                                                             
%utl_submit_r64(resolve('                                                                                                                                    
library(randomForest);                                                                                                                                       
library(haven);                                                                                                                                              
library(SASxport);                                                                                                                                           
library(data.table);                                                                                                                                         
library(dbplyr);                                                                                                                                             
library(dplyr);                                                                                                                                              
library(tidypredict);                                                                                                                                        
library(ggraph);                                                                                                                                             
library(igraph);                                                                                                                                             
/* plot function for decision tree */                                                                                                                        
plot_rf_tree <- function(final_model, tree_num, shorten_label = TRUE) {                                                                                      
  tree <- getTree(trainest,  k = tree_num, labelVar = TRUE) %>%                                                                                              
    tibble::rownames_to_column() %>%                                                                                                                         
    mutate(`split point` = ifelse(is.na(prediction), `split point`, NA));                                                                                    
  graph_frame <- data.frame(from = rep(tree$rowname, 2), to = c(tree$`left daughter`, tree$`right daughter`));                                               
  graph <- graph_from_data_frame(graph_frame) %>% delete_vertices("0");                                                                                      
  V(graph)$node_label <- gsub("_", " ", as.character(tree$`split var`));                                                                                     
  if (shorten_label) { V(graph)$leaf_label <- substr(as.character(tree$prediction), 1, 5) };                                                                 
  V(graph)$split <- as.character(round(tree$`split point`, digits = 2));                                                                                     
  plot <- ggraph(graph, "tree") +                                                                                                                            
      theme_graph() +                                                                                                                                        
      geom_edge_link() +                                                                                                                                     
      geom_node_point() +                                                                                                                                    
      geom_node_text(aes(label = split), nudge_x = -.3) +                                                                                                    
      geom_node_label(aes(label = leaf_label, fill = leaf_label), na.rm = TRUE,                                                                              
                    repel = FALSE, colour = "white", show.legend = FALSE);                                                                                   
  print(plot);                                                                                                                                               
};                                                                                                                                                           
have<-read_sas("d:/sd1/have.sas7bdat");                                                                                                                      
set.seed(123);                                                                                                                                               
/* split into training and hold-out 70/30 percent */                                                                                                         
ind=sample(2,nrow(have),replace=T,prob=c(.7,.3));                                                                                                            
train<-have[ind==1,];                                                                                                                                        
holdout<-have[ind==2,];                                                                                                                                      
/* run random forest */                                                                                                                                      
trainest<-randomForest(INCOME~.,data = train, ntree=100,importance=TRUE);                                                                                    
trainest;                                                                                                                                                    
sink(file="d:/txt/gettree.txt");                                                                                                                             
getTree(trainest, 1, labelVar=TRUE);                                                                                                                         
sink();                                                                                                                                                      
/*decision tree */                                                                                                                                           
pdf(file="d:/pdf/decisiontree.pdf",width =50, height = 50);                                                                                                  
plot_rf_tree(trainest,1);                                                                                                                                    
pdf();                                                                                                                                                       
"xxx Location of minimum xxx";                                                                                                                               
which.min(trainest$mse);                                                                                                                                     
/* create a text file with sql code tha can be used to run the model in sas */                                                                               
sink(file="d:/txt/sqlcode.txt");                                                                                                                             
tidypredict_sql(trainest,dbplyr::simulate_mssql());                                                                                                          
sink();                                                                                                                                                      
sink("d:/txt/regsummary.txt");                                                                                                                               
trainest;                                                                                                                                                    
sink();                                                                                                                                                      
sink("d:/txt/regmeta.txt");                                                                                                                                  
str(trainest);                                                                                                                                               
sink();                                                                                                                                                      
pdf("d:/pdf/regerr.pdf");                                                                                                                                    
plot(trainest);                                                                                                                                              
pdf();                                                                                                                                                       
pdf("d:/pdf/important.pdf");                                                                                                                                 
varImpPlot(trainest);                                                                                                                                        
pdf();                                                                                                                                                       
trainres<-as.data.table(cbind(trainest$y,trainest$predicted,trainest$y-trainest$predicted));                                                                 
colnames(trainres)<-c("OBSERVED","TRAINEST","TRAINRES");                                                                                                     
imp  <- as.data.table(importance(trainest));                                                                                                                 
imp  <- as.data.table(cbind(rownames(trainest$importance),imp));                                                                                             
/* create importance plots */                                                                                                                                
pdf(file="d:/pdf/important.pdf");                                                                                                                            
varImpPlot(trainest, main="Variable Importance Plot - Income Model");                                                                                        
pdf();                                                                                                                                                       
trainerr <-as.data.table(cbind(trainest$mse,trainest$rsq));                                                                                                  
/* validate with holdout */                                                                                                                                  
/* remove income as a independent variable and predict */                                                                                                    
holdest<-as.data.table(predict(trainest,newdata = holdout[,-7]));                                                                                            
holdout$pred=holdest$V1;                                                                                                                                     
resid<-holdout$pred-holdout$INCOME;                                                                                                                          
mse=mean(resid^2);                                                                                                                                           
"xx holdout mse xx";                                                                                                                                         
mse;                                                                                                                                                         
"xxxxxxxxxxxxxxxxx";                                                                                                                                         
trainerr<-as.data.table(trainres$err.rate);                                                                                                                  
for (i in seq_along(imp)) {label(imp[[i]])<- colnames(imp)[[i]]};                                                                                            
train<-cbind(train,trainres);                                                                                                                                
msersq<-as.data.table(cbind(trainest$mse,trainest$rsq));                                                                                                     
colnames(msersq)<-c("trainmse","trainrsq");                                                                                                                  
/* complex decision tree */                                                                                                                                  
sink(file="d:/txt/gettree.txt");                                                                                                                             
getTree(trainest, 1, labelVar=TRUE);                                                                                                                         
sink();                                                                                                                                                      
/*full decision tree */                                                                                                                                      
pdf(file="d:/pdf/decisiontree.pdf",width =11, height = 8);                                                                                                   
plot_rf_tree(trainest,1);                                                                                                                                    
pdf();                                                                                                                                                       
write.xport(holdout,train,imp,msersq,file="d:/xpt/want.xpt");                                                                                                
/* simple random forest for academic purposes 30 trees 6 nodes first spilts are the same */                                                                  
trainest<-randomForest(INCOME~.,data = train, ntree=30,importance=TRUE,maxnodes=6);                                                                          
sink(file="d:/txt/top_of_simplegettree.txt");                                                                                                                
getTree(trainest, 1, labelVar=TRUE);                                                                                                                         
sink();                                                                                                                                                      
/*decision tree */                                                                                                                                           
pdf(file="d:/pdf/top_of_decisiontree.pdf",width =11, height = 8);                                                                                            
plot_rf_tree(trainest,1);                                                                                                                                    
pdf();                                                                                                                                                       
'));                                                                                                                                                         
                                                                                                                                                             
                                                                                                                                                             
/*                            _     ____        _       _                                                                                                    
(_)_ __ ___  _ __   ___  _ __| |_  |  _ \    __| | __ _| |_ __ _                                                                                             
| | `_ ` _ \| `_ \ / _ \| `__| __| | |_) |  / _` |/ _` | __/ _` |                                                                                            
| | | | | | | |_) | (_) | |  | |_  |  _ <  | (_| | (_| | || (_| |                                                                                            
|_|_| |_| |_| .__/ \___/|_|   \__| |_| \_\  \__,_|\__,_|\__\__,_|                                                                                            
            |_|                                                                                                                                              
*/                                                                                                                                                           
                                                                                                                                                             
options ls=171 ps=65;                                                                                                                                        
                                                                                                                                                             
libname xpt xport "d:/xpt/want.xpt";                                                                                                                         
                                                                                                                                                             
data imp ;                                                                                                                                                   
  set xpt.imp;                                                                                                                                               
run;quit;                                                                                                                                                    
                                                                                                                                                             
data msersq (rename=(trainmse=rf_trainmse trainrsq=rf_trainrsq)) ;                                                                                           
  set xpt.msersq;                                                                                                                                            
  tree=_n_;                                                                                                                                                  
run;quit;                                                                                                                                                    
                                                                                                                                                             
data holdout; /* 187   */                                                                                                                                    
  set xpt.holdout end=dne;                                                                                                                                   
  rf_holdoutPred=pred;                                                                                                                                       
  rf_holdoutResidual=pred-income;                                                                                                                            
  rf_holdoutMse=sum(rf_holdoutMse,rf_holdoutResidual**2/187);                                                                                                
  if dne then put rf_holdoutMse= 12.9;                                                                                                                       
  drop pred;                                                                                                                                                 
run;quit;                                                                                                                                                    
                                                                                                                                                             
* RF_HOLDOUTMSE=0.000452914;                                                                                                                                 
                                                                                                                                                             
data train; /* 442    */                                                                                                                                     
  set xpt.train end=dne;                                                                                                                                     
  rf_trainPred=trainest;                                                                                                                                     
  rf_trainResidual=rf_trainPred-income;                                                                                                                      
  rf_trainMse=sum(rf_trainMse,rf_trainResidual**2)/442;                                                                                                      
  if dne then put rf_trainMse= 12.9;                                                                                                                         
  drop trainest;                                                                                                                                             
run;quit;                                                                                                                                                    
                                                                                                                                                             
libname xpt clear;                                                                                                                                           
                                                                                                                                                             
/*____ _   _ ____                                                                                                                                            
| ____| \ | |  _ \                                                                                                                                           
|  _| |  \| | | | |                                                                                                                                          
| |___| |\  | |_| |                                                                                                                                          
|_____|_| \_|____/                                                                                                                                           
                                                                                                                                                             
*/                                                                                                                                                           
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
                                                                                                                                                             
