#git shortcuts for every os
alias gitstat='git status -uno'
alias gcm='git commit -m'
alias gdc='git --no-pager diff --color-words'
alias gam='git add -u'
alias gap='git add --patch'

# Create a fancy promt
function color_my_prompt {
    local __user_and_host="\[\033[32m\]\u@\h"
    local __cur_location="\[\033[33m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]\n$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

function cleanbranch
{
	br=$1
	echo clean up $br
	git checkout $br || { echo 'my_command failed' ; return 1; } 
	git rebase master ||  { echo 'my_command failed' ; return 1; } 	
	git checkout master ||  { echo 'my_command failed' ; return 1; }  
	git branch -d $br
}

# nicer colors, should be used everywhere maybe
if [ -f ~/configs/sol.dark ]; then
	. ~/configs/sol.dark
fi
