FROM ubuntu:22.04

RUN apt update && apt install -y \
    qemu-system-x86 \
    sudo wget curl net-tools \
    xfce4 xfce4-goodies tightvncserver \
    xterm dbus-x11 \
    && apt clean

# Download Kali minimal image
RUN mkdir -p /root/kali && cd /root/kali && \
    wget -O kali.qcow2 https://kali.download/base-images/kali-2023.4/kali-linux-base-2023.4-amd64.qcow2

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 5901
CMD ["/run.sh"]
