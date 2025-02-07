local opts = {
    servers = {
        lua_ls = {config=2},
        pyright = {},
    }
}
for server, config in pairs(opts.servers) do
    config.capabilites = 10
    print(server, config.capabilites)
end
