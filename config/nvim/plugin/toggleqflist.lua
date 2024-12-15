-- Función ToggleQFList from the primeagen
--
vim.g.the_primeagen_qf_l = 0
vim.g.the_primeagen_qf_g = 0

function ToggleQFList(global)
    if global then
        if vim.g.the_primeagen_qf_g == 1 then
            vim.g.the_primeagen_qf_g = 0
            vim.cmd("cclose")
        else
            vim.g.the_primeagen_qf_g = 1
            vim.cmd("copen")
        end
    else
        if vim.g.the_primeagen_qf_l == 1 then
            vim.g.the_primeagen_qf_l = 0
            vim.cmd("lclose")
        else
            vim.g.the_primeagen_qf_l = 1
            vim.cmd("lopen")
        end
    end
end
