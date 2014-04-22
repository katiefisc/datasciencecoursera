pollutantmean <- function(specdata, pollutant, id = 1:332){
        total <- 0
        count <- 0
        for(i in id) {
                x<-read.csv(paste(specdata,"/",sprintf("%03d",i),".csv", 
                sep =""), header = TRUE)
                cleandata <-na.omit(x[pollutant])
                total <- total + sum(cleandata[pollutant])
                count <- count + nrow(cleandata)
                }
       return( ifelse(count = 0, 0, total/count ))
        #return (total/count)                
}
