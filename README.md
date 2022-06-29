# Intercom Metrics dbt Package ([Docs](https://housewarehq.github.io/dbt_intercom_metrics))

# 📣 What does this dbt package do?
This package provides pre-built metrics for Intercom data from [Fivetran's connector](https://fivetran.com/docs/applications/intercom). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/intercom#schemainformation).

This package enables you to access commonly used metrics on top of Intercom Support Tickets.

## Metrics 

This package contains transformed models built on top of [Fivetran Intercom](https://github.com/fivetran/dbt_intercom) & [Intercom_source package](https://github.com/fivetran/dbt_intercom_source). A dependency on the source packages is declared in this package's `packages.yml` file, so it will automatically download when you run `dbt deps`. 

The metrics offered by this package are described below

| **metric**                          | **description**                                                                                                                                                                                                                              |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [intercom_monthly_ticket_volume](https://github.com/HousewareHQ/dbt_intercom_metrics/blob/main/models/metrics/metrics.yml#L138-L150)    | Number of intercom tickets generated monthly.                
| [intercom_monthly_closed_tickets](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L84-L99)      | Number of tickets closed monthly.                         
| [intercom_monthly_open_tickets](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L30-L45)    | Number of monthly open tickets.
| [intercom_monthly_resolution_rate](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L19-L28)    | Percentage of tickets closed monthly.
| [intercom_monthly_csat_score](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L121-L136)    |         Percentage of positive ratings defining customer satisfaction score.                                                               |
| [intercom_monthly_customer_initiated_conversations](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L67-L82)    |  Number of conversations customer have initiated monthly.                                     |
| [intercom_monthly_average_ticket_volume](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L5-L17)    | Average number of tickets recieved every month.                                                         |
| [intercom_average_resolution_time_in_hours](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L101-L119)    | Average time taken to resolve ticket monthly.               |
| [intercom_average_response_time_in_hours](https://github.com/HousewareHQ/dbt_stripe_metrics/blob/main/models/metrics/stripe__metrics.yml#L47-L65)    | Average time taken to respond to a ticket every month.|                                                                                                                                 

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran intercom connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, or **PostgreSQL** destination.


## Step 2: Install the package

Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`

```yaml
packages:
  - git: "https://github.com/HousewareHQ/dbt_intercom_metrics.git"
    revision: v0.1.0
```

## Step 3: Define database and schema variables

By default, this package will look for your Intercom data in the `intercom` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Intercom data is, please add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  intercom_source:
    intercom_database: your_database_name
    intercom_schema: your_schema_name
```

For additional configurations for the source models, please visit the [Intercom source package](https://github.com/fivetran/dbt_intercom_source).

## (Optional) Step 4: Change build schema
By default this package will build the Intercom staging models within a schema titled (<target_schema> + `_stg_intercom`) and the Intercom metrics within a schema titled (<target_schema> + `_intercom_metrics`) in your target database. If this is not where you would like your modeled Intercom data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
  intercom_metrics:
    +schema: my_new_schema_name # leave blank for just the target_schema
  intercom_source:
    +schema: my_new_schema_name # leave blank for just the target_schema
```


# 🗄 Which warehouses are supported?
This package has been tested on BigQuery, Snowflake.


# 🙌 Can I contribute?

Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.


# 🏪 Are there any resources available?
- Provide [feedback](https://airtable.com/shrPHxTmfkjq3P6Eh) on what you'd like to see next
- Have questions, feedback, or need help? Email us at nipun@houseware.io
- Check out [Houseware's blog](https://www.houseware.io/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
