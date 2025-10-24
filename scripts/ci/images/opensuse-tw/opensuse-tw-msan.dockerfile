ARG INSTALL_PREFIX=/opt/msan
ARG TOOLCHAIN_FILE=toolchain-msan.cmake
ARG CFLAGS="-fsanitize=memory -fsanitize-memory-track-origins"
ARG CXXFLAGS="-fsanitize=memory -fsanitize-memory-track-origins"
ARG LLVM_USE_SANITIZER=MemoryWithOrigins

# pull ghcr.io/ornladios/adios2:ci-opensuse-tw-full-stack-onbuild
FROM ghcr.io/ornladios/adios2@sha256:2fc2cd2d7adabab7f13499565648462b5806e1a61d8e6c30f05aea38fda06225 AS tmp-stage
# pull ghcr.io/ornladios/adios2:ci-opensuse-tw-sanitizer-base
FROM ghcr.io/ornladios/adios2@sha256:89bfa1adfe21db3f4f520e1a5af8222e1c9d0deafbf28b19fe439e4001c2db41
COPY --from=tmp-stage /opt/msan/ /opt/msan/
