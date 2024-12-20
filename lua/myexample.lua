local M = {} -- モジュール名を宣言

M.config = {
	message = "Hello World",
	first_name = "yamada",
	nickname = "taro",
}

M.hello_name = function()
	print(M.config.message .. M.config.first_name)
end

M.hello_nick = function()
	print(M.config.message .. M.config.nickname)
end

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {}) -- plugin マネージャから引き受けた config の項目を M.config に結合
	print(M.config.message) --print で結果を表示する
	vim.api.nvim_create_user_command("HelloName", M.hello_name, {}) -- それぞれの関数をVimコマンドに登録する
	vim.api.nvim_create_user_command("HelloNick", M.hello_nick, {})
end

return M
