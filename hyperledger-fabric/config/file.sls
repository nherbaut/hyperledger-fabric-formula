# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

hyperledger-fabric-config-file-file-managed:
  file.managed:
    - name: {{ hyperledger__fabric.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='hyperledger-fabric-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ hyperledger__fabric.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        hyperledger__fabric: {{ hyperledger__fabric | json }}
