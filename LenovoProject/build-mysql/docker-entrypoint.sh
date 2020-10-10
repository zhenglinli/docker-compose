#!/bin/bash

mysql -uroot -p123456 << EOF

use lenovoproject1;
source /usr/local/lenovo-schema.sql;
source /usr/local/lenovo-data.sql;