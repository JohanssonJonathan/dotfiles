local luaSnip = require("luasnip")
local snippet = luaSnip.snippet
local text = luaSnip.text_node

luaSnip.add_snippets("lua", {

          snippet("hej", {

                    text(print("jajamen")),
          }),
})
