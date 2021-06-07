import { defineComponent, h, onMounted, onUnmounted } from 'vue'
const _excelPuginsNames = [
  'OSFPerformance',
  'OSF',
  'ScriptLoading',
  'OfficeExt',
  'Office',
  'OTel',
  'CustomFunctionMappings',
  'CustomFunctions',
  'g_isExpEnabled',
  'g_isOfflineLibrary',
  'oteljs',
  'Microsoft',
  'Type',
  'Strings',
  '__extends',
  'OSFLog',
  'Logger',
  'OSFAriaLogger',
  'OSFAppTelemetry',
  'OSFPerfUtil',
  'OSFWebAuth',
  'OSF_DDA_Marshaling_File_FilePropertiesKeys',
  'OSF_DDA_Marshaling_File_SlicePropertiesKeys',
  'OSF_DDA_Marshaling_File_FileType',
  'OSF_DDA_Marshaling_File_ParameterKeys',
  'OSF_DDA_Marshaling_FilePropertiesKeys',
  'OSF_DDA_Marshaling_GoToType',
  'OSF_DDA_Marshaling_SelectionMode',
  'OSF_DDA_Marshaling_TableOptionProperties',
  'OSF_DDA_Marshaling_CellProperties',
  'OSF_DDA_Marshaling_CellFormatProperties',
  'OSF_DDA_Marshaling_BorderStyleType',
  'OSF_DDA_Marshaling_ColorType',
  'OSF_DDA_Marshaling_AlignHorizontalType',
  'OSF_DDA_Marshaling_AlignVerticalType',
  'OSF_DDA_Marshaling_FontStyleType',
  'OSF_DDA_Marshaling_FontUnderlineStyleType',
  'OSF_DDA_Marshaling_FontDirectionType',
  'OSF_DDA_Marshaling_WidthType',
  'OSF_DDA_Marshaling_HeightType',
  'AgaveFormatAPI',
  'OSF_DDA_Marshaling_AppCommand_AppCommandInvokedEventKeys',
  'OSF_DDA_Marshaling_AppCommand_AppCommandCompletedMethodParameterKeys',
  'OsfMsAjaxFactory',
  'OfficeExtension',
  'OfficeFirstPartyAuth',
  'OfficeCore',
  '__awaiter',
  '__generator',
  'Excel',
  '__assign',
  '_BeginExcel',
  '_EndExcel',
  'Sys',
  'OfficeExtensionBatch',
  '_OfficeRuntimeWeb',
  'OfficeRuntime',
  'oteljs_agave'
]

const _initializeExcelEvent = new Event('initialize-excel')
const _initializeExcelEventType = _initializeExcelEvent.type
class _ExcelIntializer {
  constructor() {}
  static installPlugins() {
    for (const extKey of _excelPuginsNames) {
      //@ts-ignore
      window[extKey] = window.parent[extKey]
    }
    console.log('excel installed!')
  }
}
export const ExcelIntializer = defineComponent({
  name: 'ExcelInitializer',
  setup() {
    onMounted(() => {
      if (parent)
        parent.addEventListener(
          _initializeExcelEventType,
          _ExcelIntializer.installPlugins
        )
    })

    onUnmounted(() => {
      if (parent)
        parent.removeEventListener(
          _initializeExcelEventType,
          _ExcelIntializer.installPlugins
        )
    })
    return () => h(<slot />)
  }
})
