sort_by_columns2 <- function (data, col1, col2){
  orderdata <- data[order(data[,col1],data[,col2]),]
  return(orderdata)
}