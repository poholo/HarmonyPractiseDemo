
import curves from '@ohos.curves';

@Entry
@Component
struct SpringAnimationTest2 {

  @State positionX: number = 100
  @State positionY: number = 100
  diameter: number = 50
  build() {
    Column() {
      Row() {
        Circle({ width: this.diameter, height: this.diameter })
          .fill(Color.Blue)
          .position({ x: this.positionX, y: this.positionY })
          .onTouch((event: TouchEvent)=>{
            if(event.type === TouchType.Move) {
              animateTo({ curve: curves.responsiveSpringMotion()}, ()=>{
                this.positionX = event.touches[0].screenX - this.diameter / 2
                this.positionY = event.touches[0].screenY - this.diameter / 2
                console.info(`move, animateTo x:${this.positionX}, y: ${this.positionY}`)

              })
            } else if(event.type === TouchType.Up) {
              animateTo({ curve: curves.springMotion() }, ()=>{
                this.positionX = 100
                this.positionY = 100
                console.info(`touchup, animateTo x: 100, y: 100`)
              })
            }
          })
      }
      .width('100%')
      .height('80%')
      .clip(true)
      .backgroundColor(Color.Orange)

      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Center }) {
        Text('拖动小球').fontSize(16)
      }
      .width('100%')

      Row() {
        Text('点击位置: [x:' + Math.round(this.positionX) + ', y:' + Math.round(this.positionY) + ']').fontSize(16)
      }
      .padding(10)
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}