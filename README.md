# Chef


#### Chefインストール
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

#### knife-soloインストール  
```
sudo gem install knife-solo
```

## knife-solo

#### ローカルにリポジトリ作成(サーバ毎に作る)  
```
knife solo init [リポジトリ名]
```

#### リモートでノードにchef-soloをインストールする   
```
knife solo bootstrap [ホスト名]
```
※必要であれば予め  
リモートで鍵ペア作成&ローカルの~/ssh/configに秘密鍵の設定  
をしておく 


#### cookbook作成(インストール(設定)したいもの毎に作る)
```
knife cookbook create [cookbook名] -o site-cookbooks
```

#### cookbookをnodeに反映  
```
knife solo cook [サーバ名]
```

#### cookbookをnodeに反映(秘密鍵指定)  
```
knife solo cook [サーバ名] -i [鍵パス]
```

#### リポジトリ構造

| ディレクトリ   |      説明      |
|:----------|:-------------|
| cookbooks | コミュニティクックブック置き場 |
| data_bags | Data Bagと呼ばれるChefのクックブック内で利用したい任意のデータ置き場  |
| environments | 開発・本番用の設定を切り分けたい場合、それに紐づく各種変数などを格納する場所 |
| nodes | nodeオブジェクトを記述したjsonファイル置き場 |
| roles | ロール機能の設定ファイル置き場。Webサーバとデータベースサーバを扱いたい場合など |
| site-cookbooks | 自分で作ったクックブック置き場 |

## Berkshelf(コミュニティクックブック管理ツール)  
#### インストール  
```
sudo gem install berkshelf
```

#### コミュニティクックブックを取得  
Berksfileに取得元URLと取得したいクックブックを指定  

```ruby:Berksfile
source "https://supermarket.getchef.com"

cookbook 'nodejs'
cookbook 'mongodb'
```

コマンド実行  
```
berks verndor ./cookbooks
```

これでcookbooksディレクトリにクックブックが配置される  
※knife solo cookすると再配置される（編集しても戻る)    
※コミュニティクックブックは編集するものでない。  
するのであれば自前のファイルで。ってことらしい。



## メモ  
cookに失敗したときは、リモート上の下記ファイルにログ出力される  
`/var/chef/cache/chef-stacktrace.out`
