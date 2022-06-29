-- depends_on: {{ ref('intercom_main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='intercom_average_resolution_time_in_hours',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}