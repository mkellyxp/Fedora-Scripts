#!/bin/bash
#


gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install org.gtk.Gtk3theme.Adwaita-dark

sudo rpm-ostree install nodejs
sudo rpm-ostree install podman-compose