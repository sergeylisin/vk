import vk
import schedule
import time
import vk_config
import sqlite3
from functools import partial


api = vk.DirectUserAPI(user_login=vk_config.user_login,user_password=vk_config.user_password,v='5.131')
con = sqlite3.connect('vk.db')

def get_data(api,con):
#    global api
    current_ts = int(time.time())
    print(current_ts)
    try:
        wall = api.wall.get()
        for i in vk_config.users:
            user = api.users.get(user_ids=i,fields='online,last_seen')[0]
            con.execute ('insert into last_connect values(?,?,?,?)', (current_ts,user['id'],user['online'],user['last_seen']['time']))
        
        wall = api.wall.get()['items']
        
        con.executemany('insert into wall values(?,?,?,?)',map(lambda x: (current_ts,x['id'],x.get('best_friends_only'), x['views']['count'] if 'views' in x else None) ,wall))
        con.commit()
    except TimeoutError as e: 
        print(e)
        api = vk.DirectUserAPI(user_login=vk_config.user_login,user_password=vk_config.user_password,v='5.131')
    except Exception as e:
        print(e)
        pass


def clean_data(api,con):
    print('clean')
    current_ts = int(time.time())
    con.execute('delete from last_connect where ts<'+str(current_ts-31*86400))
    con.execute('delete from wall where ts<'+str(current_ts-31*86400))
    con.commit()

if __name__ == '__main__':
    schedule.every(15).seconds.do(partial(get_data,api=api,con=con))
    schedule.every().hour.do(partial(clean_data,api=api,con=con))
    while True:
    #    get_data()
        schedule.run_pending()
        time.sleep(1)

