library(adegenet)
import2genind(system.file("files/nancycats.gtx",
package="adegenet"))
import2genind(system.file("files/nancycats.dat",
package="adegenet"))
import2genind(system.file("files/nancycats.gen",
package="adegenet"))
import2genind(system.file("files/nancycats.str",
package="adegenet"), onerowperind=FALSE, n.ind=237, n.loc=9, col.lab=1, col.pop=2, ask=FALSE)
