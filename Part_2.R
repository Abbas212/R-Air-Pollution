directory=paste(getwd(), "/", "Air", sep="")
results <- data.frame(id=numeric(0), nobs=numeric(0))
complete <- function(directory, id = 1:332)
{
        for (i in id)
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
                nobs <- nrow(interested_data)
                results <- rbind(results, data.frame(id=i, nobs=nobs))
        }
        results
}
