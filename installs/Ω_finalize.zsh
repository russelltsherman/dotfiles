DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$DIR/../lib/sh"

# Files in the iinstalld directory are executed by the lexicographical order of their file names.

# This file is named Ω_finalize.zsh. The leading Ω (Capital Greek Omega) is needed to ensure this file executes after
# other files that this function needs to be able to see.
# This file should come next to last, followed only by Ω_overrides.zsh.

## Perform any clean-up or post-setup actions

chk::linux || exit 0

echo "==> Set Launchbar favorites"
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'slack.desktop', 'signal-desktop.desktop', 'code.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'virtualbox.desktop', 'yelp.desktop']"

echo "==> Change user shell to zsh"
sudo chsh --shell /usr/local/bin/zsh vagrant
