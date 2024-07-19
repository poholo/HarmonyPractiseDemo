
import curves from '@ohos.curves'
@Entry
@Component
struct SpringAnimation {
  @State translateX: number = 0

  private jumpWithSpeed(speed: number) {
    this.translateX = -10
    animateTo({ duration: 2000, curve: curves.springCurve(speed, 1, 1, 1.1)}, ()=>{
      this.translateX = 0
    })
  }
  build() {
    Column() {
      Button('Button')
        .fontSize(14)
        .width(100)
        .height(50)
        .margin(30)
        .translate({ x: this.translateX })

      Row({ space: 50}) {
        Button('Jump 50').fontSize(14)
          .onClick(()=>{
            this.jumpWithSpeed(50)
          })

        Button('Jump 200').fontSize(14)
          .onClick(()=>{
            this.jumpWithSpeed(200)
          })
      }.margin(30)
    }.height('100%').width('100%')
  }
}