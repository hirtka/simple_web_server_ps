# simple_web_server_ps
PowerShell Scriptによる簡単なローカルHTTP Serverです。

## About The Project

![screen_shot](https://user-images.githubusercontent.com/8457067/169044065-c1f7d0ec-9d00-4f92-ba56-812d157c76b3.jpg)

アプリをインストールできない、管理者権限がないアカウント等の環境でHTTP Serverを動かしたいといった場合にはこのスクリプトが役に立ちます。  
Windows 10/11で動作すると思います。（Windows 11では動作確認済）

### Installation

simple_http_server.ps1 をダウンロードか中身をCopy ＆Pasteしてスクリプトファイルを用意してください。  
Windows PowerShellを起動し、以下のコマンドを実行してください。実行するパス、スクリプトファイルのあるパスは適宜置き換えてください。
```
PS C:\scripts> PowerShell -ExecutionPolicy RemoteSigned .\simple_http_server.ps1
```
Webブラウザ等で以下のアドレスにアクセスします。デフォルトでは"C:\www_root\"にあるindex.htmlを開きます。
```
http://localhost/Temporary_Listen_Addresses/
```

## License

Distributed under the MIT License.
