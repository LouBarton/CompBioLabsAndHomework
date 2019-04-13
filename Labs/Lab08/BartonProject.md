## Altitude as a driver  of diversification and local adaptation in a highly coevolved plant-pollinator pair 

### Louise Barton  |  12 April 2019
#### Masters Thesis Research: Louise K. Barton, Steven D. Johnson, Timo van der Niet, Ruth Cozien, Bruce Anderson, and Erin A. Tripp 

## Introduction
Species that interact strongly often undergo reciprocal coadaptation and thus exhibit coevolutionary patterns. A long-standing aim of evolutionary ecology is to understand these patterns, and specifically to gain insight into the geographic selection mosaic underlying trait divergence among populations of interacting species.  Here we evaluate whether local adaptation could account for an altitudinal cline in the floral morphology of *Zaluzianskya microsiphon* (Scrophulariaceae).  Floral nectar tubes of this species have been shown to co-vary with proboscis length of its long-proboscid fly pollinator *Prosoeca ganglbaueri* (Nemestrinidae) over large geographical spatial scales, but the role of selection in explaining variation in floral tube length at smaller spatial scales had not been investigated.

## Data utilized in analyses 
#### Goals and methodology 
We examine the influence of altitude on ecotype variation in *Z. microsiphon* and utilize reciprocal translocations to assess local adaptation at high and low altitude sites. To determine if there is a consistent pattern across the Drakensberg of decline in floral tube and proboscis length with altitude, extensive measurements of floral tube length were taken along a 40m-altitudinal cline [2000-3200m: 22 populations], with the prediction that length of floral nectar tubes will continuously decrease with increasing altitude.  Reciprocal translocation experiments were established in a paired design at high [2880m] and low [2190m] altitude sites. Each pair consisted of two virgin inflorescences with equal flower counts, one from the local ecotype and one translocated. At high sites 28 pairs were established [HH + HL], and at low sites 30 pairs [LL + LH].  Flowers were collected after 7 days, and reproductive output calculated for each inflorescence as number of fruits produced x mean number of seeds per fruit. Assuming that trait variation across the landscape is a result of adaption to local pollinators, we expect that translocated plants [with mismatched traits] will exhibit reduced fecundity [reduced total seed output] compared to natives [with matched traits].

#### Format and size of data 
Data is in two CSV files. The [first](DATA.xlsx) is from translocations and is comprised of 117 lines arranged in 23 columns, and is 72,081 bytes.  The [second](tubelength.csv) is from gradient sampling and is comprised of nectar tube measurements. It is 168 lines arranged in 5 columns, and is 4,213 bytes. 

#### Inconsistencies in the data files 
Note all columns will be utilized in the analysis, and data from both files will be used. There is missing data in most columns. There are some spacing issues in the from column causing R to think there are two "low" levels. 

## Proposed Analysis 
1. Create frequency distribution plots for translocation experiment using ggplot and Tidyverse. 
2.  Create good visual depiction of altitude vs. nectar tube length. Overlay plots from translocation experiments onto graph of all populations sampled along the altitudinal gradient. 
3. 

## References 
My own data: in the form of two CSV files (see above for links)



