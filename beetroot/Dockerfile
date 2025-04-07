# ---- Stage 1: Build ----
    FROM golang:1.22-alpine AS builder

    # Install Git
    RUN apk add --no-cache git
    
    # Set working directory for source code
    WORKDIR /app
    
    # Clone Beetroot source code
    RUN git clone https://github.com/skandix/Beetroot.git .
    
    # Move into the folder where main go.mod is located
    WORKDIR /app/cmd/beetroot
    
    # Fetch and tidy dependencies
    RUN go mod tidy
    
    # Build the Beetroot binary and place it in /app (shared path)
    RUN go build -o /app/beetroot
    
    # ---- Stage 2: Runtime ----
    FROM alpine:3.19
    
# Set environment variable for timezone (can be overridden)
ARG TIMEZONE=Europe/Oslo
ENV TZ=$TIMEZONE

# Install tzdata and set timezone
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apk del tzdata

    # Set working directory in runtime image
    WORKDIR /app
    
    # Copy compiled binary from builder stage
    COPY --from=builder /app/beetroot .
    
    # Expose the default app port
    EXPOSE 8080
    
    # Start the Beetroot API
    ENTRYPOINT ["./beetroot"]
    