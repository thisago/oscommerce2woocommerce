#[
  Created at: 08/31/2021 21:51:13 Tuesday
  Modified at: 09/01/2021 08:55:56 PM Wednesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

from std/strutils import find
from std/strformat import fmt
from std/tables import toTable, `[]`

import oscommerce2woocommerce/base
export base

const countryCode = {
  30: "BR",
  31: "US"
}.toTable

func toWoo*(user: OsCommerceUser): WooCommerceUser =
  result.first_name = user.customers_firstname
  result.last_name = user.customers_lastname
  result.email = user.customers_email_address
  result.username = result.email[0..<result.email.find "@"]
  block billing:
    result.billing.first_name = result.first_name
    result.billing.last_name = result.last_name
    result.billing.email = result.email
    result.billing.phone = user.customers_telephone
    result.billing.address_1 = user.address.entry_street_address
    result.billing.city = user.address.entry_city
    result.billing.postcode = user.address.entry_postcode
    result.billing.country = countryCode[user.address.entry_country_id]
