local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("class", {
    t({"class "}),
    i(1, ""),
    t({"("}),
    i(2, ""),
    t({"):", "\t"}),
    t({"def __init__(self):", "\t\t"}),
    i(3, ""),
  }),
}

