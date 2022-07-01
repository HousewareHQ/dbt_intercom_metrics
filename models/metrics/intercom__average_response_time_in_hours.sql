-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom__average_response_time_in_hours',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
