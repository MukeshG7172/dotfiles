#!/usr/bin/env python3
import subprocess
import os
import sys

try:
    import gi
    gi.require_version('Gtk', '3.0')
    from gi.repository import Gtk
    GTK_AVAILABLE = True
except Exception:
    GTK_AVAILABLE = False

def get_player_info():
    try:
        status = subprocess.check_output(['playerctl', 'status'], stderr=subprocess.DEVNULL).decode().strip()
    except Exception:
        return None, None, None, None

    if status not in ['Playing', 'Paused']:
        return None, None, None, None

    try:
        player_name = subprocess.check_output(['playerctl', 'status', '-f', '{{playerName}}'], stderr=subprocess.DEVNULL).decode().strip()
    except Exception:
        player_name = 'default'

    try:
        title = subprocess.check_output(['playerctl', 'metadata', 'title'], stderr=subprocess.DEVNULL).decode().strip()
    except Exception:
        title = ''

    try:
        artist = subprocess.check_output(['playerctl', 'metadata', 'artist'], stderr=subprocess.DEVNULL).decode().strip()
    except Exception:
        artist = ''

    return status, player_name, title, artist

def resolve_app_icon(player_name):
    if not GTK_AVAILABLE or not player_name:
        return None

    app_id = player_name.lower().split('.')[0]

    name_map = {
        'brave': ['brave-browser', 'brave', 'brave-desktop'],
        'chrome': ['google-chrome', 'chromium-browser', 'chromium'],
        'chromium': ['chromium-browser', 'chromium', 'google-chrome'],
        'firefox': ['firefox', 'firefox-developer-edition'],
        'spotify': ['spotify', 'spotify-client'],
        'vlc': ['vlc'],
        'mpv': ['mpv'],
        'rhythmbox': ['rhythmbox'],
        'audacious': ['audacious'],
        'amberol': ['amberol', 'io.bassi.Amberol'],
        'celluloid': ['celluloid', 'io.github.celluloid_player.Celluloid'],
        'clementine': ['clementine'],
        'deadbeef': ['deadbeef'],
        'lollypop': ['org.gnome.Lollypop', 'lollypop']
    }

    candidates = name_map.get(app_id, [app_id, f"{app_id}-browser", "multimedia-audio-player", "audio-x-generic"])
    
    theme = Gtk.IconTheme.get_default()
    for name in candidates:
        icon_info = theme.lookup_icon(name, 32, 0)
        if icon_info:
            return icon_info.get_filename()

    # Generic fallbacks
    for name in ["multimedia-audio-player", "audio-x-generic", "audio-speakers"]:
        icon_info = theme.lookup_icon(name, 32, 0)
        if icon_info:
            return icon_info.get_filename()

    return None

def main():
    status, player_name, title, artist = get_player_info()
    if not status:
        # Exit with code 0 and empty output so component disappears when no media playing
        sys.exit(0)

    icon_path = resolve_app_icon(player_name)
    if not icon_path or not os.path.exists(icon_path):
        sys.exit(0)

    tooltip_parts = []
    if title:
        tooltip_parts.append(title)
    if artist:
        tooltip_parts.append(f"by {artist}")
    if player_name:
        tooltip_parts.append(f"[{player_name.capitalize()}]")
    if status:
        tooltip_parts.append(f"({status})")

    tooltip = " ".join(tooltip_parts)

    print(icon_path)
    print(tooltip)

if __name__ == '__main__':
    main()
