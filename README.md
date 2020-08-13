# GAUSSIAN PREDICTION WITH DAM 

This is a matlab implementation of GAUSSIAN MODELING WITH DEEP ASSESSMENT METHODOLOGY, an approach for modeling the daily changes of COVID-19 in order to predict the future trend of pandemic. Deep Assessment Methodology is introduced in our previous work:

Karaçuha, E., Tabatadze, V., Karaçuha, K., Önal, N. Ö., & Ergün, E. (2020).  [Deep Assessment Methodology Using Fractional Calculus on Mathematical Modeling and Prediction of Gross Domestic Product per Capita of Countries.](https://www.mdpi.com/2227-7390/8/4/633) _Mathematics_, _8_(4), 633.

## Data

In order to use your own data, you should provide 1 x N data vector containing N points.  (P0)

## Parameters

Gaussian Modeling requires to specify :

* Range for Fractional Order (Gamma)
* Number of past points that is used to express any instance (l)
* Number of terms in Taylor Approximation (M)
* Cut value 

Then, parameters of the Gaussian (A, a and b) are found by Least Square Method.

* A: The Peak of the Gaussian (Maximum number of daily change)
* b: Mean (The date of maximum number of daily change)
* a: Variance of the Gaussian 