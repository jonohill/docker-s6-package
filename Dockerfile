FROM --platform=${BUILDPLATFORM} curlimages/curl as dl

ARG TARGETPLATFORM
ARG S6_VERSION

USER root

COPY add-s6.sh /
RUN /add-s6.sh

FROM scratch

COPY --from=dl /s6root /
