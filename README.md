<h1>Overview</h1>
To simulate the analysis that I created for my university's student home rental business (which is an academic project), I manually created two small data sets to capture the general trends observed. For example, there are particular months that have higher application volumes than others. Some buildings and room types are also more popoular than others.

I aim to use my data sets to display my exploratory data analysis, dashboard creation, design principles, and data story-telling techniques.


<h1>Data Analysis Using Python</h1>
Please go to the my Jupyter notebook attached in this repository for exact steps done. 

Here are some of my takeaways:

<h3>Handling missing values</h3>

•Missing Aboriginal status responses are filled in with “No,” since it is the most frequently occurring response among other applicants.

•Missing applicant age is filled with the mode of the dataset.

•Not every missing value needs to be dropped. For example, an applicant’s missing postal code is insignificant when analyzing how the student home rental business can improve.

<h3>Dropping columns with little significance</h3>

•Not every column is useful, such as housing preferences 4–6. Therefore, they are dropped from the dataset to reduce clutter. 

<h3>Replacing values</h3>

•For example, “2-Bedroom” vs “Two Bedroom.” Also, the building names are given using code names, which need to be converted back to their real names to make the final dashboard presentation as easy to understand as possible.

<h3>Creating new columns using logic or aggregation</h3>

•In my simple dataset, given that the state/province is a non-empty value and that our new column is called 'Student Type':
If State/Province = "International" → Student Type = “International”

else → Student Type = “Domestic"

•Another column can also be created to aggregate values from other columns. For example Total monthly cost = monthly rent + monthly utilities

<h3>Properly formatting the spreadsheet</h3>

•If an Excel spreadsheet does not have columns starting at row 1, remove the unnecessary rows above the data using the skiprows=n argument on the line of code where the dataset is imported.





