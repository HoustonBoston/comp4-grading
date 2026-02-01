# Purpose
This is to make my life easier grading other students' work. Containers are powerful because they offer isolation. Any risky packages can cause headaches down the line, so an isolated environment is needed. The best part is the container is running the GUI application AND playing audio! Took me a while to figure these out with ChatGPT!!!

From what I understand, the host pulseaudio is running and listening on a unix socket, and mounting that as a volume on the container to /tmp/pulse, and when the container writes to /tmp/pulse, it plays the sound on the host machine.

# Dependencies needed:
podman, podman-compose, SFML3.0, pulseaudio-utils
pulseaudio-utils is so the host can get a pulse directory mounted.

## Installation on the host:
``` sudo apt update
    sudo apt install podman podman-compose pulseaudio-utils
```

## Installation for SFML:
Visit this link: https://www.sfml-dev.org/download/sfml/3.0.2/
and download GCC- Linux 64-bit, and put it in the directory where all Dockerfiles and podman-compose files exist for this project.
Then you want to extract it by running ```tar -xvf <filename>.tar.gz```

# Using Podman
First run ```./podman-vol-create.sh```, then ```./build```, wait for it to build, and then run ```./compose up```, and finally ```./exec.sh``` to get inside of the container to run shell commands.

## Copying files/dirs over to container
Run ```podman cp /path/to/file container_name:/path/to/dest```
