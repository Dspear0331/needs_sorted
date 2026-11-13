sudo dnf remove -y podman-docker podman runc containerd

sudo dnf install -y dnf-plugins-core

sudo dnf  config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable --now docker
