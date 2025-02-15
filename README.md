# README

課題用の rails テンプレートです。

## 前提

- docker が必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```

```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## 備考

- Task の scaffold が含まれていますが、CI の動作確認用です。
  適宜削除いただければと思います。（そのままでも問題ないです）

## rubocop

rubocop がすべて通ってからレビュー依頼を出してください。

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erb のフォーマッターです。
フォーマッターを通してからレビュー依頼を出してください。

```
docker compose run --rm web bin/htmlbeautifier
```
