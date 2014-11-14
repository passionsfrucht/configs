PROMPT_COMMAND='history -a'
. ~/configs/gitGeneral.sh


tgit() {
	TortoiseGitProc.exe /command:$1 /path:.
}
