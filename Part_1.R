directory=paste(getwd(), "/", "Air", sep="")
means = c()

pollutantmean <- function(directory, pollutant, id)
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
                interested_data = total_data[pollutant]
                means <- c(means, interested_data[!is.na(interested_data)])
        }
        mean(means)
}


pollutantmean(directory, "nitrate", 70:72)