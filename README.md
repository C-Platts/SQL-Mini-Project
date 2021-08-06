# Introduction

In week 2 of my training at Sparta Global, I was given the opportunity to learn how to SQL to create databases and query them to gather specific data.

For this, I have to complete a mini-project where I was tasked with constructing SQL queries to fulfil a set of requirements for each question.
The PDF file contains a list of all queries for each requirement in addition to a result of the query.

# Tools

### Azure Data Studio

To complete this task, I used Azure Data Studio to construct and run the queries. 

### Excel

Data from Azure Data Studio was exported into Excel in part 3 of the PDF. This was done to use Excel's graphing tools to create simple graphs that help make sense of numerical data. This can be seen specifically in 3.2 and 3.4.

# What I Learned & Did

During this project, I had to learn and apply a variety of SQL, with particular emphasis on DML and some emphasis on DDL.

### DDL

Win this project I was given the opportunity to create and populate tables. In section 2 of the PDF, the queries are designed to create a simple Spartan table with relevant attributes such as Name and Stream. To verify the query worked as expected the **SP_HELP** command was used to show an overview of the table structure.

To build upon that I was able to **INSERT** data into the table; defining an appropriate data type and **PRIMARY KEY**. A simple **SELECT * FROM Spartan** query was used to return the data, ensuring it was added to the table correctly.

### DML

The focus of my experience with DML was using **SELECT** along with accompanying SQL keywords to collect specific data according to the requirements of the question. In Part 1 of the PDF, I used **WHERE** to filter data based on certain criteria such as location, in addition to **CONCAT** to combine related data to make it more readable e.g. with Address Fields. Furthermore, **FORMAT** was used to make data more readable and presentable where necessary. An example of this is when looking at sales in regions for question 1.6. **FORMAT** was used to make the large numbers returned more readable.

This was expanded upon with **JOIN** statements, which were sued to aid with gathering data from multiple tables. This was then built upon further, using aggregate functions and **GROUP BY** to perform more complex queries across tables such as getting the number of products for each category.

To finalise some of the tasks, **ORDER BY** was used, sometimes in conjunction with **GROUP BY** to order data where requested. Additionally, though I did not use it within my project, I learned about subqueries and the benefits they can bring in filtering out data and using them in conjunction with **GROUP BY** and aggregate functions to perform more advanced queries.

In Section 3 of the PDF, I show that I connected Excel to the project by exporting data from SQL queries within Azure Data Studio to use Excel's graph feature.
