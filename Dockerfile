# Use official Telegraf image as base
FROM telegraf:1.34.4

# Set working directory
WORKDIR /app

# Install Go (for building binary inside container)
RUN apt-get update && \
    apt-get install -y golang && \
    rm -rf /var/lib/apt/lists/*

# Copy fake_histogram Go source code
COPY fake_histogram/ /app/fake_histogram/

# Build fake_histogram binary
RUN cd /app/fake_histogram && \
    go build -o /bin/fake_histogram main.go

# Copy telegraf config
COPY telegraf.conf /etc/telegraf/telegraf.conf

# Set the entrypoint to Telegraf
ENTRYPOINT ["telegraf"]
