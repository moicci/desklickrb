# desklickrb

Japanese document is here <http://blog.bylo.jp/develop/2014/05/744/>.

This ruby gem refreshes Mac's Desktop Picture using Flickr's picture.  
The name desklickrb is named by hommage to Desklickr that is similar app.
An executable file deslickrb in bin directory.

## Environment

This script was tested on:

- MacOS Marverics
- Ruby 2.0.0

## Installation

```
gem install desklickrb
```

## Preparing the Flickr API key

Flickr API Key must be created at <https://www.flickr.com/services/apps/create/>.  
Then the API Key should be specified with -k option to executable desklickrb.

## Usage

You can see the help with `desklickrb -h` as the followings.

```
desklickrb [-v] [-k flickr-api-key] [-o filename] [gallery options]

  -v: verbose
  -k: API key created on https://www.flickr.com/services/apps/create/
  -u: download picture of user-id
  -o: download picture to filename (default: /tmp/desklickrb.jpg)

  gallery options:
     -u user-id: gallery of user-id
     -t tag: gallery by tag
     default is choosing from interestingness.
```

Try `deslickrb -k "Flickr API Key"`, then you see a new desktop picture.
