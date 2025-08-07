local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("tst", {
        t({"#[cfg(test)]", "fn test_"}),
        i(1, ""),
        t({"() {", "\t"}),
        i(2, ""),
        t({"", "}"}),
    }),

    s("fn", {
        t({"fn "}),
        i(1, ""),
        t({"("}),
        i(2, ""),
        t({") ->"}),
        i(3, "()"),
        t({"{", "\t"})
        i(4, "")
        t({"", "}"}),
    }),
}
