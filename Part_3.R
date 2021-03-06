directory=paste(getwd(), "/", "Air", sep="")
bc = c()
corr <- function(directory, threshold = 0)
{
        for (i in 1:332)
        {
                if (i<10)
                {path = paste(directory, "/",  "00" , i, ".csv", sep="")}
                if (i>9 && i<100)
                {path = paste(directory, "/",  "0" , i, ".csv", sep="")}
                if(i>=100)
                {path = paste(directory, "/" , i, ".csv", sep="")}
                total_data = read.csv(path)
                interested_data = total_data[(!is.na(total_data$sulfate)), ]
                interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
                if(nrow(interested_data) > threshold)
                {
                        bc = c(bc, (cor(interested_data$sulfate, interested_data$nitrate)))
                }
        }
        bc
}