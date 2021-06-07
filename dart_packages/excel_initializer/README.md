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
const excelInstalledEventName = "excel-initialized";
const excelInstallEventName = "initialize-excel";

const successEvent =  new CustomEvent(
  excelInstalledEventName, { detail: { isIntialized: true }}
);
const unsuccessEvent = new CustomEvent(
  excelInstalledEventName, { detail: { isIntialized: false }}
)

function initOfficeScript() {
  console.log('intializing office')
  const scriptTag = document.createElement('script')
  scriptTag.src =
    'https://appsforoffice.microsoft.com/lib/1/hosted/office.js'
  scriptTag.id = 'office'
  scriptTag.addEventListener('load', () => {})
  try {
    const info = await Office.onReady(async (context) => context)
    // we check all platforms and if every is null
    // then deinstall script and return false
    for (const platform of Object.values(info)) {
      if (platform != null) {
        window.dispatchEvent(successEventsuccessEvent)
        return
      }
    }
    window.dispatchEvent(unsuccessEventsuccessEvent)
  } catch (error) {
    window.dispatchEvent(unsuccessEventsuccessEvent)
  }
  document.getElementsByTagName('head')[0].appendChild(scriptTag)
}

window.addEventListener(excelInstallEventName, initOfficeScript)
```
