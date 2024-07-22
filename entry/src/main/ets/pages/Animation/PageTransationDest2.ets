
import router from '@ohos.router';

@Entry
@Component
struct PageTransationDest2 {
  build() {
    Column() {
      Image($r('app.media.caomei'))
        .width('90%')
        .height('80%')
        .margin(50)
        .syncLoad(true)
        .objectFit(ImageFit.Fill)

      Row({ space: 10 }) {
        Button('PushURL')
          .onClick(()=>{
            router.pushUrl({ url: 'pages/Animation/PageTransationSrc2'})
          })

        Button('Back')
          .onClick(()=>{
            router.back()
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ duration: 1000 })
      .translate({ x: 100, y: 100 })
      .opacity(0)
  }
}