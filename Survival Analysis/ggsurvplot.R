library(survminer)
library(survival)

# view data
head(lung)
# * inst: Institution code
# * time: Survival time in days
# * status: censoring status 1=censored, 2=dead
# * age: Age in years
# * sex: Male=1 Female=2
# * ph.ecog: ECOG performance score (0=good 5=dead)
# * ph.karno: Karnofsky performance score (bad=0-good=100) rated by physician
# * pat.karno: Karnofsky performance score as rated by patient
# * meal.cal: Calories consumed at meals
# * wt.loss: Weight loss in last six months


# Kaplan-Meier survival curve
# 1. ungrouped survival curve
fit.ungroup = survfit(Surv(time, status) ~ 1, data = lung)
ggsurvplot(fit) 

# 2. Survival curves grouped by sex
fit.sex = survfit(Surv(time, status) ~ sex, data = lung)
ggsurvplot(fit.sex)
# 2.1 improve the figure
# The censoring point defaults to +
ggsurvplot(fit.sex, censor.shape = "|", censoe.size = 4)
# line types. Allowed values includes i) "strata" for changing linetypes by strata (i.e. groups); ii) a numeric vector (e.g., c(1, 2)) or a character vector c("solid", "dashed").
ggsurvplot(fit.sex, linetype = "strata",
           conf.int = T, pval = T,
           palette = "Dark2")
ggsurvplot(fit.sex, linetype = "strata",
           conf.int = T, pval = T,
           palette = "grey")
# 2.2 cumulative risk curve
ggsurvplot(fit.sex, data = lung,
           conf.int = T,
           fun = "cumhaz")
# 2.3 Add overall patient survival curve
ggsurvplot(fit.sex,
           data = lung,
           conf.int = T, pval = T,
           surv.median.line = "hv",
           add.all = T)
# reminder!!!
ggsurvplot(fit.sex,
           data = lung,
           size = 1,
           palette = c("#E7B800", "#2E9FDF"),
           conf.int = T, 
           pval = T,
           risk.table = T,
           risk.table.col = "strata",
           risk.table.height = 0.25,
           legend.labs = c("Male", "Female"),
           ggtheme = theme_bw()
           )

# https://www.rdocumentation.org/packages/survminer/versions/0.4.9/topics/ggsurvplot_arguments
