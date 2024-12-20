local M = {} -- モジュール名を宣言

M.config = {
	message = "Hello World",
}

M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {}) -- plugin マネージャから引き受けた config の項目を M.config に結合
	print(M.config.message) --print で結果を表示する
end

return M
