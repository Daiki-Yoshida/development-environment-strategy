# 開発環境戦略 — 日本語版インデックス

```yaml
document_type: "index_translation"
target_audience: "human_readers"
language: "japanese"
source: "../artifacts/INDEX.md"
strategy_version: "1.0.0"
authority: "英語版 artifacts/ が正本。内容に差がある場合は英語版を優先する"
```

このフォルダは、AIエージェント向けの正本である `artifacts/` を、人が理解しやすい日本語にしたものです。

最初にこのファイルを読み、目的に必要な文書だけを参照してください。

## 読む順番

```yaml
1_思想: "DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md" # なぜ: 安全性、再現性、分離、並列開発
2_基準: "ENVIRONMENT_STANDARDS.md"             # どうする: ホスト、Docker、コマンド、Git、CI
3_構造: "WORKSPACE_STRUCTURE.md"               # どこに置く: リポジトリ、worktree、トップレベル構成
4_流れ: "ENVIRONMENT_WORKFLOW.md"               # どう進める: 導入、開発、検証、統合、削除、復旧
```

初めて全体を把握する場合は、1から4まで順番に読みます。特定の作業だけを行う場合は、後述の「目的別の参照先」を使います。

## 基本となる考え方

```yaml
中心思想: "開発環境は、構造・ツール・操作・状態管理・分離・安全性をまとめた契約である"
優先順位: "ホストとデータの安全性 > 再現性 > 分離 > 並列運用 > 操作の明確さ > 診断と復旧 > ローカルとCIの一致 > 効率"
基本形: "ホストは制御面、コンテナはプロジェクト実行面"
対象範囲: "開発ワークスペース、リポジトリ構造、実行ツール、開発環境のライフサイクル"
```

## 各文書の担当範囲

同じ規則を複数ファイルへ重複して書かず、一つの文書を正しい参照先とします。

### `DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md`

- 開発環境を契約として扱う考え方
- 優先順位
- ホストの制御面とコンテナの実行面
- 安全性と開発効率の両立
- Workspace Repository、Component Repository、Primary Checkout、Task Worktreeの概念
- 複数AIエージェントを分離する理由
- 対象範囲と、よくある誤解

### `ENVIRONMENT_STANDARDS.md`

- ホストへ置く依存関係の基準
- Dockerリソースの命名と分離
- UID/GID、キャッシュ、ポート、Secret、生成ファイル
- Makefile、公開コマンド、scriptsの役割
- コマンド名と破壊的操作の基準
- Git操作の安全性
- ローカルとCIの実行経路
- 診断方法と最終検証コマンド

### `WORKSPACE_STRUCTURE.md`

- Workspace RepositoryとComponent Repositoryの配置
- Primary CheckoutとTask Worktreeの配置
- `.worktrees/` の構造と命名
- 開発環境に関するトップレベルフォルダ
- Git管理対象とignore対象
- 複数Component Repositoryの管理
- WorkspaceとComponent間のツールバージョン依存
- Git、Docker、ログ、生成物へ共通の識別情報を伝える方法

### `ENVIRONMENT_WORKFLOW.md`

- 新規プロジェクトへの導入
- 既存プロジェクトへの段階的な導入
- Task Worktreeの作成と割り当て
- 実装中の検証と最終検証
- 統合と後片付け
- 問題の診断と復旧
- 開発環境変更の確認レベル
- 文書を読み直す条件

## 目的別の参照先

```yaml
"ホストへ入れてよいツールを決める":               "ENVIRONMENT_STANDARDS.md（ホスト依存の境界）"
"DockerやComposeを追加する":                     "ENVIRONMENT_STANDARDS.md（Docker基準）"
"コンテナ、ネットワーク、ボリュームを命名する":   "ENVIRONMENT_STANDARDS.md（リソース識別）"
"Makeターゲットやscriptsを設計する":              "ENVIRONMENT_STANDARDS.md（公開コマンド）"
"Git worktreeを追加・変更する":                   "WORKSPACE_STRUCTURE.md（Task Worktree）+ ENVIRONMENT_WORKFLOW.md（作業の流れ）"
"親子のようなリポジトリ構成を整理する":           "WORKSPACE_STRUCTURE.md（リポジトリ構造）"
"複数のComponent Repositoryを管理する":          "WORKSPACE_STRUCTURE.md（複数Component構成）"
"複数AIエージェントを並列で動かす":              "DEVELOPMENT_ENVIRONMENT_PHILOSOPHY.md（並列分離）+ WORKSPACE_STRUCTURE.md"
"ローカルとCIの動作を合わせる":                  "ENVIRONMENT_STANDARDS.md（ローカルとCIの共通化）"
"破壊的な削除コマンドを追加する":                 "ENVIRONMENT_STANDARDS.md（破壊的操作）+ ENVIRONMENT_WORKFLOW.md（確認レベル）"
"新規プロジェクトへ導入する":                    "ENVIRONMENT_WORKFLOW.md（新規導入）"
"既存プロジェクトへ導入する":                    "ENVIRONMENT_WORKFLOW.md（既存環境への導入）"
"壊れた開発環境を調査する":                      "ENVIRONMENT_WORKFLOW.md（診断と復旧）"
"変更前に確認が必要か判断する":                  "ENVIRONMENT_WORKFLOW.md（開発環境変更の確認レベル）"
```

## 他のartifactとの関係

```yaml
design_principles:
  担当: "コード設計、モジュール契約、実装、テスト設計"
documentation_strategy:
  担当: "documents/ の構造、案内、バージョン、保守"
development_environment_strategy:
  担当: "ワークスペース構造、開発ツール、実行経路、Git worktree、開発環境の状態管理"
```

複数領域にまたがる作業では、それぞれのartifactを担当範囲にだけ適用します。

- 開発環境の規則で、アプリケーション内部のモジュール構造を決めない。
- コード配置の規則で、リポジトリやworktreeの構造を決めない。
- `documents/` 内部の構成は `documentation-strategy` に従う。
