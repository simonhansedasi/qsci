calc.chi <- function(obs,preds){
  chi.sq <- sum(  (obs - preds)^2 / preds  )
}

calc.total.ANOVA <- function(vec){
  gm <- mean(vec)
  tot_ss <- sum((vec - gm)^2)
  N <- length(vec)
  tot_df <- N-1
  
return(list(tot_ss, tot_df))
}

