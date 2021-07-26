#!/bin/bash
#
# Extension: https://extensions.gnome.org/extension/3843/just-perfection/


gsettings set org.gnome.desktop.privacy remember-recent-files false

sudo rpm-ostree install gnome-tweaks papirus-icon-theme

flatpak install org.gtk.Gtk3theme.Adwaita-dark