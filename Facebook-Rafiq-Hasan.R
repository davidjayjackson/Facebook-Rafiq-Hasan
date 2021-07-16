library(stringr)


date = seq(as.Date("1998/01/01 00"), as.Date("2019/12/31 21"), by = 'days', format = "%YYYY%mm%dd %HH")

date_list = as.list(gsub("-", "", seq(as.Date("1998/01/01 00"), as.Date("2019/12/31 21"), by = 'days', format = "%YYYY%mm%dd %HH")))

time = c('00', '03', '06', '09', '12', '15', '18', '21')

date = date[1:20]
date_list = date_list[1:20]

for (i in 1:length(date_list)){
  for (t in time){
    day = format(lubridate::yday(date[i]), digits = 3)
    day = str_pad(day, width = 3, side = "left", pad = "0")
    
    temp_url = paste0("https://rafiq_hasan_2021:Dhaka2010@disc2.gesdisc.eosdis.nasa.gov/opendap/TRMM_L3/TRMM_3B42.7/", substr(date_list[i], start = 1, stop = 4),"/",day, "/3B42.", date_list[i], ".", t, ".","7.HDF.nc4?precipitation[1163:1340][19:161],nlon[1163:1340],nlat[19:161]")
    
    print(temp_url)
    
    #destfile <- paste0("N:/Current-Users/Rafiq-Hasan/Data/Data_Links/Data_Download",i, t, ".nc4")
    destfile <- paste0("./",i, t, ".nc4")
    
    download.file(temp_url, destfile, mode = "wb" )
  }
}


