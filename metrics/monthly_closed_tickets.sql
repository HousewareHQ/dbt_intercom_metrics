-- depends_on: {{ ref('intercom_main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='monthly_closed_tickets',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}