
# append these lines to your ~/.bashrc 
# this should work in most cases:
# cat append_to_bashrc.sh >> ~/.bashrc

# if this is an interactive shell...
if tty
then
    # show the current ssh-agent environment ( this is optional )
    env | grep SSH
    # if there is no ssh-agent running...
    if ! ssh-add -l
    then
        # start a new ssh-agent and save the environment
        ssh-agent > ~/.ssh-agent-env
        # load the ssh environment variables into the current shell
        # (the dot is a shortcut for the `source` command and makes
        # the .ssh-agent-env script run in the current shell's
        # variable scope as opposed to in a subshell)
        . ~/.ssh-agent-env
        # add your default key to the agent (this is what prompts for your
        # passphrase the first time you open a shell)
        ssh-add
    else
        # there is already an ssh-agent running, just load the environment
        # from the saved file
        [ -f ~/.ssh-agent-env ] && . ~/.ssh-agent-env > /dev/null
        # show the keys in the agent ( this is optional )
        ssh-add -l
    fi
fi

