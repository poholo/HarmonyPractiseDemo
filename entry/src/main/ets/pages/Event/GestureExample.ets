@Entry
@Component
struct GestureExample {

  build() {
    Column() {
      Text('Gesture').fontSize(28)
        .gesture(
          TapGesture().onAction(()=>{
            console.info('Text TapGesture is onAction')
          })
        )
        .height(200)
        .width(250)
        .backgroundColor(Color.Orange)
    }
    .width('100%')
    .height(400)
    .backgroundColor(Color.Pink)
    .alignItems(HorizontalAlign.Center)
    .priorityGesture(
      TapGesture.onAction(() => {
        console.info('Column TapGesture is onAction')
      }), GestureMask.IgnoreInternal
    )
    // .parallelGesture(
    //   TapGesture()
    //     .onAction(()=>{
    //       console.info('Column TapGesture is onAction')
    //     }), GestureMask.IgnoreInternal
    // )



  }
}