with conversation_history as (
    select *
    from {{var('conversation_history')}}
)

select *,
    (case when conversation_history.conversation_rating_value > 5 then 1 else 0 end) as conversation_rating_is_positive,
    (case when conversation_history.state = 'closed' then 1 else 0 end) as conversation_is_closed,
    (DATEDIFF(hour,first_contact_reply_created_at, updated_at)) as reply_time_in_hours
from conversation_history





