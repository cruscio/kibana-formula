# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}
include:
  - kibana.install

# We directly serialize the config subtree into the YAML file.
kibana-config:
  file.serialize:
    - name: {{ kibana.configfile }}
    - mode: 644
    - user: root
    - group: root
    - dataset: {{ kibana.config }}
    - formatter: "YAML"
    - kwargs: { 
        preserve_quotes: True
      }
    - require:
      - sls: kibana.install
