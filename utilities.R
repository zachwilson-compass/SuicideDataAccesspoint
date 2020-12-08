

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

# Sources multiple files relative to pattern
sourceMultiple <- function(path, pattern){
  pattern_files <- list.files(path = path, pattern=pattern)
  for (f in pattern_files){
    source(paste0(path,'/',f))
    print(f)
  }
  
  
}
