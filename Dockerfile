FROM fedora

RUN dnf update -y
# Install dependencies
RUN dnf install -y git libupnp-devel file tar sudo gcc \
openssl-devel avahi-devel sqlite-devel espeak-devel dbus-devel

# Install multirust
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly
RUN git clone https://github.com/rust-lang-nursery/multirust-rs.git
WORKDIR multirust-rs
RUN cargo install
ENV PATH=/root/.cargo/bin:$PATH
RUN rustup-setup -y

# Clone repository
WORKDIR ..
RUN git clone https://github.com/fxbox/foxbox.git

# Build foxbox
WORKDIR foxbox
RUN rustup override add nightly-2016-03-07
RUN cargo build

# Run foxbox
EXPOSE 4000 4242
CMD ["cargo","run"]
