# FINOPS-aws

This projectt aimed at configuring a dashboard in MS Power BI to visualize AWS costs. 

![image](https://github.com/glauberss2007/FINOPS-aws/assets/22028539/342f26a4-9151-4e63-ae70-3148d7274195)

The main objective is to create a comprehensive view of costs associated with AWS services, allowing for monitoring and analysis of expenditure. The project involves utilizing various AWS tools and services in an ETL (Extract, Transform, Load) pipeline. 

It begins by extracting billing data and cost and usage reports from AWS, which are stored in S3 Buckets. Subsequently, AWS Glue is employed for data preparation and transformation, and AWS Athena for querying and analysis purposes. Moreover, the project incorporates the Power Query feature during the creation of dashboards. Additionally, it integrates two other data sources: CSV and XLS files containing budgetary information and manager control by team tag. These additional sources allow for contextualizing cost data by comparing it against predefined budgets and managerial controls based on team tags. 

By incorporating these multiple data sources into MS Power BI, comprehensive dashboards and reports can be generated. This not only displays AWS costs but also facilitates comparison against budgetary allocations. This holistic view enables better-informed decision-making by managers, allowing for adjustments and strategic decisions based on a more comprehensive analysis.

## Creating S3 bucket

The steps to create an Amazon S3 bucket are:

1. Access the AWS Console: Log in to your AWS account at https://aws.amazon.com/ and navigate to the AWS Management Console.

2. Navigate to S3: In the AWS Management Console, search for and select the "S3" service, or type "S3" in the search bar and choose Amazon S3 when it appears.
3. Create a new bucket: Click on the "Create bucket" button -> Choose a unique name for the bucket. Remember, bucket names must be globally unique -> Select the region where you want to create the bucket.
4. Configure bucket settings: Set access control and permissions ->  You can define either public or private access, and configure access policies -> Choose configuration options such as versioning, logging, encryption, and more, based on your requirements.
5. Review and create: Review all settings to ensure they're correct -> Click on "Create bucket" to create your S3 bucket.
6. Accessing the bucket: Once created, the bucket will appear in the list of buckets within the Amazon S3 dashboard in the AWS Management Console -> Click on the bucket name to access and manage the files within it.

## Configuring the export report

To export AWS Cost and Usage Reports data to an S3 bucket in Parquet format, you can follow these general steps using the AWS Management Console:

1. Access AWS Cost and Usage Reports: Sign in to the AWS Management Console -> Go to the AWS Cost Management Console.

2. Set Up AWS Cost & Usage Reports: If you haven't already set up Cost & Usage Reports, you'll need to do so -> Choose the settings for your report, including time granularity (hourly in this case), data granularity, and whether to include resource IDs, tags, etc. -> Specify the S3 bucket created in previous step toto store the reports in.

3. Export Data to S3 in Parquet Format: Once the reports are configured and generated, they will be stored in the specified S3 bucket in a predefined format (e.g., CSV or Parquet) -> To export in Parquet format specifically, you may need to adjust the settings in the Cost & Usage Reports configurations to ensure the reports are generated in Parquet.

4. Configure Parquet Format: Within the Cost & Usage Reports settings, if there's an option to choose the format, select Parquet -> Ensure that the reports are being generated and stored in the chosen S3 bucket in Parquet format.

## Configuring AWS Glue and Crawler

1. Access AWS Glue Console: Log in to the AWS Management Console -> Navigate to AWS Glue.
2. Create a Database: In the Glue Console, select "Databases" and then click "Add database." -> Provide a name for your database, such as "CostDataDB".
3. Create a Crawler: In the AWS Glue Console, go to "Crawlers" and click "Add crawler"->Enter a name for the crawler, like "CostDataCrawler".
4. Specify Data Store: Select "Data stores" and choose "S3" as the data store type -> Point the crawler to the S3 bucket where your AWS Cost & Usage Reports are stored.
5. Configure Crawler Output: Choose "Specified path in my account" and provide the S3 path where your reports are stored (e.g., s3://your-bucket-name/path/to/reports).
6. Choose Database: Select the database you created earlier ("CostDataDB") as the target for the crawler output.
7. Schedule the Crawler: Set up a schedule for the crawler to run daily by selecting the frequency.
8. Finish and Run the Crawler: Review the settings and run the crawler to start populating the database with data from the AWS Cost & Usage Reports.

   The crawler you've set up will run based on the schedule you've defined, fetching new data from your AWS Cost & Usage Reports stored in the specified S3 location and populating the "CostDataDB" database in AWS Glue with this fresh information.

This setup ensures that your CostDataDB database is regularly updated with the latest cost data from your AWS account. You can then use this database with AWS Glue or other AWS services like Athena for querying, analysis, and visualization of your AWS cost information.

## Queryng the data using AWS Athena

To configure AWS Athena to query the Glue database populated with AWS Cost & Usage Reports data, follow these steps:

1. Access Athena Console: Log in to AWS Management Console -> Navigate to the Athena service.

2. Create a Table in Athena: Select Database -> Choose the database you created in AWS Glue (e.g., "CostDataDB").

3. Create Table: Click on "Create Table" to define a new table -> Select "From AWS Glue Data Catalog" -> Choose the Glue Table -> Select the table representing your AWS Cost & Usage Reports data that was created by the Glue crawler.

4. Review Table Schema: Athena will provide a preview of the table schema based on the Glue catalog.

By configuring Athena to query your Glue database, you can effectively analyze and derive insights from your AWS Cost & Usage Reports data. Make sure you have the necessary permissions to access Athena and the Glue database.

## Importing to Power BI and using PowerQuery to customize it
