As an alternative to traditional metrics, we propose to use GR metrics,
which are based on inhibition of the growth rate over the course of the assay
and are independent of the division rate of the assayed cell lines.

Growth can be estimated at different concentrations based on the cell count at
the time of treatment (*x<sub>0</sub>*), the cell count
in the untreated control (*xctrl*), and the cell count
after treatment at concentration *c* (*x&#40;c)*):

<img src="images/image04.png" style="height: 50px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

This equation assumes exponential growth and constant growth inhibition by the
drug. Many phenomena such as drug efflux, homeostasis and adaptation can result
in non-exponential growth. In such cases, time course assays and time-dependent
GR values are better suited to evaluating drug response. Given measurements of
cell count at different time points, time-dependent GR values are defined as:

<img src="images/image10.png" style="height: 50px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

<figure>
    <img src="images/image02.png" height="300">
    <figcaption>
        <h1>Different methods can be used to evaluate GR values.</h1>

        (left) Conceptual approach based on growth rates (<span
        class="math">k(0)</span> and <span class="math">k&#40;c)</span>);
        (middle) fixed-interval approach based on cell number at the start
        (<span class="math">x<sub>0</sub></span>) and end of the experiment
        (<span class="math">xctrl</span> and <span
        class="math">x&#40;c)</span>); and (right) time-dependent approach
        based on cell count before and after a time interval
        <span class="math">2 × 𝚫t (x(c, t ± 𝚫t))</span>.

    </figcaption>
</figure>

*GR&#40;c)* values (or time-dependent *GR(c,t)* values at a given time *t*)
across a range of concentrations are fitted to a sigmoidal curve:

<img src="images/image05.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

where the fitted parameters are:

- **GR<sub>inf</sub>**: the effect of the drug at infinite concentration
  (*GR<sub>inf</sub>* = *GR(c→∞)*). *GR<sub>inf</sub>* lies between –1 and 1.
  Negative values correspond to cytotoxic responses (i.e., induction of cell
  death), and a value of 0 corresponds to a fully cytostatic response.
- **h<sub>GR</sub>**: the Hill coefficient of the fitted curve, which reflects
  how steep the dose-response curve is. In practice, we typically constrain
  *h<sub>GR</sub>* to a value between 0.1 and 5.
- **GEC<sub>50</sub>**: the concentration at half-maximal effect. To avoid
  artefacts in curve fitting we constrain *GEC<sub>50</sub>* to be within two
  orders of magnitude higher and lower than the experimentally tested
  concentration range. (In practice, this is usually about 10<sup>-7</sup> to
  10<sup>3</sup> μM.)If the fit of the curve is not significantly better than
  that of a flat curve (i.e., *GR&#40;c)* ≡ *GR<sub>inf</sub>*) based on an
  F-test with cutoff of p = 0.05, the response is considered flat, and the
  parameter *GEC<sub>50</sub>* is set to 0.

If time-dependent *GR(c,t)* values are used, GR metrics
can be estimated at a different time points to study how sensitivity evolves
over time.

### Inferred drug response metrics

The *GR<sub>50</sub>* value is the concentration of drug at which *GR(c =
GR<sub>50</sub>) = 0.5*. If the value for *GR<sub>inf</sub>* is above 0.5, the
*GR<sub>50</sub>* value is not defined and is therefore set to +∞. By extension,
other thresholds can be defined in a similar manner. For example,
*GR<sub>100</sub>* corresponds to the concentration at which a drug is fully
cytostatic: *GR(c = GR<sub>100</sub>) = 0*.

*GR<sub>max</sub>* is the maximum effect of the drug at the highest tested
concentration. It lies between –1 and 1. A value of 0 corresponds to a fully
cytostatic response, and negative values correspond to a cytotoxic response.
*GR<sub>max</sub>* can be estimated from the fitted curve or obtained directly
from experimental data. (We often do the later.)

For time course data, all metrics are evaluated at each time point individually.

### Area under the curve and over the curve (GR<sub>AOC</sub>)

Another common metric for quantifying dose response is the area under the
response curve (AUC), which is based on integrating the dose-response curve over
the range of tested concentrations. In the case of GR curves, which can have
negative values, it is more intuitive to use the area over the curve:

<img src="images/image08.png" style="height: 60px; display: block; margin: auto; margin-bottom: 20px; margin-top: 20px;"/>

where *GR(c<sub>i</sub>)* are measured GR values at discrete concentrations
*c<sub>i</sub>*. *GR<sub>AOC</sub>* has the benefit that, in the case of no
response, it has a value of 0. It is important to note that *GR<sub>AOC</sub>*
values (like conventional AUC) can only be used to compare responses evaluated
across the same drug concentration range.

The *GR<sub>AOC</sub>* value captures variation in potency and efficacy at the
same time. The calculation of *GR<sub>AOC</sub>* at discrete (experimentally
determined) concentrations has the advantage that it does not require curve
fitting and is therefore free of fitting artifacts. This is especially useful
for assays where fewer than five concentrations are measured and curve fitting
is unreliable. *GR<sub>AOC</sub>* values are also more robust to experimental
noise than metrics derived from curve fitting; e.g. *GR<sub>max</sub>* is
particularly sensitive to outlier values when directly obtained from data.

<figure>
    <img src="images/image01.png" height="600">
    <figcaption>
        <h1>Examples of dose-response curves and fits.</h1>

        The upper panels depict strong responses to drugs for which all
        sensitivity parameters can be defined. In contrast, in the case shown in
        the lower left panel, <span class="math">GR<sub>inf</sub></span> is
        above 0.5, so <span class="math">GR<sub>50</sub></span> cannot be
        defined (and thus is set to <span class="math">∞</span>). In the case
        shown in the lower right panel, the response is weak and noisy, so the
        sigmoidal fit is not significant, and a straight flat line is fitted.
        Nevertheless, only <span class="math">GR<sub>AOC</sub></span> and <span
        class="math">GR<sub>inf</sub></span> can be defined.

    </figcaption>
</figure>
