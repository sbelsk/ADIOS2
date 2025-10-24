# pull ghcr.io/ornladios/adios2:ci-opensuse-tw-sanitizer-base
FROM ghcr.io/ornladios/adios2@sha256:89bfa1adfe21db3f4f520e1a5af8222e1c9d0deafbf28b19fe439e4001c2db41

# Install core dev packages
RUN zypper install -y --no-recommends libubsan1 libasan8 hdf5-devel zfp-devel && \
    zypper clean --all
