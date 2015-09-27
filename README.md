# CleaningDataRepo
Script for cleaning the "Human Activity Recognition Using Smartphones Dataset" from this publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Script reads in the data, subsets it to only include Mean and Standard Deviation columns, then labels columns, joins data and changes Activity Types to have more human-readable names. Test and training data is joined, with the "type" column specifying which dataset each row is from. The cleaned dataset is stored in the "finaldata" table.
Finally the script creates another table, "tidyaverages", that contains the averages for each column of the finaldata table, grouped by both Subject and Activity Type.
For more details see the comments in the run_analysis.R file.