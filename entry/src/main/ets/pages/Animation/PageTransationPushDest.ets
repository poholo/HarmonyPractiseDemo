import router from '@ohos.router'
@Entry
@Component
struct PageTransationPushDest {
  build() {
    Column() {
      Image($r('app.media.org'))
        .objectFit(ImageFit.Fill)
        .width('90%')
        .height('80%')
        .syncLoad(true)
        .margin(30)
      Row({ space: 10 }) {
        Button('PushUrl')
          .onClick(()=>{
            router.pushUrl({ url: 'pages/Animation/PageTransationPushTest'})
          })

        Button('back')
          .onClick(()=>{
            router.back()
          })
      }.justifyContent(FlexAlign.Center)

    }.width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Right)
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Left)

    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)

  }
}