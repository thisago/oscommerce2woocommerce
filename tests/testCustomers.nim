#[
  Created at: 08/31/2021 21:56:51 Tuesday
  Modified at: 09/28/2021 06:34:04 PM Tuesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

import std/[unittest, strformat]
import oscommerce2woocommerce

const osCommerceUser = OsCommerceUser(
  customers_id: 10,
  customers_gender: "m",
  customers_firstname: "John",
  customers_lastname: "Doe",
  customers_dob: "1950-1-1 00:00:00",
  customers_email_address: "example@example.com",
  customers_default_address_id: 1,
  customers_telephone: "123456789",
  customers_fax: "",
  customers_password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:aa",
  customers_newsletter: "1",
  customers_activation_code: "NULL",
  customers_active_status: "1",
  customers_notes: "Hello World!",
  address: OsCommerceUserAddress(
    address_book_id: 1,
    customers_id: 1,
    entry_gender: "m",
    entry_company: "Company of Johns",
    entry_firstname: "John",
    entry_lastname: "Doe",
    entry_street_address: "Street of Johns",
    entry_suburb: "suburb",
    entry_postcode: "12345678",
    entry_city: "City of Johns",
    entry_state: "State of Johns",
    entry_country_id: 30,
    entry_zone_id: 0,
    entry_street_address2: "",
    entry_street_address3: ""
  )
)

suite "customers":
  let wooCommerceUser = osCommerceUser.toWoo()
  test "First name":
    check wooCommerceUser.first_name == osCommerceUser.customers_firstname
  test "Last name":
    check wooCommerceUser.last_name == osCommerceUser.customers_lastname
  test "Email":
    check wooCommerceUser.email == osCommerceUser.customers_email_address
  test "Username":
    check wooCommerceUser.username == "thiago"
  test "Billing first name":
    check wooCommerceUser.billing.first_name == osCommerceUser.customers_firstname
  test "Billing last name":
    check wooCommerceUser.billing.last_name == osCommerceUser.customers_lastname
  test "Billing email":
    check wooCommerceUser.billing.email == osCommerceUser.customers_email_address
  test "Billing phone":
    check wooCommerceUser.billing.phone == osCommerceUser.customers_telephone
  test "Billing company":
    check wooCommerceUser.billing.company == ""
  test "Billing address_1":
    check wooCommerceUser.billing.address_1 == osCommerceUser.address.entry_street_address
  test "Billing address_2":
    check wooCommerceUser.billing.address_2 == ""
  test "Billing city":
    check wooCommerceUser.billing.city == osCommerceUser.address.entry_city
  test "Billing state":
    check wooCommerceUser.billing.state == ""
  test "Billing postcode":
    check wooCommerceUser.billing.postcode == osCommerceUser.address.entry_postcode
  test "Billing country":
    check wooCommerceUser.billing.country == "BR"
  test "Shipping first name":
    check wooCommerceUser.shipping.first_name == osCommerceUser.customers_firstname
  test "Shipping last name":
    check wooCommerceUser.shipping.last_name == osCommerceUser.customers_lastname
  test "Shipping company":
    check wooCommerceUser.shipping.company == ""
  test "Shipping address_1":
    check wooCommerceUser.shipping.address_1 == osCommerceUser.address.entry_street_address
  test "Shipping address_2":
    check wooCommerceUser.shipping.address_2 == ""
  test "Shipping city":
    check wooCommerceUser.shipping.city == osCommerceUser.address.entry_city
  test "Shipping state":
    check wooCommerceUser.shipping.state == ""
  test "Shipping postcode":
    check wooCommerceUser.shipping.postcode == osCommerceUser.address.entry_postcode
  test "Shipping country":
    check wooCommerceUser.shipping.country == "BR"
