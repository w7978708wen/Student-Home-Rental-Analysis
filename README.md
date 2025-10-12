<h1>Overview</h1>
To simulate the analysis that I created for my university's student home rental business (which is an academic project), I manually created two small datasets to capture the general trends observed. For example, there are particular months that have higher application volumes than others. Some buildings and room types are also more popoular than others.

I aim to use my data sets to display my interest and work in managing a complete data pipeline/ ETL process, including:

• Importing raw data into Python

• Transforming the datasets in Python

• Exporting the cleaned dataset as .csv to load into Power BI

• Doing exploratory data analysis in Power BI

• Utilizing design principles to direct the audience's focus

• Utilizing data story-telling techniques to communicate insights clearly


<h1>Data Transformation Using Python</h1>
Please go to the my <a href="https://github.com/w7978708wen/Student-Home-Rental-Analysis/blob/main/Python_data_analysis.ipynb">Jupyter notebook</a> attached in this repository for exact steps done. After data transformation, the .csv files will be used in Power BI to create the dashboard with data visualizations. Here are some of my takeaways:

<h3>Handling missing values</h3>

•Missing Aboriginal status responses are filled in with “No,” since it is the most frequently occurring response among other applicants.

•Missing applicant age is filled with the mode of the dataset.

•Not every missing value needs to be dropped. For example, an applicant’s missing postal code is insignificant when analyzing how the student home rental business can improve.

•Missing values can contain meaning. For example, no offer reply date indicates that the applicant has not received an offer. However, this row of data should not be dropped, because it can still be used to analyze which buildings and rooms are popular. 

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

<h1>Data-Driven Solutions using Power BI</h1>

<h2>Popularity vs. Price </h2>

•The analysis shows that there is a disporportionately high demand for Single Room at Amazing Apartment compared with other options. This trend is clearly reflected in the "Most Preferred Options in 1st Preference" bar chart. 

•On the other hand, the Single Room at Amazing Apartment also has one of the lower total monthly costs. In fact, getting a Single Room at Amazing Apartment costs less than any other apartments (Brilliant Apartment and Fantastic Apartment). 

•Recommendation: 

Putting the data visualizations side-by-side allows us to recognize a mismatch between demand and pricing. To achieve a more balanced distribution of applicants across buildings and room types, it is recommended to reassess the current pricing structure.I would recommend increasing the rent and/or utilities for Single Rooms at Amazing Apartment so the demand for this option would decrease and the demand for other options would increase.


<img src="https://github.com/w7978708wen/Student-Home-Rental-Analysis/blob/main/PowerBI%20Data%20Visualizations/Popularity%20vs.%20Price%20Data%20Visualization%201.png?raw=true">

<h2>Takeaways:</h2>

• It is okay to go back to doing data transformation while I am already in the data visualization stage. Initially, I used Python to demonstrate my data transformation capabilities (which I did not get to do in the actual school project due to criteria constriants). However, I still like to use Power Query Editor to transform data because it is very convenient to shift back and forth between Power Query Editor and Report View - all within Power BI.

•I learned that it is important to understand how the business operates in order to deliver helpful insights. 

Example 1: A single room apartment (studio apartment) is different than a 1-bedroom apartment (a home with a kitchen area, living area, 1 bedroom, and more).

Example 2: Only 1 type of building is children-friendly, which is Fantastic Apartment (APT-5). This is why most applicants who identify as children-accompanied put this building as their first choice, even though this building has the highest rent. Besides exploring the spreadsheets, it is important to know the client by going onto their website, social media, etc.


I will be creating more data visualizations later. Thank you for reading.







