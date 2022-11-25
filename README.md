# How do we restate a theorem which uses the equation counter?

LaTeXにおいて，[thmtools](https://www.ctan.org/pkg/thmtools) の `restatable` を用いることでコピペせずに定理を再掲することができる．

しかし，定理と数式とカウンタを共有している場合，再掲出時に定理中の数式のカウンタが $-1$ ずれてしまう．
具体的に述べると，以下のような挙動を示す：

- Section 1
  - 定理 1.1
    - 数式 (1.2)
- Section 2
  - 数式 (2.1)
  - 定理 1.1 (再掲)
    - 数式 (1.1) (再掲時に数式番号が(1.2)より一つ前にずれてしまう．)
  - 数式 (2.2)

本レポジトリの目的は，上記に対する処方箋をサンプル付きで示すことである．

## 処方箋

[thmtools](https://www.ctan.org/pkg/thmtools) の `thmt@restatable` environmentの定義において，
> prevent stepcountering the theorem number
として，カウンタのインクリメントを防止する処置を行っている．
(Package documentationのA.1.6 Restrictionsを参照のこと)

しかし，定理と数式とカウンタを共有している場合，この処置は不要と思われる．

実際に該当部分を取り除くことで，再掲時に適切な数式番号が表示されることが確認できた．
