# Purpose
This is to make my life easier grading other students' work. Containers are powerful because they offer isolation. Any risky packages can cause headaches down the line, so an isolated environment is needed. The best part is the container is running the GUI application AND playing audio! Took me a while to figure these out with ChatGPT!!!

# Dependencies needed:
podman, podman-compose, SFML3.0, pulseaudio-utils
pulseaudio-utils is so the host can get a pulse directory mounted.

## Installation:
``` sudo apt update
    sudo apt install podman podman-compose pulseaudio-utils
```

## Installation for SFML:
Visit this link: https://www.sfml-dev.org/download/sfml/3.0.2/

and download GCC- Linux 64-bit, and put it in the directory where all Dockerfiles and podman-compose files exist for this project.

# Using Podman
First run ```podman build -t sfml-gui .```, wait for it to build, and then run ```docker-compose up -d```, and then ```./exec.sh``` to get inside of the container to run shell commands.
