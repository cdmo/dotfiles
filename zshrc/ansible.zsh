alias clusterbuster="ansible -k cluster -m shell -a \"echo 'flush_all' | nc localhost 11211\""
