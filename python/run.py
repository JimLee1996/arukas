
import arukas
import pymysql

from config import *

# Fetch containers from arukas.io
containers = arukas.reshape(arukas.containers(token, secret))

# Connect to DB
db = pymysql.connect(**db_config)
cursor = db.cursor()

add_sql = "INSERT INTO containers(app_id, arukas_domain, status_text, ip, ss_port, kcp_port) " \
          "VALUES ('%s', '%s', '%s', '%s', '%d', '%d')"
del_sql = "TRUNCATE TABLE containers"

try:
    cursor.execute(del_sql)
    db.commit()

    for x in containers:
        data = (x['app_id'], x['arukas_domain'], x['status_text'], x['ip'], x['ss_port'], x['kcp_port'])

        try:
            cursor.execute(add_sql % data)
            db.commit()
        except:
            db.rollback()

except:
    db.rollback()


db.close()
