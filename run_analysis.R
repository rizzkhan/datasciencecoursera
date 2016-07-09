 # Create a new table, finalDataNoActivityType without the activityType column
 finalDataNoActivityType  = finalData[,names(finalData) != 'activityType'];
 
-# Summarizing the inalDataNoActivityType table to include just the mean of each variable for each activity and each subject
+# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
 tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean);
 
 # Merging the tidyData with activityType to include descriptive acitvity names
 tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);
 
-# Optional: export the tidyData set 
+# Export the tidyData set 
 write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t');
