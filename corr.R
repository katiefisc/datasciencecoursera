corr <-function(directory, threshold = 0) {
        corVect<-c()
        for(i in 1:332) {
                x<-read.csv(paste("specdata","/",sprintf("%03d",i),".csv", 
                                  sep =""), header = TRUE)
                cleandata <-x[complete.cases(x),]
                completecasescount <- nrow(cleandata)
                if (completecasescount > threshold){
                        sulfate<-c(cleandata[,2])
                        nitrate<-c(cleandata[,3])
                        result<-cor(sulfate,nitrate)
                        corVect <- append(corVect, result)
                         } 
                }
        return(corVect)
}
        

