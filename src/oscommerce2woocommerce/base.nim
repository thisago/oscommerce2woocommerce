#[
  Created at: 08/31/2021 23:04:55 Tuesday
  Modified at: 08/31/2021 11:40:35 PM Tuesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

type
  WooData* = object
    key*: WooKey
    value*: string
    discarded*: bool
  WooKey* = tuple
    database, column: string
