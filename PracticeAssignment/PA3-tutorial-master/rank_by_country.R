rank_by_country <- function(data,column,rank){
  ## We save the levels of column 2, the countries' names, in the countries vector
  countries <- levels(data[,2])
  ## We generate an empty vector that we will fill later, row by row, to generate our final output
  output <- vector()
  ## For loop to get the right data on each city. length(countries) is the number of different countries in our
  ## database. In our case we have 3 countries: China, UK, USA.
  for (i in 1:length(countries)) {
    ## countrydata subsets data by the considered country
    countrydata <- data [grep(countries[i],data$countries),]
    orderdata <- countrydata[order(decreasing = TRUE, countrydata[,column]),]
    ## append() adds elements at the end of a vector. We want to add the name of the city [rank,1],
    ## the areakm2 [rank,2] and the populationk [rank,3]. We don't add the name of the countries, because it
    ## will be the label of the rows.
    output <- append (output, as.character(orderdata[rank,1]))
    for (l in 3:4){
      output <- append (output, as.character(orderdata[rank,l]))
    }
  }
  ## Just because it's simpler to generate a matrix rather than a data frame, I generate it first and convert it
  ## to data frame immediatly after. 
  output <- as.data.frame(matrix(output,length(countries),3, byrow = TRUE))
  ## Name of the columns will be "cities", "areakm2" and "populationk". Name of the rows are the countries.
  colnames(output) <- c("cities","areakm2","populationk")
  rownames(output) <- countries
  return(output)
}