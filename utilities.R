

# Check if package is installed, then load it.
check_packages <- function(pkgs){
  package.check <- lapply(
    pkgs,
    FUN = function(x) {
      if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE)
        library(x, character.only = TRUE)
      }
    }
  )
}