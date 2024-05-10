
# append these lines to your ~/.bashrc 
# this should work in most cases:
# cat append-to-bashrc.sh >> ~/.bashrc

# first assume there's already an ssh agent running and our
# environment variables in the ~/.ssh-agent-env file are still valid
# (the ssh-add -l below will detect if this is not the case)
[ -f ~/.ssh-agent-env ] && . ~/.ssh-agent-env 

# if this is an interactive shell...
if tty
then
    # if there is no ssh-agent running or our environment variables
    # are invalid (e.g. the agent has been killed or the machine has
    # been rebooted)...
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
    fi
fi

