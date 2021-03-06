library(ape)
data(carnivora)
### Using the formula interface:
co <- correlogram.formula(SW ~ Order/SuperFamily/Family/Genus,
data=carnivora)
co
plot(co)
### Several correlograms on the same plot:
cos <- correlogram.formula(SW + FW ~ Order/SuperFamily/Family/Genus,
data=carnivora)
cos
plot(cos)

