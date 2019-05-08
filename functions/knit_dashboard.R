knitr::knit(here::here("README.Rmd"))
rmarkdown::render(here::here("README.md"),
                  output_format = rmarkdown::github_document(),
                  output_file = here::here("README.md"))
file.remove(here::here("README.html"))
