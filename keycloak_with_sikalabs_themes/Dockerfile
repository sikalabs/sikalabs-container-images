ARG BASE_IMAGE
FROM $BASE_IMAGE
LABEL org.opencontainers.image.source="https://github.com/sikalabs/sikalabs-container-images"
COPY ./themes/sikalabs /opt/keycloak/themes/sikalabs
COPY ./themes/ondrejsika /opt/keycloak/themes/ondrejsika
COPY ./themes/sika-io /opt/keycloak/themes/sika-io
COPY ./themes/sikademo /opt/keycloak/themes/sikademo
COPY ./themes/rails /opt/keycloak/themes/rails
COPY ./themes/rails_no_login_form /opt/keycloak/themes/rails_no_login_form
COPY ./themes/rails2 /opt/keycloak/themes/rails2
COPY ./themes/rails2_no_login_form /opt/keycloak/themes/rails2_no_login_form
COPY ./themes/edualf /opt/keycloak/themes/edualf
COPY ./themes/integritty /opt/keycloak/themes/integritty
COPY ./themes/forclassmates /opt/keycloak/themes/forclassmates
COPY ./themes/eventlook /opt/keycloak/themes/eventlook
COPY ./themes/mirandamedia /opt/keycloak/themes/mirandamedia
COPY ./themes/training /opt/keycloak/themes/training
COPY ./themes/mstp /opt/keycloak/themes/mstp
COPY ./themes/forendors /opt/keycloak/themes/forendors
COPY ./themes/ostrava /opt/keycloak/themes/ostrava
COPY ./themes/pss /opt/keycloak/themes/pss
COPY ./themes/lightblue /opt/keycloak/themes/lightblue
COPY ./themes/lightgreen /opt/keycloak/themes/lightgreen
COPY ./themes/lightred /opt/keycloak/themes/lightred
COPY ./themes/lightyellow /opt/keycloak/themes/lightyellow
COPY ./themes/isseurope /opt/keycloak/themes/isseurope
COPY ./themes/ica /opt/keycloak/themes/ica
RUN /opt/keycloak/bin/kc.sh build
