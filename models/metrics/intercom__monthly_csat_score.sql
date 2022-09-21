-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('intercom__monthly_csat_score'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}