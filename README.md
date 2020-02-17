#How to use


Run *./setup.sh* to install the plugins

가끔 

git submodule foreach git pull origin master

를 통해서 서브모듈을 최신으로 맞춰주기


# Included Plugins

1. **auto-pairs** : 자동으로 괄호 짝을 맞춰줌
2. **vim-surround** : 요상한 단축키로 단어에 따옴표 / 괄호 씌우기 - http://www.vim.org/scripts/script.php?script_id=1697
3. **vim-snipmate** : inc(tab) => #include <stdio.h>, main(tab) => int main(int argc, const char * argv[])... 등등으로 IDE에서나 볼 수 있던 고급 auto-completion 기능을 vim에서도! (vim-snippets에 auto-completion 리스트가 있음)


# Syntax Files

1. **html5-vim** : HTML5 - HTML과 JavaScript
2. **vim-javascript** : JavaScript
3. **vim-solidity** : Solidity
4. **vim-go** : Golang
5. **vim-rust** : Rust

# Dependencies
1. **tlib_vim** : Snipmate에 필요
2. **vim-addon-mw-utils** : Snipmate에 필요
3. **vim-snippets** : Snipmate에서 사용하는 snippets파일들
