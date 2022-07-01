-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom__monthly_customer_initiated_conversations',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}