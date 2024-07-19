
@Entry
@Component
struct AnimationTest {
  @State myWidth: number = 100
  @State myHeight: number = 50
  @State flag: boolean = false

  build() {

    Column() {
      Button("text")
        .type(ButtonType.Normal)
        .width(this.myWidth)
        .height(this.myHeight)
        .margin(20)

      Button('Area : click me')
        .fontSize(12)
        .margin(20)
        .onClick(()=>{
          animateTo({ duration: 1000, curve: Curve.Ease }, () => {
            if (this.flag) {
              this.myWidth = 100
              this.myHeight = 50
            } else {
              this.myWidth =  200
              this.myHeight = 100
            }
            console.log('' + this.flag)
            this.flag = !this.flag
          })
        })
    }
  }
}