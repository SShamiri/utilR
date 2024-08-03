
##### Package skeleton ----
### create package and package skeleton
usethis::create_package("/Users/samuelshamiri/projects/utilR")
### update description file
# License
usethis::use_mit_license()
# update Tilte, Authors@R, Description
### Readme file use rmd to modify md
usethis::use_readme_rmd()
# modify the rmd file as required
### git setup

# create raw-data file
usethis::use_data_raw("data_name")
#
