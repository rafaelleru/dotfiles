# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme


# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"

# separator dashes size
function afmagic_dashes {
	[[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
		&& echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
		|| echo $COLUMNS
}


function git_info() {
	p=$(git_prompt_info)

	if [[ -n $p ]]; then
		p="%{$reset_color%}[$FG[002]$p%{$reset_color%}{$(git_prompt_short_sha)}"

		if [[ -n $(git_commits_behind) || -n $(git_commits_ahead) ]]; then
			p="$p $(git_commits_ahead)$(git_commits_behind)"
		fi

		p="$p]%{$reset_color%}"
	fi
	
	echo $p
}

function idti_env() {
	if [[ -n ${IDTHEFT_TESTS_TARGET} ]]; then
		echo "[${IDTHEFT_TESTS_TARGET}]"
	fi
}


# primary prompt
PS1='$FG[237]${(l.$(afmagic_dashes)..-.)}%{$reset_color%}
$FG[240]%m @%{$reset_color%}% $FG[032] %~$(git_info)%{$reset_color%}$(hg_prompt_info)
%n $FG[105]%(!.#.»)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1+='${return_code}'
RPS1+=' %t'
RPS1+=' $(idti_env)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="$FG[001]-"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="$FG[002]+"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="$FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
