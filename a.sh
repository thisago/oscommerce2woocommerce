#!/bin/bash
# curl -X POST http://127.0.0.1/u3/apache/5.8/wp-json/wc/v3/customers \
curl -X POST http://127.0.0.1:3001/wp-json/wc/v3/customers \
    -u ck_f669a0590f054d89fee6a36dfe4cfc2ed06f48d5:cs_1e33fcd228feb3070adc9f17080822b637787464 \
    -H "Content-Type: application/json" \
    -d '{
  "email": "john.doe@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "username": "john.doe",
  "billing": {
    "first_name": "John",
    "last_name": "Doe",
    "company": "",
    "address_1": "969 Market",
    "address_2": "",
    "city": "San Francisco",
    "state": "CA",
    "postcode": "94103",
    "country": "US",
    "email": "john.doe@example.com",
    "phone": "(555) 555-5555"
  },
  "shipping": {
    "first_name": "John",
    "last_name": "Doe",
    "company": "",
    "address_1": "969 Market",
    "address_2": "",
    "city": "San Francisco",
    "state": "CA",
    "postcode": "94103",
    "country": "US"
  }
}'
