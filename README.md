
# skills_test

<!-- badges: start -->
<!-- badges: end -->

The goal of skills_test is to create a practical skills test for a data analyst or intern candidate. All data are fake/mock data and do not represent an actual country or USAID effort. They are simply structured in a similar way to the data we use.


Instructions: This should be your own work. Utilize the resources at your disposal, but do not outsource the actual tasks. 
You can use any software tools you choose to complete these tasks--or mix and match. However, we are likely to prioritize a candidate who demonstrates their skills in R and Tableau. Because of reproducibility, code-first approaches to data cleaning, manipulation, and transformation are strongly preferred.
Expected Output: Please complete a google or MS office slide deck or document with answers to each question. Be sure to include images of any requested visuals, where requested. 
You should also provide the code you use to read, manipulate, clean, transform, and visualize data. STATA .do files should be saved as .txt, while R files can remain .r files. If you use Tableau for any visualizations, post a workbook to Tableau Public and link to it in the slide deck. If you use excel/google sheets for visualization you should include the file. 
Time frame: Share your findings within 72 hours of receipt of these instructions. You can choose the date/time when you would like to begin the task and receive the specific questions.
Task: Often in our work as data analysts, we receive datasets which need to be cleaned, transformed, and merged before use. Our data sets are not always tidy--or even tame, and sometimes we need to pull from different sources. One may be at the country level, another at the state level or there may be different naming conventions/formats. Still, we need to be able to make sense of the differences in these data sets and wrangle them before conducting meaningful analysis. Repeatable coding solutions are strongly preferred to Excel find-and-replace solutions
For this task, we will use mock data for HIV testing and initiation of treatment and pre-exposure prophylaxis (PrEP). The data sets are simplified versions of data types we frequently work with across USAID and PEPFAR. However, the actual data are completely imagined and do not come from a real country context. The data are separated into 2 files:
Results
Targets
These files can be accessed from the following github repository: https://github.com/BBetz907/skills_test/tree/main/Dataout

Analytic Tasks and Questions:
____________________________________________________________________________
1. Although results are disaggregated by gender, targets were not assigned by gender. For which year and indicator was the biggest disparity in results observed (between males and females)? 

____________________________________________________________________________
2. PEPFAR data often contain both results and targets, but sometimes these variables come in separate files with slightly different structures and naming conventions. Combine results and targets data sets into one file/data set so that for every indicator, year, and region we can calculate 
achievement = results / targets
Hint: You may need to reshape one or more data sets and possibly recode values of a string variable
What challenges, if any, do you experience in combining the results and targets data sets? 

____________________________________________________________________________
3. Using the results and targets data, what was the percent achievement for the indicator hiv_tests during the year 2021 in the Northern Region? 

Create a table showing percent achievement for the hiv_tests indicator in the Northern region from 2020 to 2022.

What visuals would you consider using if you wished to compare achievement for multiple indicators in one region, across multiple years? Explain in a sentence or two. Bonus if you can create and include your desired visual.

____________________________________________________________________________
4. Create one or more charts to show how achievement varied by region in 2022 for the indicator hiv_tests.
You may choose to visualize only the achievement variable or your could consider visualizing achievement along with the indicator results and/or targets. What types of charts are well-suited for this task? Are there any obvious pros or cons to each approach? 
Hint: what insights or data might be missed if you only visualize achievement?



---

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development. All errors remain our own.*