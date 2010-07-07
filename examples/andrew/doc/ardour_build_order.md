ARDOUR BUILD ORDER
==================

for Slackware 13.1

* liblo

* liblrdf
  * ladspa_sdk

* scons

* libgnomecanvas

* aubio
  * libsndfile

* jack-audio-connection-kit

* if you want lv2 support
  * install lv2core
  * install slv2
  * pass LV2=yes to script

* ardour

[Binary packages](http://antlechrist.org/slack-audio/)  available.
