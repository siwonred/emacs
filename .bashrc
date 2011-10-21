export CLICOLOR='true'
# export LSCOLORS="gxfxcxdxbxegedabagacad"

# alias hanterm='hanterm-xf -geom 80x60 -bg black -fg white -cr yellow -sl 20000'

# function set_prompt_color ()
# {
#    if [ -z "$prompt_fg" ]; then prompt_fg=91; fi
#     let "prompt_fg=((prompt_fg-91)+1)%(98-91)+91"
# }

# [ -z "$PROMPT_COMMAND" ] && PROMPT_COMMAND="set_prompt_color"
# case "$PROMPT_COMMAND" in
# *set_prompt_color*) ;;
# *)
#     PROMPT_COMMAND="$PROMPT_COMMAND; set_prompt_color"
#     ;;
# esac

# 2008.9.19.
# print_rc='`exitcode=$?; if [ $exitcode != "0" ]; then echo "\[\033[38m\033[48m\][$exitcode]\[\033[0m\] "; fi`'

# 2008.9.25.
# prompt_shortdate='\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\D{%a%H:%M:%S} '
# prompt_longdate='\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\D{%m/%d %H:%M:%S} '
# prompt_longdate='\[\033[${prompt_fg}m\]\D{%m/%d %H:%M:%S} '
# prompt_shortdir='\[\033[38;5;78m\033[1m\].../\W'
# prompt_shortdir='\[\033[38;5;78m\033[1m\]$prompt_abbrevdir'
# prompt_longdir='\[\033[38;5;202m\033[1m\]\w'
# prompt_longdir='\[\033[1m\]\w'

# prompt_dollar='\[\033[0m\]\$\[\033[0m\] '

# short_PS1=$print_rc$prompt_shortdate$prompt_shortdir$prompt_dollar
# long_PS1=$print_rc$prompt_longdate$prompt_longdir$prompt_dollar
# PS1=$long_PS1

#-------------------------------------------------
# Added 2008.8.22.
function set_prompt_color ()
{
    if [ -z "$prompt_fg" ]; then prompt_fg=196; fi
    let "prompt_fg=((prompt_fg-196)+1)%(232-196)+196"
}

[ -z "$PROMPT_COMMAND" ] && PROMPT_COMMAND="set_prompt_color"
case "$PROMPT_COMMAND" in
*set_prompt_color*) ;;
*)
    PROMPT_COMMAND="$PROMPT_COMMAND; set_prompt_color"
    ;;
esac

# 2008.9.19.
print_rc='`exitcode=$?; if [ $exitcode != "0" ]; then echo "\[\033[38;5;196m\033[48;5;226m\][$exitcode]\[\033[0m\] "; fi`'

host=`uname -n`

prompt_host='\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\u $host '

# 2008.9.25.
prompt_shortdate='\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\D{%a%H:%M:%S} '
prompt_longdate='\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\D{%m/%d %a %H:%M:%S} '
# prompt_shortdir='\[\033[38;5;78m\033[1m\].../\W'
prompt_shortdir='\[\033[38;5;78m\033[1m\]$prompt_abbrevdir'
prompt_longdir='\[\033[38;5;202m\033[1m\]\w'
prompt_dollar='\[\033[0m\033[38;5;163m\]\$\[\033[0m\] '

short_PS1=$print_rc$prompt_shortdate$prompt_shortdir$prompt_dollar
long_PS1=$print_rc$prompt_longdate$prompt_longdir$prompt_dollar
PS1=$print_rc$prompt_host$prompt_longdir$prompt_dollar


alias short='PS1=$short_PS1'
alias long='PS1=$long_PS1'


# PS1=${print_rc}'\[\033[38;5;${prompt_fg}m\033[48;5;236m\]\D{%m/%d %a %H:%M:%S} ${prompt_dirtype}\[\033[0m\033[38;5;163m\]\$\[\033[0m\] '

#-------------------------------------------------
# Added 2008.8.25.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


alias ll='ls -l'
alias la='ls -A'
alias lh='ls -lh'

PATH=$PATH:/Users/siwonred/Apps/MacVim-7_3-53:/Applications/MAMP/Library/bin:/Users/siwonred/Apps/sshfs-binaries

alias gvim='mvim'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

export EC2_HOME=/Users/siwonred/Aws/ec2-api-tools-1.4.2.4
export PATH=$PATH:$EC2_HOME/bin

export EC2_PRIVATE_KEY=/Users/siwonred/Aws/pk-C566B7P2S5DS3X6C3SMYNB3WJUVOIQMQ.pem
export EC2_CERT=/Users/siwonred/Aws/cert-C566B7P2S5DS3X6C3SMYNB3WJUVOIQMQ.pem

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

export TERM=xterm
