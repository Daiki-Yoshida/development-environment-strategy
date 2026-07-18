# ワークスペース構造

```yaml
document_type: "workspace_structure_translation"
target_audience: "human_readers"
language: "japanese"
source: "../artifacts/WORKSPACE_STRUCTURE.md"
strategy_version: "1.0.0"
authority: "英語版 artifacts/ が正本。内容に差がある場合は英語版を優先する"
対象: "リポジトリ構造、Primary Checkout、Task Worktree、開発環境のトップレベル配置"
```

## 1. リポジトリ構造

### Workspace Repository

Workspace Repositoryは、開発環境の制御面を所有します。

```yaml
所有する:
  - "DockerとComposeの定義"
  - "Makefileと公開コマンドwrapper"
  - "開発環境用scripts"
  - "AIエージェント向けの開発環境コンテキスト"
  - "worktreeの作成・診断・削除操作"
  - "複数Component Repositoryの調整"
通常は所有しない:
  - "Component Repositoryのプロダクト履歴"
  - "Component Repositoryのソースコード"
```

### Component Repository

Component Repositoryは、一つのプロダクトまたは独立してバージョン管理される構成要素を所有します。

```yaml
所有する:
  - "プロダクトのソースコード"
  - "プロダクトのテスト"
  - "Component固有のCIとリリース設定"
  - "Component固有のGit履歴"
関係: "Workspace Repositoryの中へ配置できるが、Workspace側ではGit管理しない構成を取れる"
```

Workspace RepositoryとComponent Repositoryは、別々のGitリポジトリと履歴を持てます。実際にGit submoduleを使っていない場合、この関係をsubmoduleと呼んではいけません。

### 一つのリポジトリで管理する場合

Workspace Repositoryを分けることは必須ではありません。

開発環境とプロダクトコードが同じライフサイクルを持ち、並列作業の調整にも別履歴が必要ない場合は、一つのリポジトリで管理します。その場合も、ホスト境界、公開コマンド、worktreeの基準はリポジトリ直下へ適用します。

## 2. Primary Checkout

各Component Repositoryは、ワークスペース内に一つの安定したPrimary Checkoutを持ちます。

```yaml
主な用途:
  - "fetchや同期"
  - "worktreeの作成"
  - "変更の統合と最終確認"
  - "固定パスが必要な対話ツールからの参照"
通常の機能開発: "推奨しない。Task Worktreeを使用する"
```

Primary Checkoutには、関係のないローカル変更を残さないようにします。安定した配置場所も開発環境契約の一部です。

## 3. Task Worktree

Task Worktreeは、Workspace Repository直下の `.worktrees/` に配置します。

```yaml
標準形: ".worktrees/<component>/<task-identity>/"
所有者: "一つのタスク、一つのブランチ、一つの書き込みエージェント"
寿命: "一時的。作業開始時に作り、統合または中止後に削除する"
Git管理: "Workspace Repository側ではignoreする"
```

Component Repositoryが一つしかない場合は、`.worktrees/<component>-<task>/` のような平坦な配置も許容できます。ただし、複数Component Repositoryを扱う、または将来的に増える可能性がある場合は、Componentごとに階層を分ける形を推奨します。

### Worktreeの識別名

Task Worktree名から、次を判断できるようにします。

- 対象のComponent Repository
- TASK_IDなどの作業識別子
- 必要に応じて、短いブランチの説明

既にTASK_IDなどの安定識別子がある運用では、それを使用します。乱数だけを識別子にしません。

名前はファイルシステムで安全に扱え、衝突しにくい必要があります。ブランチ名をディレクトリ名へ変換する場合は、異なるブランチが同じ名前へ変換されないか検査します。衝突時に既存ディレクトリを黙って再利用してはいけません。

### Worktreeの不変条件

- worktreeで使用するブランチは、Workspace RepositoryではなくComponent Repositoryに属する。
- 一つのブランチを、二つの書き込み可能なworktreeへ割り当てない。
- 選択されたworktreeパスを、ビルド、テスト、format、ログ、生成物の処理まで伝える。
- 並列worktreeには、別々の可変実行状態を割り当てる。
- worktree削除時に、別操作であるブランチ削除を自動実行しない。実行する場合は、そのコマンドが明示的にブランチ削除も所有すると示す。

## 4. 推奨するトップレベル構成

```text
<workspace>/
├─ Makefile
├─ <public-wrapper>
├─ compose.yml
├─ docker/
├─ scripts/
├─ documents/
├─ <component-a>/
├─ <component-b>/
└─ .worktrees/
   ├─ <component-a>/
   │  └─ <task-identity>/
   └─ <component-b>/
      └─ <task-identity>/
```

実際のファイル名は、使用技術に合わせて変更できます。重要なのは、名前そのものではなく責務です。

```yaml
Makefile: "見つけやすい公開操作名と、下位処理への委譲"
public_wrapper: "必要に応じて、共通CLI入口と対象選択を提供する"
compose: "コンテナ構成と実行時定義"
docker: "Dockerfileとコンテナ固有の補助ファイル"
scripts: "開発環境操作の実処理"
documents: "AI向けプロジェクト文書。documentation-strategyが管理する"
component_paths: "独立Component RepositoryのPrimary Checkout"
worktrees: "一時的なTask Worktree"
```

この構造を、アプリケーション内部のモジュール配置を決めるために使ってはいけません。ソースコード内部の構造は `design-principles` が担当します。

## 5. Git管理の境界

### Workspace Repository側

Workspace Repositoryでは、次をignore対象とします。

- 独立したGit履歴を持つComponent Repositoryのチェックアウト
- `.worktrees/`
- 開発環境固有のSecret
- ビルドやexportの生成物
- runtimeキャッシュ
- 意図して共有するものを除く、エディターやOSの一時ファイル

ignoreへ追加するだけでは、リポジトリ関係の説明として不十分です。AGENTS.mdやプロジェクト文書で、そのパスが独立リポジトリであることを明示します。

### Component Repository側

各Component Repositoryは、プロダクト固有のキャッシュ、ビルド生成物、生成ファイル、ツール固有状態について、自分自身のignoreルールを持ちます。

Workspace Repositoryが、Component Repository内で生成されたファイルの所有者にならないようにします。

## 6. 複数Component Repositoryのワークスペース

一つのWorkspace Repositoryから、複数のComponent Repositoryを管理できます。

```yaml
必要条件:
  - "各Component Repositoryに安定したPrimary Checkoutパスがある"
  - "ワークスペース全体の操作でない場合、コマンドが対象Componentを明示する"
  - "worktreeをComponentごとの名前空間へ分ける"
  - "衝突する可能性があるリソース名へComponent識別子を含める"
  - "Componentをまたぐ検証は、独立した明示的操作にする"
```

無関係なリポジトリを同じフォルダへ置くためだけに、Workspace Repositoryを作ってはいけません。共通ツール、調整、実行環境など、ワークスペースが実際に所有する責務が必要です。

## 7. 識別情報の伝播

一つの論理的なタスク識別子を、開発環境全体で使います。

```yaml
伝える先:
  - "ブランチまたはタスク情報"
  - "worktreeパス"
  - "Compose project名やコンテナ名前空間"
  - "分離対象の可変ボリュームとホストポート"
  - "ログ"
  - "一時ファイルと生成物の出力先"
```

各システムで文字列形式が異なっても構いません。ただし、どの名前がどのタスクに対応するかを、決定的に判断できる必要があります。

リソース名では、次を区別できるようにします。

```yaml
workspace: "どの開発ワークスペースが所有しているか"
component: "どのComponent Repositoryに属するか"
task: "どのタスクまたはworktreeが可変状態を所有するか"
role: "そのリソースが何を行うか"
```

## 8. WorkspaceからComponentへのツール依存

Component Repositoryが、別のWorkspace Repositoryにある開発ツールへ依存する場合があります。その場合、どのバージョンを使うか明示します。

```yaml
選択方法:
  移動する参照:
    意味: "文書化されたbranchまたは現在のWorkspace Checkoutを使用する"
    特徴: "更新は簡単だが、過去状態の再現性は弱くなる"
  固定参照:
    意味: "tagまたはcommitを使用する"
    特徴: "再現性は高いが、更新を明示的に行う必要がある"
原則: "CIやリリース検証が、参照先不明のWorkspaceバージョンを偶然使用してはいけない"
```

採用する方式を、プロジェクト文書またはCI設定へ記録します。ローカル開発では現在のWorkspace Checkoutを使い、正式な検証では固定参照を使う構成も可能です。

## 9. 他artifactとの境界

```yaml
development_environment_strategy:
  担当: "リポジトリ・worktreeの配置と、開発環境に関するトップレベルフォルダ"
design_principles:
  担当: "アプリケーションモジュール、公開境界、依存方向、テスト構造"
documentation_strategy:
  担当: "documents/ 内部の配置、案内、保守"
```

一つのフォルダに複数の意味がある場合も、それぞれの戦略を、その戦略が担当する観点にだけ適用します。
