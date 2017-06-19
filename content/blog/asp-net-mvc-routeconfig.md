+++
date = "2017-06-19T17:54:00+09:00"
draft = false
title = "[C#][ASP.NET MVC] RouteConfig の設定"
tags = [
    "CSharp",
    "ASP.NET MVC",
]

+++

## RouteConfig.cs

```csharp
public class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        // リソースデータに直接アクセスされない為の記述
        routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
        // 属性で定義したルーティングにマッピングする
        routes.MapMvcAttributeRoutes();
    }
}
```

## TestController.cs

```csharp
[RoutePrefix("test")]
public class TestController : Controller
{
    [HttpGet]
    [Route("get")]
    public ActionResult Get()
    {
        return View();
    }

    [HttpPost]
    [Route("post")]
    public ActionResult Post()
    {
        return View();
    }
}
```

`RoutePrefix`, `Route` でルーティングの設定を行う。


## Reference
[ASP\.NET MVC のRouteConfig以外でのRouteの指定方法 \- Qiita](http://qiita.com/AquaFresh/items/9b42cc8355e902178fb8)