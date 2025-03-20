# First stage: Build
FROM alpine:latest AS build
RUN apk add --no-cache git go
WORKDIR /app
RUN git clone https://github.com/skandix/Beetroot.git .

# Optional: list the repository structure to verify where the Go files are
# RUN ls -la /app

# Download module dependencies
RUN go mod download

Run go mod tidy




# Change to the directory that contains the main package
WORKDIR /app/cmd/beetroot

# Build the Go application
RUN go build -o beetroot

# Second stage: Runtime
FROM alpine:latest
WORKDIR /app
COPY --from=build /app/cmd/beetroot/beetroot .
ENV TZ=UTC
ENTRYPOINT ["./beetroot"]

