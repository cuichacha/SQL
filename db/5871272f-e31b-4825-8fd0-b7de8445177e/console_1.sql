use leadnews_wemedia;

select wm_news.*, wm_user.name
from wm_news,
     wm_user
where wm_news.user_id = wm_user.id;

select wn.*, wu.name
from wm_news wn
         left outer join wm_user wu on wn.user_id = wu.id;

select count(wm_news.id)
from wm_news,
     wm_user
where wm_news.user_id = wm_user.id;

select count(wn.id)
from wm_news wn
         left outer join wm_user wu on wn.user_id = wu.id;