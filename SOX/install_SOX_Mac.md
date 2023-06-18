# How to install SOX on Mac?
<br>

<p><h2><b>Step 1: Install Homebrew</h2></b></p>

<p>Install Homebrew by executing this in terminal:

``` /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ```
</p>

<p>To set the path execute:

``` echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile ```

``` eval $(/opt/homebrew/bin/brew shellenv) ```
</p>

<p>Check if installed (it should print some help notes):

``` brew help ```
</p>
<br>

<p><h2><b>Step 2: Install SoX</b></h2></p>

<p>Install SoX by executing this in terminal:

``` brew install sox ```
</p>

<p>Check if installed (it will show location and installed version):

``` which sox ```

``` sox --version ```
</p>

<p>Go to a folder where you store some audio files and try and play it:

``` !play filename.wav ```
</p>