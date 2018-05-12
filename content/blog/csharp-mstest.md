---
date: "2017-07-06T18:00:00+09:00"
draft: false
title: "[C#] MSTest"
tags: [
    "CSharp",
    "Visual Studio",
    "Unit Testing",
    "MSTest",
]

---

## MSTest とは

Visual Studio Unit Testing Framework のコマンドラインツールっぽいけど<br>
Visual Studio に統合されているからか、ほぼイコールで扱われている気がする。<br>
Visual Studio Unit Testing Framework という名前が長いからみんな MSTest って呼んでる？

## 利点
Visual Studio に統合されている点が強みっぽい。<br>
<br>
他の Unit Testing Framework を使用していないので比較してどうとかは知らない。
<br>
Visual Studio 2017 Enterprise ならコードの編集中にテストを実行してくれるが、<br>
残念ながら Professional を使っているので恩恵には与れない…。<br>

## テストクラスとテストメソッドの指定
`[TestClass]` と `[TestMethod]` の属性を設定すれば良い。

## 初期化処理と終了処理
テストケース毎に初期化処理と終了処理を共通化するメソッド、<br>
いわゆる `Setup` と `Teardown` メソッドの指定方法。

|対象|初期化処理|終了処理|
|---|---|---|
|テストプロジェクト|`[AssemblyInitialize]` 属性をメソッドに設定|`[AssemblyCleanup]` 属性をメソッドに設定|
|`[TestClass]` 属性を設定したクラス|`[ClassInitialize]` 属性をメソッドに設定|`[ClassCleanup]` 属性をメソッドに設定|
|`[TestMethod]` 属性を設定したメソッド|`[TestInitialize]` 属性をメソッドに設定|`[TestCleanup]` 属性をメソッドに設定|

### 指定例と実行例

```csharp
[TestClass]
public class UnitTest1
{
    [AssemblyInitialize]
    public static void AssemblyInitialize(TestContext context)
    {
        Trace.WriteLine("AssemblyInitialize");
    }

    [AssemblyCleanup]
    public static void AssemblyCleanup()
    {
        Trace.WriteLine("AssemblyCleanup");
    }

    [ClassInitialize]
    public static void ClassInitialize(TestContext context)
    {
        Trace.WriteLine("    ClassInitialize UnitTest1");
    }

    [ClassCleanup]
    public static void ClassCleanup()
    {
        Trace.WriteLine("    ClassCleanup UnitTest1");
    }

    [TestInitialize]
    public void TestInitialize()
    {
        Trace.WriteLine("        TestInitialize");
    }

    [TestCleanup]
    public void TestCleanup()
    {
        Trace.WriteLine("        TestCleanup");
    }
    [TestMethod]
    public void TestMethod1()
    {
        Trace.WriteLine("            TestMethod1");
    }
    [TestMethod]
    public void TestMethod2()
    {
        Trace.WriteLine("            TestMethod2");
    }
}

[TestClass]
public class UnitTest2
{
    [ClassInitialize]
    public static void ClassInitialize(TestContext context)
    {
        Trace.WriteLine("    ClassInitialize UnitTest2");
    }

    [ClassCleanup]
    public static void ClassCleanup()
    {
        Trace.WriteLine("    ClassCleanup UnitTest2 ");
    }

    [TestInitialize]
    public void TestInitialize()
    {
        Trace.WriteLine("        TestInitialize");
    }

    [TestCleanup]
    public void TestCleanup()
    {
        Trace.WriteLine("        TestCleanup");
    }
    [TestMethod]
    public void TestMethod1()
    {
        Trace.WriteLine("            TestMethod1");
    }
    [TestMethod]
    public void TestMethod2()
    {
        Trace.WriteLine("            TestMethod2");
    }
}

```

```
AssemblyInitialize
    ClassInitialize UnitTest1
        TestInitialize
            TestMethod1
        TestCeleanup
        TestInitialize
            TestMethod2
        TestCeleanup
    ClassCleanup UnitTest1
    ClassInitialize UnitTest2
        TestInitialize
            TestMethod1
        TestCeleanup
        TestInitialize
            TestMethod2
        TestCeleanup
    ClassCleanup UnitTest2
AssemblyCleanup
```

## Reference

- [Live Unit Testing in Visual Studio 2017 Enterprise \| The Visual Studio Blog](https://blogs.msdn.microsoft.com/visualstudio/2017/03/09/live-unit-testing-in-visual-studio-2017-enterprise/)
- [Visual Studio での Live Unit Testing \| Microsoft Docs](https://docs.microsoft.com/ja-jp/visualstudio/test/live-unit-testing)
- [Unit Testing Framework](https://msdn.microsoft.com/en-us/library/ms243147.aspx)
- [単体テストの基本 \| Microsoft Docs](https://docs.microsoft.com/ja-jp/visualstudio/test/unit-test-basics)
- [MsTestによるユニットテストの解説 \- Qiita](http://qiita.com/mima_ita/items/55394bcc851eb8b6dc24#moq)