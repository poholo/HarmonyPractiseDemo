
import webview from '@ohos.web.webview'
@Component
@Entry
struct WebExample {

  webviewController: webview.WebviewController = new webview.WebviewController
  @State mode: WebDarkMode = WebDarkMode.Auto
  build() {
    Column() {
      Column() {
        Button('loadUrl')
          .onClick(()=>{
            try {
              // this.webviewController.loadUrl('www.baidu.com')
              this.webviewController.loadData('<html><body bgcolor="white">sorce</body></html', 'text/html', 'UTF-8')

            } catch (error) {
              console.error(`ErrorCode: ${error.code}, Message: ${error.message}`)
            }
          })
        Web({ src: 'www.baidu.com', controller: this.webviewController})
          .darkMode(this.mode)
      }
    }
  }
}