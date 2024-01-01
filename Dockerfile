FROM debian

# XDG_RUNTIME_DIR: used by many desktop services, for example WAYLAND_DISPLAY, dbus, pulseaudio
# WLR_BACKENDS: for headless backend
# WLR_BLIINPUT_NO_DEVICES: from wayvnc document
ENV XDG_RUNTIME_DIR=/run/user/1000 \
    WLR_BACKENDS=headless          \
    WLR_LIBINPUT_NO_DEVICES=1

# novnc_proxy require "ps" tool
RUN export DEBIAN_FRONTEND="noninteractive" \
    && sed -i "s@deb.debian.org@mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list.d/debian.sources \
    && apt-get update \
    && apt-get install --yes --no-install-recommends \
        libegl1-mesa libgles2-mesa mesa-vulkan-drivers \
        sway wayvnc novnc procps wlr-randr dbus fonts-noto \
        man-db vim curl wget \
        foot firefox-esr \
    && useradd -m -s /bin/bash user \
    && mkdir -p ${XDG_RUNTIME_DIR} && chown -R user:user ${XDG_RUNTIME_DIR}

# gnome-calculator need Xwayland

# CMD shell script
COPY run /usr/local/bin/run
USER user
WORKDIR /home/user
EXPOSE 6080
CMD ["run"]
