# ChefLesson
ChefのCookBook虎の巻

Chefインストール
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

knife-soloインストール  
```
sudo gem install knife-solo
```

cookbookの依存関係を管理するツールをインストール  
```
sudo gem install berkshelf
```


cookbook作成  
```
knife cookbook create [cookbook名] -o site-cookbooks
```

cookbookをnodeに反映  
```
knife solo cook [サーバ名]
```

cookbookをnodeに反映(秘密鍵指定)
```
knife solo cook [サーバ名] -i [鍵パス]
```

リポジトリ構造

| ディレクトリ   |      説明      |
|:----------|:-------------|
| cookbooks | コミュニティクックブック置き場 |
| data_bags | Data Bagと呼ばれるChefのクックブック内で利用したい任意のデータ置き場  |
| environments | 開発・本番用の設定を切り分けたい場合、それに紐づく各種変数などを格納する場所 |
| nodes | nodeオブジェクトを記述したjsonファイル置き場 |
| roles | ロール機能の設定ファイル置き場。Webサーバとデータベースサーバを扱いたい場合など |
| site-cookbooks | 自分で作ったクックブック置き場 |
