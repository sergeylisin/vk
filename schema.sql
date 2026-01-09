CREATE TABLE last_connect(ts number,user_id number,is_connected boolean,last_seen number,primary key(ts,user_id));
CREATE TABLE wall(ts number,record_id number,best_friends_only number,view_count number,primary key(ts,record_id));
