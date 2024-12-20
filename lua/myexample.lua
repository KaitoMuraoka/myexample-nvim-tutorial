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

M.hello_loginuser = function()
	-- lua から bash コマンドを使うには、vim.system() を使用する
	local job1 = vim.system({ "who" }):wait()
	local job2 = vim.system({ "awk", "{print $1}" }, { stdin = job1.stdout }):wait() -- job1 の実行結果をjob2に設定
	vim.iter(vim.gsplit(job2.stdout, "\n")):each(function(line)
		if line ~= "" then
			print(line .. " Hello")
		end
	end)
end

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {}) -- plugin マネージャから引き受けた config の項目を M.config に結合
	vim.api.nvim_create_user_command("HelloName", M.hello_name, {}) -- それぞれの関数をVimコマンドに登録する
	vim.api.nvim_create_user_command("HelloNick", M.hello_nick, {})
	vim.api.nvim_create_user_command("HelloLoginUser", M.hello_loginuser, {})
end

return M
