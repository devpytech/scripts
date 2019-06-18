if [ -d theme/icons ]; then
	cd ./theme/
	FILES=$(find ./ -type f | sed 's/^..//' | xargs -i echo "    <file>{}</file>")

	cat <<EOF >"./gnome-shell-theme.gresource.xml"
	<?xml version="1.0" encoding="UTF-8"?>
	<gresources>
		<gresource prefix="/org/gnome/shell/theme">
			$FILES
		</gresource>
	</gresources>
EOF

	(
		glib-compile-resources gnome-shell-theme.gresource.xml
	)

	echo "-> theme/gnome-shell-theme.gresource"
fi
