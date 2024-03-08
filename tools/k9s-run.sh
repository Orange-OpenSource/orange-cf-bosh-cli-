#!/bin/bash
#===========================================================================
# Run k9s with custom configuration
#===========================================================================

#--- Delete obsolete configuration files (yaml files replace yml in k9s breaking changes)
if [ -f ${K9S_CONFIG_DIR}/config.yml ] ; then
  rm -f ${K9S_CONFIG_DIR}/config.yml > /dev/null 2>&1
fi
if [ -f ${K9S_CONFIG_DIR}/plugin.yml ] ; then
  rm -f ${K9S_CONFIG_DIR}/plugin.yml > /dev/null 2>&1
fi

#--- Delete obsolete logs
rm ${K9S_LOGS_DIR}/k9s* > /dev/null 2>&1

#--- k9s config file
K9S_CONFIG_FILE="${K9S_CONFIG_DIR}/config.yaml"

#--- Check if new k9s version
K9S_VERSION="$(/usr/local/bin/k9s version | grep "Version:" | awk '{print $2}')"
if [ ! -f ${K9S_CONFIG_DIR}/k9s.${K9S_VERSION} ] ; then
  rm -f ${K9S_CONFIG_FILE} k9s.v* > /dev/null 2>&1
  > k9s.${K9S_VERSION}
fi

#--- Customize k9s configuration
if [ -f ${K9S_CONFIG_FILE} ] ; then
  #--- Disable K9S logo to display options
  sed -i "s+logoless:.*+logoless: true+" ${K9S_CONFIG_FILE}

  #--- Disable k9s lastrev check
  sed -i "s+skipLatestRevCheck:.*+skipLatestRevCheck: true+" ${K9S_CONFIG_FILE}

  #--- Set k9s skin environment color
  sed -i '/skin: .*/d' ${K9S_CONFIG_FILE}
  sed -i '/ noIcons: /a\    skin: skin' ${K9S_CONFIG_FILE}
  sed -i "s+environment:.*+environment: \&environment ${K9S_SKIN_COLOR}+" ${K9S_CONFIG_DIR}/skins/skin.yaml

  #--- Enable "nodeShell" feature for every known clusters
  sed -i "s+image:.*+image: nicolaka/netshoot:v0.12+" ${K9S_CONFIG_FILE}
  clusters_config_files="$(find ${K9S_CONFIG_DIR} -name config.yaml | grep "/clusters/")"
  for cluster_config_file in ${clusters_config_files} ; do
    sed -i "s+nodeShell:.*+nodeShell: true+" ${cluster_config_file}
  done
fi

#--- Run k9s binary (defaut is read-only mode)
k9s ${K9S_RUN_MODE}