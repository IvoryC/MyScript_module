
# install.packages("rmarkdown", dependencies=TRUE)
library(rmarkdown)

# Rendering an markdown requires pandoc.
# See: https://github.com/jgm/pandoc/releases/latest
# get the path of the folder where pandoc is installed
Sys.setenv(RSTUDIO_PANDOC="/usr/local/bin/") 

system("mkdir ../output")
rmarkdown::render('../resources/SomeUsersRMarkdown.Rmd',
                 encoding = 'UTF-8', output_dir='../output')
