
#library(markdown)
library(rmarkdown)

Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")

if (pandoc_available())
  cat("pandoc", as.character(pandoc_version()), "is available!\n")

if (pandoc_available("1.12.3"))
  cat("required version of pandoc is available!\n")

#see: https://github.com/jgm/pandoc/releases/latest

system("mkdir ../output")
rmarkdown::render('../resources/SomeUsersRMarkdown.Rmd',
                 encoding = 'UTF-8', output_dir='../output')
