#!/bin/sh

set -e

if [ ! -f "${FUSEKI_BASE}/shiro.ini" ] ; then
  # First time
  echo "###################################"
  echo "Initializing Apache Jena Fuseki"
  echo ""
  cp /shiro.ini ${FUSEKI_BASE}/shiro.ini
  cp /config.ttl ${FUSEKI_BASE}/configuration/config.ttl
  if [ -z "${ADMIN_PASSWORD}" ] ; then
    ADMIN_PASSWORD=$(pwgen -s 10)
    echo "Randomly generated admin password:"
    echo ""
    echo "admin=${ADMIN_PASSWORD}"
  fi
  echo ""
  echo "###################################"
fi

if [ -n "${ADMIN_PASSWORD}" ] ; then
  sed -i "s/admin=.*/admin=${ADMIN_PASSWORD}/" ${FUSEKI_BASE}/shiro.ini
fi
