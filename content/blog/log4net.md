+++
date = "2017-04-10T17:54:00+09:00"
draft = false
title = "log4net"
tags = [
    "log4net",
    "CSharp",
]

+++

## log4net is the de facto standard for logging library in C#(.NET)

[Apache log4net – Apache log4net: Home](http://logging.apache.org/log4net/)

### What are the features of log4net?

[Apache log4net – Apache log4net: Frequently Asked Questions](http://logging.apache.org/log4net/release/faq.html#What_are_the_features_of_log4net)

## Configure log4net

[Apache log4net – Apache log4net Manual: Configuration](http://logging.apache.org/log4net/release/manual/configuration.html)

### AssemblyInfo.cs
```
[assembly: log4net.Config.XmlConfigurator(ConfigFile = @"log4net.config", Watch = true)]
```

### Web.config
```
<configuration>
  <configSections>
    <section name="log4net" type="log4net.Config.Log4NetConfigurationSectionHandler, log4net" />
  </configSections>
</configuration>
```

### log4net.config
```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  ﻿<log4net>
    <root>
      <level value="DEBUG"/>
      <appender-ref ref="FileAppender"/>
      <appender-ref ref="BacklogAppender"/>
    </root>
    <appender name="FileAppender" type="log4net.Appender.RollingFileAppender">
      <param name="Threshold" value="DEBUG" />
      <!-- ファイル名 -->
      <File value=".\logs\App.log" />
      <!-- 出力エンコーディング -->
      <Encoding value="UTF-8"/>
      <!-- ファイル書き込み { 追記: true, 上書き: false } -->
      <param name="AppendToFile" value="true" />
      <!-- 最大保存ファイルサイズ -->
      <param name="MaximumFileSize" value="1MB" />
      <!-- 最大保存ファイル数 (古い順に削除) -->
      <param name="MaxSizeRollBackups" value="2" />
      <!-- ローテーション -->
      <param name="CountDirection" value="-1" />
      <!-- ファイル名の固定 -->
      <param name="StaticLogFileName" value="false" />
      <!-- ログファイルの切替 { サイズ: Size, 日付: Date, サイズと日付の両方: Composite } -->
      <param name="RollingStyle" value="Size" />
      <!-- 拡張子の保持 -->
      <param name="PreserveLogFileNameExtension" value="true" />
      <lockingModel type="log4net.Appender.FileAppender+MinimalLock" />
      <!-- 出力文字列のフォーマット -->
      <layout type="log4net.Layout.PatternLayout">
        <conversionPattern value="%d [%t] %p - %C#%M: %m%n"/>
      </layout>
    </appender>
    <appender name="BacklogAppender" type="App.BacklogAppender">
      <apiKey>Your Backlog API Key</apiKey>
      <param name="Threshold" value="WARN" />
    </appender>
  </log4net>
</configuration>
```

### Custom Appender

Backlog にエラーログ等を投げ付けて課題を作成するカスタム Appender

```
namespace App
{
    public class BacklogAppender : AppenderSkeleton
    {
        public string apiKey { get; private set; }
        private static HttpClient client = new HttpClient();
        private string GetIssueTypeId(LoggingEvent loggingEvent)
        {
            var issueTypeId = "158525";
            switch (loggingEvent.Level.Name)
            {
                case "ERROR":	issueTypeId = "158525";	break;
                case "WARN":	issueTypeId = "158526";	break;
                case "INFO":	issueTypeId = "158527";	break;
                case "DEBUG":	issueTypeId = "158528";	break;
                default:		issueTypeId = "158525";	break;
            }
            return issueTypeId;
        }

        protected override void Append(LoggingEvent loggingEvent)
        {
            var apiUrl = $@"https://YOUR.backlog.jp/api/v2/issues?apiKey={apiKey}";
            var content = new FormUrlEncodedContent(new Dictionary<string, string>
            {
                { "projectId", "35531" },
                { "summary", loggingEvent.LocationInformation.FullInfo },
                { "description", loggingEvent.RenderedMessage + "\r\n" + "\r\n" + "```" + "\r\n" + loggingEvent.GetExceptionString() + "\r\n" + "```" },
                { "issueTypeId", GetIssueTypeId(loggingEvent) },
                { "priorityId", "2" },
                { "categoryId[]", "71645" }
            });
            client.PostAsync(apiUrl, content);
        }
    }
}
```

### Use log4net

```
namespace App.Controllers
{
    [RoutePrefix("test")]
    public class TestController : ApiController
    {
        private ILog logger = LogManager.GetLogger(typeof(TestController));

        [HttpGet]
        [Route("error")]
        public HttpResponseMessage Error()
        {
            logger.Debug("test/error");
            var e = new Exception("test/error エラーテスト");
            logger.Error(e.Message, e);
            return this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e);
        }
    }
}
```
