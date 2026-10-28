# kleash/homebrew-tap

Homebrew casks for:

- [AirSCP](https://github.com/kleash/airscp), a native Mac app for SFTP/SCP file transfer, SSH and Windows Remote
  Desktop.
- [Crate](https://github.com/kleash/crate), a free, open-source archive utility: browse, Quick Look, extract and
  create ZIP, 7-Zip, RAR, TAR and more.

```sh
brew trust --cask kleash/tap/airscp && brew install --cask kleash/tap/airscp
brew trust --cask kleash/tap/crate && brew install --cask kleash/tap/crate
```

Homebrew 7 loads casks from outside its own repository only once you trust them (`brew trust`).
