puppet3:
  pkg.installed

puppet-service:
  service.dead:
    - name: puppet
    - enable: False

/etc/puppet/puppet.conf:
  file.managed:
    - source: salt://puppet/server/puppet.conf
    - user: puppet
    - group: puppet

/etc/puppet/fileserver.conf:
  file.managed:
    - source: salt://puppet/server/fileserver.conf
    - user: puppet
    - group: puppet

/etc/puppet/manifests:
  file.directory:
    - user: puppet
    - group: puppet

/etc/puppet/manifests/site.pp:
  file.managed:
    - source: salt://puppet/server/manifests/site.pp
    - user: puppet
    - group: puppet

/etc/puppet/hiera.yaml:
  file.managed:
    - source: salt://puppet/server/hiera.yaml
    - user: puppet
    - group: puppet

/etc/puppet/hieradata:
  file.directory:
    - user: puppet
    - group: puppet

/etc/puppet/hieradata/default.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/default.yaml
    - user: puppet
    - group: puppet
    - replace: False

/etc/puppet/hieradata/classes.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/classes.yaml
    - user: puppet
    - group: puppet
    - replace: False


/etc/puppet/hieradata/hosts:
  file.directory:
    - user: puppet
    - group: puppet

/etc/puppet/hieradata/hosts/head.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/hosts/head.yaml
    - user: puppet
    - group: puppet
    - replace: False

/etc/puppet/hieradata/hosts/worker1.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/hosts/worker1.yaml
    - user: puppet
    - group: puppet
    - replace: False

/etc/puppet/hieradata/hosts/worker2.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/hosts/worker2.yaml
    - user: puppet
    - group: puppet
    - replace: False

/etc/puppet/hieradata/hosts/worker3.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/hosts/worker3.yaml
    - user: puppet
    - group: puppet
    - replace: False

/etc/puppet/hieradata/hosts/worker4.yaml:
  file.managed:
    - source: salt://puppet/server/hieradata/hosts/worker4.yaml
    - user: puppet
    - group: puppet
    - replace: False

s3-puppet-modules:
  archive.extracted:
    - name: /etc/puppet/
    - source: s3://geoint-data/bootstrap/puppet-modules.tgz
    - source_hash: md5=da675bb0eecdb65f5ae2dcf833f238d3
    - archive_format: tar
    - if_missing: /etc/puppet/modules/java
    - user: puppet
    - group: puppet

/etc/puppet/files:
  file.directory:
    - user: puppet
    - group: puppet

/etc/puppet/files/jdk-7u79-linux-x64.tar.gz:
  file.managed:
    - source: s3://geoint-data/bootstrap/jdk-7u79-linux-x64.tar.gz
    - source_hash: md5=9222e097e624800fdd9bfb568169ccad
    - user: puppet
    - group: puppet

/etc/puppet/files/accumulo-1.6.4-bin.tar.gz:
  file.managed:
    - source: s3://geoint-data/bootstrap/accumulo-1.6.4-bin.tar.gz
    - source_hash: md5=530dfe488d5c2ee415b514ce72baa691
    - user: puppet
    - group: puppet

puppet3-server:
  pkg.installed

puppetmaster-service:
  service.running:
    - name: puppetmaster
    - enable: True

