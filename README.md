
# AutoSave

## 設定

`:AutoSaveToggle` で切り替えることができる

AutoSave を有効にする(デフォルト)

	let g:autosave = 1


特定の拡張子とファイルタイプを開いてるタブは無効にする

	let g:autosave_exclude_list = { 'vim':1, 'wiki':1 }
	
	" または
	let g:autosave_exclude_list = {}
	let g:autosave_exclude_list.vim = 1
	let g:autosave_exclude_list.wiki = 1



