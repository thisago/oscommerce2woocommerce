#[
  Created at: 08/31/2021 21:50:31 Tuesday
  Modified at: 09/22/2021 04:54:25 PM Wednesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#


import oscommerce2woocommerce/parser
export parser

{.experimental: "codeReordering".}


when isMainModule:
  from pkg/jsony import fromJson, toJson
  from std/os import fileExists

  proc main(customersJson, addressBookJson: string; output = ""; wooApiKey = "";
            wooApiSecret = "") =
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
      if wooApiKey.len > 0 and wooApiSecret.len > 0:
        useApi = true
      for i in 0..<users.len:
        users[i].address = addresses[i]
        let wooUser = users[i].toWoo()
        if output.len > 0:
          wooUsers.add wooUser
        if useApi:
          echo "Adding user " & $users[i].customers_id
      if output.len > 0:
        writeFile output, wooUsers.toJson
    except:
      echo "Error: " & getCurrentExceptionMsg()

  import pkg/cligen
  dispatch main
