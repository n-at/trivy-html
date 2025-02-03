FROM aquasec/trivy:0.59.0

RUN trivy plugin install scan2html &&\
    trivy image --download-db-only &&\
    trivy image --download-java-db-only &&\
    trivy vex repo init

ADD repository.yaml /root/.trivy/vex/
ADD entrypoint.sh /opt/

WORKDIR /opt

ENTRYPOINT [ "entrypoint.sh" ]
