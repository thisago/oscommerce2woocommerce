#[
  Created at: 08/31/2021 21:51:13 Tuesday
  Modified at: 08/31/2021 11:42:43 PM Tuesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

from std/strformat import fmt
from std/tables import toTable, `[]`

import oscommerce2woocommerce/base
export base

using
  s: string
  data: tuple[key, value: string]

const wooUserField = {
  "customers_id": (
    key: (
      database: "wp_users",
      column: "ID"
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_gender": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = ""
    )
  ),
  "customers_firstname": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_lastname": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_dob": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_email_address": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_default_address_id": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_telephone": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_fax": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_password": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_newsletter": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_activation_code": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_active_status": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
  "customers_notes": (
    key: (
      database: "",
      column: ""
    ),
    parse: (func(s): string =
      result = s
    )
  ),
}.toTable

func toWooUser*(data): WooData =
  try:
    let
      wooField = wooUserField[data[0]]
      parsed = wooField.parse data[1]

    if parsed.len > 0:
      result.key = wooField.key
      result.value = parsed
    else:
      result.discarded = true
  except:
    doAssert false, fmt"Invalid OsCommerce key: '{data[0]}'"
