# BashRepl.jl
Quick-access Bash REPL for Julia! What this REPL does is make Julia a lot more effective for basic file operations by binding Julian calls to their bash command counter-parts. As of 0.1.0, there are only basic directory operations, but this will be expanded further until it is entirely possible to use Bash from Julia. It is easy to see why this can be useful, it can be a lot more difficult to ls and cd around using Julian methods rather than classsic terminal commands. This REPL can be quickly initialized with an open left bracket. It also works in Windows, so in many ways, using this package in Windows could have the potential to make using Julia on that operating system a lot easier, as well. There is still a lot to come, in that regard!
## Installation Instructions
The installation of this REPL is pretty simple. An important thing to note is that there are a few specifications to follow in order for the EASY way to actually work.
- The BashRepl.jl package must be added into your GLOBAL environment, and called there as well. Do not try to run the BashRepl.install() function inside of a virtual environment!
- Your Julia files are in their default location at ~/.julia or C:/Users/UNAME/.julia.
If both of these requirements are met, you an add the package with Pkg and 
```julia
julia

julia> ]

pkg> add https://github.com/emmettgb/BashRepl.jl

pkg> BACKSPACE

julia> using BashRepl

julia> BashRepl.install()

```
## After installing
After installation, you should be able to restart your Julia session and utilize the new Bash REPL.
```bash
emmett@y700:~/dev$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.6.0 (2021-03-24)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

REPL mode Bash Mode initialized. Press [ to enter and backspace to exit.
bash> ls
15-element Vector{String}:
 "BashRepl"
 "Chifi"
 "Leta"
 "Neptune.jl"
 "SuperFrames.jl"
 "UnixNavigation"
 "UnixRepl"
 "assets"
 "hi.txt"
 "lathe.ai"
 "myfile.txt"
 "node_modules"
 "notebooks"
 "package-lock.json"
 "rafly"

bash> cd assets

bash> ls
5-element Vector{String}:
 "lathebooks.png"
 "lathegingerbread.png"
 "lathelogo.png"
 "lathethinmint.png"
 "logo.png"

bash> 


```
