
import router from '@ohos.router';

@Entry
@Component
struct PageTransationPushTest {
  build() {
    Column() {
      Image($r('app.media.caomei'))
        .width('90%')
        .height('80%')
        .objectFit(ImageFit.Fill)
        .syncLoad(true)
        .margin(30)

      Row({ space: 10 }) {
        Button('pushURL')
          .onClick(()=>{
            router.pushUrl({url: 'pages/Animation/PageTransationPushDest'})
          })

        Button('back')
          .onClick(()=>{
            router.back()
          })
      }.justifyContent(FlexAlign.Center)

    }
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Right)
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000})
      .slide(SlideEffect.Left)
    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)
  }
}