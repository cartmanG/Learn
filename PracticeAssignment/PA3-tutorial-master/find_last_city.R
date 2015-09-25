## nrow() returns the number of rows of a data frame. We use this function to determine the index of the last item.
find_last_city <- function(data,column){
  orderdata <- data[order(decreasing = TRUE,data[,column]),]
  return(as.character(orderdata[nrow(orderdata),1]))
}