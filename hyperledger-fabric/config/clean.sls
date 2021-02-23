# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric with context %}

include:
  - {{ sls_service_clean }}

hyperledger-fabric-config-clean-file-absent:
  file.absent:
    - name: {{ hyperledger__fabric.config }}
    - require:
      - sls: {{ sls_service_clean }}
