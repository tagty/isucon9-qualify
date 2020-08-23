#!/bin/bash
set -ex

echo 'deploy to isucon1'
ssh isucon1 "export MYSQL_HOST=ec2-52-69-203-123.ap-northeast-1.compute.amazonaws.com && cd /home/isucon/isucari && git pull && cd /home/isucon/isucari/webapp/ruby && /home/isucon/local/ruby/bin/bundle install --path=.bundle && sudo systemctl restart mysql.service && sudo systemctl restart isucari.ruby.service && sudo systemctl restart nginx.service && sudo sysctl -p"
echo 'deploy done'

echo 'deploy to isucon2'
ssh isucon2 "cd /home/isucon/isucari && git pull && cd /home/isucon/isucari/webapp/ruby && /home/isucon/local/ruby/bin/bundle install --path=.bundle && sudo systemctl restart mysql.service && sudo systemctl restart isucari.ruby.service && sudo systemctl restart nginx.service && sudo sysctl -p"
echo 'deploy done'
