FROM debian:bookworm-slim

# Set working directory
WORKDIR /root/develop

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install rustup and Rust (default toolchain)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set environment variables for cargo and rustup
ENV CARGO_HOME=/root/.cargo
ENV RUSTUP_HOME=/root/.rustup
ENV PATH=$CARGO_HOME/bin:$PATH

# Verify installation by printing rustc version
RUN rustc --version

# Default command
CMD ["/bin/bash"]
