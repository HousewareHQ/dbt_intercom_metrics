-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom__monthly_csat_score',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}