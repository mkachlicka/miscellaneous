# How to install SOX on Mac?

Step 1: Install Homebrew by executing this in terminal:
``` /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ```

To set the path execute:
``` echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile ```
``` eval $(/opt/homebrew/bin/brew shellenv) ```

Check if installed (it should print some help notes):
``` brew help ```

Step 2: Install SoX:
``` brew install sox ```

Check if installed (it will show location and installed version):
``` which sox ```
``` sox --version ```

Go to a folder where you store some audio files and try and play it:
``` !play filename.wav ```

Voila!