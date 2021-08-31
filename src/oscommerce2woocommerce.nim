#[
  Created at: 08/31/2021 21:50:31 Tuesday
  Modified at: 08/31/2021 11:35:00 PM Tuesday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
]#

import oscommerce2woocommerce/parser
export parser

{.experimental: "codeReordering".}

when isMainModule:
  main()

proc main =
  echo "Hello World!"
