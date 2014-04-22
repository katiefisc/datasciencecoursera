complete <- function(specdata, id = 1:332){
        ids<-c()
        nobs<-c()
        for(i in id) {
                x<-read.csv(paste(specdata,"/",sprintf("%03d",i),".csv", 
                sep =""), header = TRUE)
                cleandata <-x[complete.cases(x),]
                nobcount <- nrow(cleandata)
                ids <- append( ids, i)
                nobs <- append(nobs, nobcount)
             
                 }
        df<-data.frame(cbind(ids,nobs))
        return(df)
}
