#!/bin/bash

NUM_LINES=10
AUTH_LOG="/var/log/auth.log"

echo "Son $NUM_LINES başarısız SSH giriş denemeleri:"

sudo grep -E "authentication failure" $AUTH_LOG | tail -n $NUM_LINES
