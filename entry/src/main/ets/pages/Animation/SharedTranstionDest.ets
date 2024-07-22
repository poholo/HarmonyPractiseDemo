
import router from '@ohos.router'
@Entry
@Component
struct ShareTranstionDest {
  build() {
    Column() {
      Text('SharedTranstion dest page')
        .fontSize(16)
        .sharedTransition('Text', {duration: 500, curve: Curve.Linear, type: SharedTransitionEffectType.Static})
        .margin({ top: 10 })

      Image($r('app.media.xuehua'))
        .width(150)
        .height(150)
        .sharedTransition('sharedImage1', {duration: 500, curve: Curve.Linear })
        .onClick(()=>{
          router.back()
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}