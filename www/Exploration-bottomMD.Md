**Exploration Tool**
This interactive model of drug response illustrates the dependency of relative cell count and *IC<sub>50</sub>/E<sub>max</sub>* metrics on cell division time. Adjust the sliders to alter the model parameters, or select one of buttons to display the output of the model for a defined drug response profile (cytostatic, partial cytostatic, or cytotoxic). (left) Normalized cell count over time at different concentrations of drug; (middle) the resulting IC curve and IC metrics; (right) the resulting GR curve and GR metrics.

---

To simulate the effect of division time on GR and conventional drug-response metrics under different assumptions about the degree of cytostasis or cell killing, we developed a theoretical model of drug response. To the first approximation, cell growth can be considered exponential, with drugs either decreasing the division rate or killing cells in a cell cycle-dependent manner:

<img src="images/image06.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

where *x* is the cell count, *k* is the untreated growth rate (per day), *c* is the drug concentration, *S<sub>M</sub>* is the maximal inhibitory effect, *SC<sub>50</sub>* is the concentration at half-maximal effect of drug, and *h* is the Hill coefficient. The growth rate *k* corresponds to the division rate *k<sub>0</sub>* as *k = ln(2)⋅k<sub>0</sub> = ln(2)/T<sub>d</sub>*, where *T<sub>d</sub>* is the division time. *S<sub>M</sub>* can be larger than 1 to account for drugs inducing cell death at a specific phase of the cell cycle.

Integrating these equations for an assay of *t* days yields the cell count at concentration *c*:

<img src="images/image11.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

where *x<sub>0</sub> = x(t = 0)* is the cell number at the time of treatment. Thus, the relative cell count is:

<img src="images/image00.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

where *x<sub>ctrl</sub> ≡ x(0)*, and the normalized growth rate inhibition (*GR value*) is:

<img src="images/image09.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

This equation for *GR&#40;c\)* is independent of the length of the assay *t* and the untreated growth rate *k*, and, thus, the metrics *GR<sub>50</sub>*, *GR<sub>max</sub>*, *GR<sub>AOC</sub>*, and *h<sub>GR</sub>* are also independent of *t* and *k*. 