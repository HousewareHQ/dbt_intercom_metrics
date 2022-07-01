with conversation_history as (
    select *
    from {{ var('conversation_history') }}
)

select *,
    (case when conversation_history.conversation_rating_value > var('good_rating_threshold',5) then 1 else 0 end) as is_conversation_rating_positive,
    (case when conversation_history.state = 'closed' then 1 else 0 end) as is_conversation_closed,
    (DATEDIFF(minute,first_contact_reply_created_at, updated_at)) as reply_time_in_minutes,
    (reply_time_in_minutes/60) as reply_time_in_hours
from conversation_history





