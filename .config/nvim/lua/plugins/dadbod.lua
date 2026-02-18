return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.dbs = {
            { name = 'dev', url = 'mysql://db_aurora_user:85227oq10lrxkiutLJJQUh9tOFOP0iWP92Gz@prod-aurora-mysql-prod-v2-0.cl7axl2skgfg.us-east-1.rds.amazonaws.com:3306/vittude_platform' },
        }
    end,
}
