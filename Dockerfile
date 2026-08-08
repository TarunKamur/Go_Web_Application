# -----------------------------
# Stage 1: Build
# -----------------------------
FROM golang:1.26.5-alpine AS builder

WORKDIR /app

# Cache Go dependencies
COPY go.mod ./
RUN go mod download

# Copy application source
COPY . .

# Build a static binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -trimpath -ldflags="-s -w" -o app .


# -----------------------------
# Stage 2: Runtime
# -----------------------------
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /

# Copy only the application binary and static files
COPY --from=builder /app/app /app
COPY --from=builder /app/static ./static

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app"]
