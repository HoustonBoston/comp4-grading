# Purpose:
This is to make my life and others' easier grading other students' work. Containers are powerful because they offer isolation. Any risky packages can cause headaches down the line, so an isolated environment is needed. The best part is the container is running the GUI application AND playing audio! Took me a while to figure these out with ChatGPT!!!

From what I understand, the host pulseaudio is running and listening on a unix socket, and mounting that as a volume on the container to /tmp/pulse, and when the container writes to /tmp/pulse, it plays the sound on the host machine.

# Dependencies needed:
## Linux & WSL:
podman, podman-compose, SFML3.0, pulseaudio-utils

pulseaudio-utils is so the host can get a pulse directory mounted.

## Installation on the host Linux & WSL:
``` sudo apt update
    sudo apt install podman podman-compose pulseaudio pulseaudio-utils
```

[For WSL and Linux](#using-podman-linux--wsl-only)

## Installation for SFML:
Visit this link: https://www.sfml-dev.org/download/sfml/3.0.2/
and download GCC- Linux 64-bit, and put it in the directory where all Dockerfiles and podman-compose files exist for this project.
Then you want to extract it by running ```tar -xvf <filename>.tar.gz``` (Provided already so you don't need to download this)

<!-- ## If on WSL:
SFML needs these dependencies
```
sudo apt update &&
sudo apt install \
    libxrandr-dev \
    libxcursor-dev \
    libxi-dev \
    libudev-dev \
    libfreetype-dev \
    libflac-dev \
    libvorbis-dev \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    libboost-all-dev \
    libfreetype-dev
``` -->

add these to .bashrc:
```
export LD_LIBRARY_PATH=~/comp4-grading/SFML-3.0.2/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=~/comp4-grading/SFML-3.0.2/lib/pkgconfig:$PKG_CONFIG_PATH
export CPLUS_INCLUDE_PATH=~/comp4-grading/SFML-3.0.2/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=~/comp4-grading/SFML-3.0.2/lib:$LIBRARY_PATH 
```

# Using Podman (Linux & WSL only):
To allow the display server to communicate, run ```xhost +localhost```

Next, run ```./podman-vol-create.sh```, then ```./build```, wait for it to build, and then run ```./compose up```, and finally ```./exec.sh``` to get inside of the container to run shell commands.

## Copying files/dirs over to container (Linux & WSL only):
Run ```podman cp /path/to/file container_name:/path/to/dest```

### Example: Copying over required files and directories over:
```podman cp SFML-3.0.2/ container_name:/comp4-grading/```
