-- depends_on: {{ ref('intercom__main_conversations') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('intercom__monthly_customer_initiated_conversations'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}