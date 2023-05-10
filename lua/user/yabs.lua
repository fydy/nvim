local ok, yabs = pcall(require, "yabs")
if not ok then
    return
end
yabs.setup {
    languages = {
        python = {
            tasks = {
                run = {
                    command = 'python %',
                    output = 'buffer',
                },
                test = {
                    command = 'python -m unittest %',
                    output = 'buffer',
                },
            },
        },
    },
}