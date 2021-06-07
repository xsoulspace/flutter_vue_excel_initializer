# excel_initializer

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

Consist from one simple widget that installs excel to html parent window


```javascript
function initOfficeScript() {
  const scriptTag = document.createElement('script')
  scriptTag.src =
    'https://appsforoffice.microsoft.com/lib/1/hosted/office.js'
  scriptTag.id = 'office'
  scriptTag.addEventListener('load', () => {
    Office.onReady(async (context) => context)
  })
  document.getElementsByTagName('head')[0].appendChild(scriptTag)
}
window.addEventListener('initialize-excel', () => initOfficeScript())
```
