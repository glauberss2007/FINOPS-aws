# FINOPS-aws

This projectt aimed at configuring a dashboard in MS Power BI to visualize AWS costs. The main objective is to create a comprehensive view of costs associated with AWS services, allowing for monitoring and analysis of expenditure. The project involves utilizing various AWS tools and services in an ETL (Extract, Transform, Load) pipeline. It begins by extracting billing data and cost and usage reports from AWS, which are stored in S3 Buckets. Subsequently, AWS Glue is employed for data preparation and transformation, and AWS Athena for querying and analysis purposes. Moreover, the project incorporates the Power Query feature during the creation of dashboards. Additionally, it integrates two other data sources: CSV and XLS files containing budgetary information and manager control by team tag. These additional sources allow for contextualizing cost data by comparing it against predefined budgets and managerial controls based on team tags. By incorporating these multiple data sources into MS Power BI, comprehensive dashboards and reports can be generated. This not only displays AWS costs but also facilitates comparison against budgetary allocations. This holistic view enables better-informed decision-making by managers, allowing for adjustments and strategic decisions based on a more comprehensive analysis.

![image](https://github.com/glauberss2007/FINOPS-aws/assets/22028539/342f26a4-9151-4e63-ae70-3148d7274195)

## Creating S3 bucket

## Configuring the export report

## Configuring AWS Glue and Crawler

## Queryng the data using AWS Athena

## Importing to Power BI and using PowerQuery to customize it
