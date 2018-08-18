---
year: "{{ dateFormat "2006" .File.TranslationBaseName }}"
month: "{{ dateFormat "2006/01" .File.TranslationBaseName }}"
date: "{{ dateFormat "2006-01-02" .File.TranslationBaseName }}"
title: "{{ dateFormat "2006-01-02" .File.TranslationBaseName }} "
draft: true
tags: [
    "日報"
]

---

