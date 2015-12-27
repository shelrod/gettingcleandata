# Project Definition

The script `run_analysis.R` performs the 5 steps described in the project's definition.

*1) Addressing those files having the same number of columns and referring to the same entities, all the similar data is merged using the `rbind()` function.
* 2) Only those columns with the mean and standard deviation measures are taken from the whole dataset. Once these columns have been extracted they are given the correct names, taken from `features.txt`.
* 3) Activity names and IDs from `activity_labels.txt` are taken from the data set and they are substituted in the dataset.
* 4) In the dataset, the columns with vague column names are corrected.
* 5) Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called `avg_data.txt`.

# Variables
* `x_training`, `y_training`, `x_testing`, `y_testing`, `sub_training` and `sub_testing` contain the data from the downloaded files.
* `x_data`, `y_data` and `sub_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `sub_data` in a big dataset.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` .
