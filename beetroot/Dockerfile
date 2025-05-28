# ---- Build stage----
    FROM golang:1.22-alpine AS builder

    # Install Git
    RUN apk add --no-cache git

    # Clone Beetroot source code
    WORKDIR /app
    RUN git clone https://github.com/skandix/Beetroot.git .
    
    # Move to main app folder
    WORKDIR /app/cmd/beetroot
    
   # Tidy dependencies and build binary
    RUN go mod tidy
    RUN go build -o /app/beetroot
    
    # ----Runtime stage----
    FROM alpine:3.19
    
# Set timezone
ARG TIMEZONE=Europe/Oslo
ENV TZ=${TIMEZONE}

RUN apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo "${TZ}" > /etc/timezone


   # Set workdir and copy binary
    WORKDIR /app
    COPY --from=builder /app/beetroot .
    
   # Expose port and run app
    EXPOSE 8080
    ENTRYPOINT ["./beetroot"]
