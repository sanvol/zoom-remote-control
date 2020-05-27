# Zoom remote control exploitation

Small project for ´Special Course in Information Security´ at Aalto University

[Slides](presentation/Zoom_project_slides.pdf)

## Attack

### Mac

`./getShell.sh` # starts http server and netcat

`python3 ksi.py --os=MacOS` # starts keystroke injection on the desired OS, probably the same for Linux and MacOS 


### Linux

[Steps/commands](/Linux/victim/commands.md)

ksi scripts partially automate the above using pynput library.

`./getShell.sh` # starts http server and netcat

`python3 ksi_terminal.py` # keystroke injection stump to just open a terminal through zoom remote control

`python3 ksi_linux_ssh.py` # utilizes ssh access to perform the attack
