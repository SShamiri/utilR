
##### Package skeleton ----
### create package and package skeleton
usethis::create_package("/Users/samuelshamiri/projects/utilR")

### we save console process inside raw-data folder
# this folder is ignored during build
usethis::use_data_raw("build_process")

### update description file
# License
usethis::use_mit_license()
# update Tilte, Authors@R, Description

### Readme file use rmd to modify md
usethis::use_readme_rmd()
# modify the rmd file as required

### git setup
usethis::use_git()
# to check token
usethis::gh_token_help() # check git
# if you haven't had a token create one
#usethis::create_github_token()
# setup creds
gitcreds::gitcreds_set() # if password changed

### github setup
usethis::use_github() # this create a repo on github


