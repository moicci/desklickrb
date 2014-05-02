# desklickrb

Flickr から画像ファイルをダウンロードして Mac のデスクトップピクチャ(壁紙)に設定する Ruby スクリプトです。  

## 前提

以下がインストールされていることが条件です。

- ruby 2.0.0 以上
- rubygems

## インストール

```
gem install desklickrb
```

## もひとつ準備

Flickr の API キーを作ってください。 <https://www.flickr.com/services/apps/create/>  
ここで作った API キーをコマンドライン引数の `-k` で指定するようにしてください。

## 使い方

desklickrb -h で下記のヘルプが表示されます。(ロングオプションには未対応)

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

まず、動きをチェックしたい場合は、APIキーを下記のように指定して、実行してみてください。  
デスクトップピクチャが変わると思います。

`desklickrb -k "FlickrのAPIキー"`

デフォルトでは Flickr の interestingness から画像をランダムで選択してダウンロードします。
`-u` で指定ユーザのもの、`-t` で指定したタグのものをダウンロードします。
