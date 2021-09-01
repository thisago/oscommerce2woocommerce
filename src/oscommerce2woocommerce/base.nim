#[
  Created at: 08/31/2021 23:04:55 Tuesday
  Modified at: 09/01/2021 08:45:06 PM Wednesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

{.experimental: "codeReordering".}

type
  WooData* = object
    key*: WooKey
    value*: string
    discarded*: bool
  WooKey* = tuple
    database, column: string

  OsCommerceUser* = object
    customers_id*, customers_default_address_id*: int
    customers_gender*, customers_firstname*, customers_lastname*,
      customers_dob*, customers_email_address*, customers_telephone*,
      customers_fax*, customers_password*, customers_newsletter*,
      customers_activation_code*, customers_active_status*,
      customers_notes*: string
    address*: OscommerceUserAddress
  OsCommerceUserAddress* = object
    address_book_id*, customers_id*, entry_country_id*, entry_zone_id*: int
    entry_gender*, entry_company*, entry_firstname*, entry_lastname*,
        entry_street_address*, entry_suburb*, entry_postcode*, entry_city*,
        entry_state*, entry_street_address2*, entry_street_address3*: string

  WoocommerceUser* = object
    email*: string
    first_name*, last_name*, username*: string
    billing*: WoocommerceUserBilling
    shipping*: WoocommerceUserShipping
  WoocommerceUserBilling* = object
    first_name*, last_name*, company*, address_1*, address_2*, city*, state*,
      postcode*, country*, email*, phone*: string
  WoocommerceUserShipping* = object
    first_name*, last_name*, company*, address_1*, address_2*, city*, state*,
      postcode*, country*: string
