module UnixRepl
using ReplMaker
Base.atreplinit() do repl
    repl.interface = REPL.setup_interface(repl)
    repl.interface.modes[1].prompt =
                 Pkg.REPLMode.promptf()[1:end-6] * " julia> "
end
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
atreplinit() do repl
    try
        @eval using ReplMaker
        @async initrepl(
            parse_command;
            prompt_text="bash> ",
            prompt_color=:yellow,
            start_key='[',
            mode_name="Bash"
        )
        catch
    end
    end
end
