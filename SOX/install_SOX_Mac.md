# How to install SOX on Mac?
<br>
<p>Step 1: Install Homebrew by executing this in terminal:</p><

``` /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ```

<p>To set the path execute:</p><br>

``` echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile ```

``` eval $(/opt/homebrew/bin/brew shellenv) ```

<p>Check if installed (it should print some help notes):</p>

``` brew help ```

<br>
<p>Step 2: Install SoX:</p>

``` brew install sox ```

<p>Check if installed (it will show location and installed version):</p>

``` which sox ```

``` sox --version ```

<p>Go to a folder where you store some audio files and try and play it:</p>

``` !play filename.wav ```
<br>
<p>Voila!</p>