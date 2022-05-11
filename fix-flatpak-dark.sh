mkdir ~/.themes
cp -R /usr/share/themes/Adwaita-dark ~/.themes/
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --env=GTK_THEME=Adwaita-dark

# Notes:
#   - Be sure to also log an issue with any app that's not respecting the dark theme, so they can fix it as well.
#   - To view all the flatpak overrides you have, you can run `flatpak override --show`
#   - To revert back to the stock theme, you can run `sudo flatpak override --reset`