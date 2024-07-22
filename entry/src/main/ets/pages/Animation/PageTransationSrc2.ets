
import router from '@ohos.router';

@Entry
@Component
struct PageTransationSrc2 {
  build() {
    Column() {
      Image($r('app.media.org'))
        .width('90%')
        .height('80%')
        .margin(50)
        .objectFit(ImageFit.Fill)
        .syncLoad(true)
        .margin(50)
      Row({ space: 10 }) {
        Button('PushUrl')
          .onClick(()=>{
            router.pushUrl({ url: 'pages/Animation/PageTransationDest2'})
          })

        Button('Back')
          .onClick(()=>{
            router.back()
          })
      }
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)

  }

  pageTransition() {
    PageTransitionEnter({ duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ duration: 1000 })
      .translate({ x: 200, y: 200 })
      .opacity(0)

  }
}