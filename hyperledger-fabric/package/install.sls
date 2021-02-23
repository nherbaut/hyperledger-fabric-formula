# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric with context %}

hyperledger-fabric-package-install-pkg-installed:
  cmd.run:
    - name: "curl -sSL https://bit.ly/2ysbOFE | bash -s"
