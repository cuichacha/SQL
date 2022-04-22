# 繁体字相关开始---------------------------------------------------------------------------------------------------------

# alter table sc_feedback_reason
#     add language_type tinyint;
# alter table sc_opinion_feedback
#     add language_type tinyint;
#
# alter table sc_feedback_reason
#     drop language_type;
# alter table sc_opinion_feedback
#     drop language_type;

alter table sc_online_server
    add language_type tinyint;

update sc_online_server set language_type = 1;

# 繁体字相关开始---------------------------------------------------------------------------------------------------------