#[
  Created at: 08/31/2021 21:50:31 Tuesday
  Modified at: 09/23/2021 07:19:29 PM Thursday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

import oscommerce2woocommerce/parser
export parser

{.experimental: "codeReordering".}

when isMainModule:
  from pkg/jsony import fromJson, toJson
  from std/os import fileExists

  from std/httpclient import newHttpClient, post, close, newHttpHeaders, HttpClient
  import std/httpclient
  from std/strformat import fmt
  from std/base64 import nil

  proc main(
    customersJson, addressBookJson: string;
    output = "";
    wooUrl = "";
    wooApiKey = "";
    wooApiSecret = ""
  ) =
    if not customersJson.fileExists:
      quit "The customers json file not exists."
    if not addressBookJson.fileExists:
      quit "The address_book json file not exists."
    try:
      let addresses = addressBookJson.readFile.fromJson seq[OsCommerceUserAddress]
      var
        users = customersJson.readFile.fromJson seq[OsCommerceUser]
        wooUsers: seq[WoocommerceUser]
        useApi = false
      if wooUrl.len > 0 and wooApiKey.len > 0 and wooApiSecret.len > 0:
        useApi = true
      var client: HttpClient
      if useApi:
        client = newHttpClient()
        client.headers = newHttpHeaders({
          "Content-type": "application/json",
          "Authorization": "Basic " & base64.encode fmt"{wooApiKey}:{wooApiSecret}"
        })
        defer: client.close()
      for i in 0..<users.len:
        users[i].address = addresses[i]
        let wooUser = users[i].toWoo()
        if output.len > 0:
          wooUsers.add wooUser
        if useApi:
          echo client.post(wooUrl & "/wp-json/wc/v3/customers", body = wooUser.toJson).code
          # echo "Adding user " & $users[i].customers_id
      if output.len > 0:
        writeFile output, wooUsers.toJson
    except:
      echo "Error: " & getCurrentExceptionMsg()

  import pkg/cligen
  dispatch main

#[
fetch('https://example.com/wp-json/wc/v3/customers', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + btoa('consumer_key:consumer_secret')
  },
  body: JSON.stringify({ "email": "john.doe@example.com", "first_name": "John", "last_name": "Doe", "username": "john.doe", "billing": { "first_name": "John", "last_name": "Doe", "company": "", "address_1": "969 Market", "address_2": "", "city": "San Francisco", "state": "CA", "postcode": "94103", "country": "US", "email": "john.doe@example.com", "phone": "(555) 555-5555" }, "shipping": { "first_name": "John", "last_name": "Doe", "company": "", "address_1": "969 Market", "address_2": "", "city": "San Francisco", "state": "CA", "postcode": "94103", "country": "US" } })
});
]#
