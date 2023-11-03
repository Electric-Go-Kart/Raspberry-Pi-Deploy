FROM linuxcontainers/debian-slim:latest

# Set Working Dir
WORKDIR /app

# Install dependencies
RUN apt update && apt upgrade -y \
	apt install -y git python3 python3-pip python3-venv python3-requests \
	python-is-python3 python3-opencv python3-torch curl gpsd gpsd-clients

# Clone the repositories needed
RUN git clone https://github.com/Electric-Go-Kart/EKartUI && \
    git clone https://github.com/Electric-Go-Kart/APD_deploy && \
    git clone https://github.com/Electric-Go-Kart/VESC && \
    git clone https://github.com/Electric-Go-Kart/GPS && \
    git clone https://github.com/Electric-Go-Kart/APDde_deploy && \
    git clone https://github.com/Electric-Go-Kart/EKartUI_Setup

# Run Scripts
### APD ####
# Setup APD_deploy folder
RUN git clone https://github.com/ultralytics/yolov5

WORKDIR /APD_deploy/yolov5
# REPLACE IF NEEDED (work in progress)#
RUN git checkout remotes/origin/Test1

WORKDIR /APD_deploy
RUN mv detect.py ./yolov5/
RUN mv 528Project/ ./yolov5/
RUN mv run_it.sh ./yolov5/

WORKDIR /APD_deploy/yolov5
RUN mkdir runs

# Setup Coral dependencies
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
    apt-get update && \
    apt-get install libedgetpu1-std -y && \
    apt-get install python3-pycoral -y && \
    pip install -r requirements.txt && \
    pip install numpy --upgrade

### EKartUI ###
WORKDIR /EKartUI