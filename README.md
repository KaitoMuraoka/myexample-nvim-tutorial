# myexample

これは↓の記事を参考に作成したNeovimのプラグインです。

https://zenn.dev/vim_jp/articles/dbafe015ce9a4e

## Setup

- Lazy

```lua
return {
    "KaitoMuraoka/myexample-nvim-tutorial",
    config = {
      message = "Good Morning!",
      first_name = "Kaito Muraoka",
      nickname = "とんとんぼ",
	},
    cmd = {
      "HelloName",
      "HelloNick",
      "HelloLoginuser",
     }
}
```
