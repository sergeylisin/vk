with qx as (select record_id,view_count,min(ts) view_ts from wall where record_id in (select record_id from wall group by record_id order by 1) group by record_id,view_count),
q_ts as (select ts,is_connected,lag(ts,1) over(order by ts) prev,lag(ts,-1) over(order by ts) next,user_id from last_connect where user_id=81173284)
select qx.record_id,q_ts.ts,q_ts.next-q_ts.prev
from qx join q_ts on qx.view_ts between Q_TS.TS-5 and Q_TS.TS+5 where q_ts.is_connected=1
and record_id>(select max(record_id) from wall)-15
order by 2,1;


with qx as (select record_id,view_count,min(ts) view_ts from wall where record_id in (select record_id from wall group by record_id order by 1) group by record_id,view_count),
q_ts as (select ts,is_connected,lag(ts,1) over(order by ts) prev,lag(ts,-1) over(order by ts) next,user_id from last_connect where user_id=771579409)
select qx.record_id,q_ts.ts,q_ts.next-q_ts.prev
from qx join q_ts on qx.view_ts between Q_TS.TS-5 and Q_TS.TS+5 where q_ts.is_connected=1
and record_id>(select max(record_id) from wall)-20
order by 2,1;


with q_ts as (select ts,lag(ts,1) over(order by ts) prev,lag(ts,-1) over(order by ts) next,user_id from last_connect where user_id=81173284),
q2 as (select q_ts.ts,t1.user_id,is_connected from last_connect t1 join q_ts on t1.ts=q_ts.prev and t1.user_id=q_ts.user_id),
q3 as (select q_ts.ts,t1.user_id,is_connected from last_connect t1 join q_ts on t1.ts=q_ts.next and t1.user_id=q_ts.user_id),
q4 as (select row_number() over(order by q2.ts) rn,l1.ts,l1.user_id from last_connect l1 join q2 on l1.ts=q2.ts and l1.user_id=q2.user_id where l1.is_connected=1 and q2.is_connected=0),
q5 as (select row_number() over(order by q3.ts) rn,l1.ts,l1.user_id from last_connect l1 join q3 on l1.ts=q3.ts and l1.user_id=q3.user_id where l1.is_connected=1 and q3.is_connected=0),
t1 as (select q4.rn,q4.ts start_ts,q5.ts end_ts from q4 join q5 on q4.rn=q5.rn)
select t1.start_ts,t1.end_ts,t1.end_ts-t1.start_ts
from t1
where 1696154840 between t1.start_ts and t1.end_ts
;


with q_ts as (select ts,lag(ts,1) over(order by ts) prev,lag(ts,-1) over(order by ts) next,user_id from last_connect where user_id=77842040),
q2 as (select q_ts.ts,t1.user_id,is_connected from last_connect t1 join q_ts on t1.ts=q_ts.prev and t1.user_id=q_ts.user_id),
q3 as (select q_ts.ts,t1.user_id,is_connected from last_connect t1 join q_ts on t1.ts=q_ts.next and t1.user_id=q_ts.user_id),
q4 as (select row_number() over(order by q2.ts) rn,l1.ts,l1.user_id from last_connect l1 join q2 on l1.ts=q2.ts and l1.user_id=q2.user_id where l1.is_connected=1 and q2.is_connected=0),
q5 as (select row_number() over(order by q3.ts) rn,l1.ts,l1.user_id from last_connect l1 join q3 on l1.ts=q3.ts and l1.user_id=q3.user_id where l1.is_connected=1 and q3.is_connected=0),
t1 as (select q4.rn,q4.ts start_ts,q5.ts end_ts from q4 join q5 on q4.rn=q5.rn)
select t1.start_ts,t1.end_ts,t1.end_ts-t1.start_ts
from t1
where 1695651200 between t1.start_ts and t1.end_ts
;


select * from last_connect where user_id=81173284 order by ts;

select * from wall where record_id=2046 order by ts;

select record_id,max(view_count) from wall where best_friends_only=1 group by record_id order by 1;

select record_id,max(view_count) from wall group by record_id order by 1;

select record_id,min(ts) from wall where best_friends_only=1 group by record_id order by 1;

select record_id,max(view_count),min(ts) from wall group by record_id order by 1;

with qx as (select view_count,min(ts) view_ts from wall where record_id=1917 group by view_count)
select * from qx join tx on qx.view_ts between tx.start_ts and end_ts or qx.view_ts between tx.end_ts and start_ts;;

select view_count,min(ts) view_ts from wall where record_id=1923 group by view_count;

select record_id,max(ts) from wall group by record_id order by 1;

1684960286

1684960286-1684960428