-- depends_on: {{ ref('intercom__monthly_ticket_volume') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom__monthly_average_ticket_volume',
    grain='year',
    dimensions=[],
    secondary_calculations=[]
) }}