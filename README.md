# New York Times Connections Project

> Introduction

This data set [The New York Times Connections Archive](https://www.kaggle.com/datasets/eric27n/the-new-york-times-connections?resource=download) with 5,203 values currently derived from [Kaggle](https://www.kaggle.com/) contains all the words, group names, group level, game ID, starting row, and starting columns of *The New York Times* word puzzle called **Connections**. The data set encompasses all the observations of the game from June 12th of 2023 (first game launch date) and is constantly updated with the most recent games.

> Components of this project

| **Components**              | **Description**                                                        |
|--------------------------------|---------------------------------------|
| `codes/render_report_nyt.R` | Renders the `connections_report.Rmd` markdown file into an html report |
| `codes/nyt_tree.R`          | Contains the codes for the treemap.                                    |
| `codes/nyt_table.R`          | Contains the codes for the summary table 1                             |
| `connections_report.Rmd`    | Reads all the data, tables, and graphs to create an html file          |
| `Makefile`                  | Has the rules for generating the connections report                    |
| `renv`                      | Directory for all the project's installed packages                     |


# How to generate the project/report

Clone the repository via git clone

Generate the final report In the terminal
> Run `make`

Remove all files generated running make In the terminal
> Run `make clean`


# Access the website for this project as well!
> [My NYT Connections Project]("https://rpubs.com/kohguma/1269649")

# Note
> Project was coded and built under a MacOs/Linux system
