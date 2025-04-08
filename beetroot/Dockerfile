# ---- Stage 1: Build ----
    FROM golang:1.22-alpine AS builder

    # Install Git (required for go mod if private dependencies or VCS are involved)
    RUN apk add --no-cache git
    
    # Set working directory
    WORKDIR /app
    
    # Clone Beetroot source code
    RUN git clone https://github.com/skandix/Beetroot.git .
    
    # Move to the actual Go module directory
    WORKDIR /app/cmd/beetroot
    
    # Fetch dependencies
    RUN go mod tidy
    
    # Build the app and put binary in /app
    RUN go build -o /app/beetroot
    
    # ---- Stage 2: Runtime ----
    FROM alpine:3.19
    
    # Set timezone
    ARG TIMEZONE=Europe/Oslo
    ENV TZ=$TIMEZONE
    
    RUN apk add --no-cache tzdata && \
        cp /usr/share/zoneinfo/$TZ /etc/localtime && \
        echo "$TZ" > /etc/timezone && \
        apk del tzdata
    
    # Set workdir for the app
    WORKDIR /app
    
    # Copy the binary from the builder
    COPY --from=builder /app/beetroot .
    
    # Expose port
    EXPOSE 8080
    
    # Start the app
    ENTRYPOINT ["./beetroot"]
    