startTime=Sys.time()

#get names of all cnbc files
if(as.character(Sys.info()['user'])=='vivek4'){
        cnbcFiles=list.files('/work/v/vivek4/socialNetworkData/',pattern='cnbc*',full.names=T)
}else{
        cnbcFiles=list.files('/home/cis1024/socialNetworkData',pattern='cnbc*',full.names=T)
}

print(paste('number of RData files=',length(cnbcFiles)))

load(cnbcFiles[1])
totalData=fb_page
for (i in 2:length(cnbcFiles))
{
        #browser()
        load(cnbcFiles[i])
        totalData<-rbind(totalData,fb_page)
}
