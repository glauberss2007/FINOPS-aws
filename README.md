# FINOPS-aws: Streamlining AWS Cost Analysis and Visualization

The **FINOPS-aws** project aims to centralize and streamline AWS cost monitoring and analysis through an ETL pipeline integrating various AWS services.

![image](https://github.com/glauberss2007/FINOPS-aws/assets/22028539/342f26a4-9151-4e63-ae70-3148d7274195)

## Overview

The project begins by extracting billing data and cost/usage reports from AWS, storing them in S3 Buckets. The pipeline involves AWS Glue for data preparation and transformation and AWS Athena for querying and analysis. Additional data sources like CSV/XLS files with budgetary and team-based managerial controls contextualize cost data.

## Features

- **Dashboard Creation:** Integrates multiple data sources into MS Power BI for generating comprehensive dashboards and reports.
- **Comparison and Analysis:** Allows comparison of AWS costs against predefined budgets, aiding informed decision-making for managers.

## Setting Up S3 Bucket Creation

Follow these steps to create an Amazon S3 bucket:

1. Access AWS Console: Log in and navigate to the AWS Management Console.
2. Navigate to S3: Search and select "S3" or locate it in the services menu.
3. Create a new bucket: Click "Create bucket" -> Choose a unique name -> Select the region.
4. Configure bucket settings: Set access control, permissions, and configurations based on requirements.
5. Review and create: Ensure correctness of settings and click "Create bucket".

## Configuring Export Reports

To export AWS Cost and Usage Reports data to an S3 bucket in Parquet format:

1. Access AWS Cost and Usage Reports in the Cost Management Console.
2. Set Up AWS Cost & Usage Reports: Configure settings and specify the S3 bucket for storing reports.
3. Export Data to S3 in Parquet Format: Ensure reports are generated and stored in the specified S3 bucket in Parquet format.

For further configuration steps, including setting up AWS Glue, Crawler, and querying with Athena, visit [AWS Cost Optimization](https://dx1572sre29wk.cloudfront.net/cost-optimization/).

This README provides a concise guide for streamlining AWS cost analysis and visualization, enabling well-informed decision-making based on comprehensive data insights.

## Importing to Power BI and using PowerQuery to customize it

The exported data used to pop the PowerBI template provided in this project is below:

````
SELECT 
  bill_payer_account_id,
  line_item_usage_account_id,
  DATE_FORMAT((line_item_usage_start_date),'%Y-%m-%d') AS day_line_item_usage_start_date, 
  line_item_usage_type,
  line_item_resource_id,
  product_region,
  line_item_product_code,
  SUM(CAST(line_item_usage_amount AS DOUBLE)) AS sum_line_item_usage_amount,
  SUM(CAST(line_item_unblended_cost AS DECIMAL(16,8))) AS sum_line_item_unblended_cost
FROM 
  ${table_name} 
WHERE 
  ${date_filter} 
  AND line_item_product_code = 'AmazonAthena'
  AND line_item_line_item_type  IN ('DiscountedUsage', 'Usage', 'SavingsPlanCoveredUsage')
GROUP BY 
  bill_payer_account_id,
  line_item_usage_account_id,
  line_item_usage_start_date,
  line_item_usage_type,
  line_item_resource_id,
  product_region,
  line_item_product_code
ORDER BY 
  sum_line_item_unblended_cost DESC
LIMIT 20; 

````

Other files are also used in Power BI, in order to provide some information that are not presented in AWS cost report, such as manager per team tag and manager monthly budget.

## References

https://dx1572sre29wk.cloudfront.net/cost-optimization/

