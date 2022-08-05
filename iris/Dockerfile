ARG IMAGE=helm-valip-quay-quay-quay.apps.vapo-aws-dsoi-dev.va.gov/helm/irishealth/irishealth:2022.1.0.212.0
ARG IMAGE=quay.vapo.va.gov/scm/irishealth/irishealth:2021.2.0.651.0
FROM $IMAGE AS src
USER root   
WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild \
  && mkdir -p /usr/irissys/mgr/SCMDATA \
  && chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /usr/irissys
USER ${ISC_PACKAGE_MGRUSER}
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} Installer.cls Installer.cls
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} iris.script iris.script
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} %ZSTART.mac %ZSTART.mac
RUN iris start IRIS && iris session IRIS < iris.script && iris stop IRIS quietly
