// 共享元素转场进行放大缩小图片

import router from '@ohos.router';

@Entry
@Component
struct SharedTranstionTest {
  build() {
    Column() {
      Image($r('app.media.xuehua')).width(50).height(50)
        .sharedTransition('sharedImage1', {duration: 1000, curve: Curve.Linear })
        .onClick(()=>{
          router.pushUrl({ url: 'pages/Animation/SharedTranstionDest'})
        })
    }
    .padding(10)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}