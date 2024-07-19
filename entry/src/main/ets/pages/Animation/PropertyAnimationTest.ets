import curves from '@ohos.curves';

@Component
@Entry
struct PropertyAnimationTest {
  @State animate: boolean = false
  @State rotateValue: number = 0 // 组件1选择角度
  @State translateX: number = 0 //组件2偏移量
  @State opacityValue: number = 1  //组件2透明度

  build() {
    Row() {
      Column() {
      }
      .rotate({ angle: this.rotateValue })
      .backgroundColor('#317AF7')
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .borderRadius(30)
      .onClick(() => {
        animateTo({ curve: curves.springMotion() }, () => {
          this.animate = !this.animate
          this.rotateValue = this.animate ? 90 : 0
          this.opacityValue = this.animate ? 0.6 : 1
          this.translateX = this.animate ? 50 : 0
        })
      })

      Column() {

      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor('#D94838')
      .borderRadius(30)
      .opacity(this.opacityValue)
      .translate({ x: this.translateX })
    }
  }
}