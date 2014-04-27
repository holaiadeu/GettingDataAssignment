## Introduction

This repository includes all the required files for the Peer Assignment of the Coursera course "Getting and Cleaning Data".

## What's included?

The repo includes a file `run_analysis.R` with the code used to perform the analysis required for this assignment and a file `CodeBook.md` describing the variables of the resulting tidy data set and describing the main steps to perform the analysis.

## How to execute the code?

When the `run_analysis.R` is executed (running R commmand `source("run_analysis.R")`), it assumes that the working directory contains the following:

* File `features.txt`
* File `activity_labels.txt`
* Folder named `train`, containing files `X_train.txt`, `y_train.txt` and `subject_train.txt`
* Folder named `test`, containing files `X_test.txt`, `y_test.txt` and `subject_test.txt`

It is not necessary to have the `run_analysis.R` on the same working directory but if it is located in another folder the `source` command must refer to that folder (for example `source("path/run_analysis.R")`).

The execution of the file produces a file `tidy_data_set.txt` that is located at the root of the working directory.`

## Execution Requirements

The code execution requires the "plyr" library to be installed in R. In case it was not previously installed, it can be included by executing the `install.packages("plyr")` code.

This statement only has to be executed once in every R installation.