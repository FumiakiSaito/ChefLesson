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
