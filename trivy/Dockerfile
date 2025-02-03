FROM aquasec/trivy:0.59.0

ADD db /root/.cache/trivy/

RUN trivy plugin install scan2html &&\
    trivy vex repo init

ADD repository.yaml /root/.trivy/vex/
ADD entrypoint.sh /opt/

WORKDIR /opt

ENTRYPOINT [ "entrypoint.sh" ]
