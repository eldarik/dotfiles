function mosha-stop --description "tear down mosha agent-carrier connections"
    if test (count $argv) -gt 0
        pkill -f "autossh.*$argv[1]"
    else
        pkill -f "autossh -M 0 -f -A -T"
    end
end
