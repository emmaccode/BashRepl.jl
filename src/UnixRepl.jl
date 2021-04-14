module UnixRepl
using ReplMaker
function parse_command(s)
    dims = split(s, " ")
    command = dims[1]
    if length(dims) != 1
        param = dims[2]
    end
    if command == "cd"
        cd(param)
    elseif command == "ls"
        readdir()
    elseif command == "pwd"
        pwd()
    else
        try
            run(Cmd(s))
        catch
            println("Could not determine command")
        end
    end
end
initrepl(
            parse_command;
            prompt_text="bash> ",
            prompt_color=:yellow,
            start_key='[',
            mode_name="Bash"
        )
end
