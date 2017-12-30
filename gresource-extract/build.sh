FILES=$(find "theme" -type f -printf "%P\n" | xargs -i echo "    <file>{}</file>")

cat <<EOF >"theme/gnome-shell-theme.gresource.xml"
<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
$FILES
  </gresource>
</gresources>
EOF

(
  cd "theme"
  glib-compile-resources gnome-shell-theme.gresource.xml
)

echo "-> theme/gnome-shell-theme.gresource"
