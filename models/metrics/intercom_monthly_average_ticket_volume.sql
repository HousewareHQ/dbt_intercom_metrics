-- depends_on: {{ ref('intercom_main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom__monthly_average_ticket_volume',
    grain='year',
    dimensions=[],
    secondary_calculations=[]
) }}