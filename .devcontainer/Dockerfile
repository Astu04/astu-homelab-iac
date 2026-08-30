FROM mcr.microsoft.com/devcontainers/base:noble

ARG BETTERLEAKS_VERSION=1.8.1 # ${BETTERLEAKS_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Base System Utilities & Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    sshpass \
    unzip \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# 2. Install OpenTofu
RUN curl -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh \
    && chmod +x install-opentofu.sh \
    && ./install-opentofu.sh --install-method deb \
    && rm install-opentofu.sh

# 3. Install Betterleaks (Pinned Stable Version)
RUN curl -sSL https://github.com/betterleaks/betterleaks/releases/download/v${BETTERLEAKS_VERSION}/betterleaks_${BETTERLEAKS_VERSION}_linux_x64.tar.gz | tar -xz -C /usr/local/bin betterleaks

# 4. Install TFLint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# 5. Install Python Security & Automation Tools
RUN pip3 install --no-cache-dir --break-system-packages \
    ansible \
    checkov \
    pre-commit
