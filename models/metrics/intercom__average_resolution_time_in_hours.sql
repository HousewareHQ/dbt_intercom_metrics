-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('intercom__average_resolution_time_in_hours'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
