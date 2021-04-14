module BashRepl
using Pkg
function parse_bash_command(s)
    dims = split(s, " ")
    command = dims[1]
    if length(dims) != 1
        param = dims[2]
    end
    if command == "cd"
        cd(param)
    elseif command == "ls"
        readdir();
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

function install()
    Pkg.add("ReplMaker")
    home = homedir()
    startup = string(home, "/.julia/config/startup.jl")
    try
        touch(startup)
    catch
        mkdir(string(home,"/.julia/config"))
        touch(startup)
    end
    open(startup, "w") do io
        write(io, "# BashRepl (programmed by emmett boudreau)\n")
        write(io, "\n")
           write(io, "using BashRepl\n")
           write(io, "using ReplMaker\n")
           write(io, "atreplinit() do repl\n")
               write(io, "try\n")
               write(io, "@eval using ReplMaker\n")
               write(io, "@async initrepl(\n")
               write(io, "parse_bash_command;\n")
               write(io, "prompt_text=\"bash> \",\n")
               write(io, "prompt_color = :yellow,\n")
               write(io, "start_key = '[',\n")
               write(io, "mode_name = \"Bash Mode\");")
               write(io, "catch\n end\n end\n")

    end;

end
#using BashRepl
#atreplinit() do repl
#    try
#        @eval using ReplMaker
#        @async initrepl(
#            parse_command,
#            prompt_text="bash> ",
#            prompt_color=:yellow,
#            start_key='[',
#            mode_name="Bash Mode"
#        );
#        catch
#        end
#    end
export parse_bash_command

end
