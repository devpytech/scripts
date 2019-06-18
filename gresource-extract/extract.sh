#!/bin/sh

workdir=${PWD}

if [ ! -d ${workdir}/theme/icons ]; then
  mkdir -p ${workdir}/theme/icons
fi

gst=/usr/share/gnome-shell/gnome-shell-theme.gresource

for r in `gresource list $gst`; do
        gresource extract $gst $r >$workdir/${r#\/org\/gnome\/shell/}
done
