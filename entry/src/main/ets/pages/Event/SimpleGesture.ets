@Entry
@Component
struct SimpleGeture {
  build() {
    Column() {
      TapEx()
      LongGestureEx()
      PanGestureEx()
    }
  }
}

@Component
struct TapEx {
  @State value: string = ''
  build() {
    Column() {
      Text('Tap Gesture 2 Click me')
        .gesture(
          TapGesture({ count: 2, fingers: 1})
            .onAction((event: GestureEvent)=>{
              this.value = JSON.stringify(event.fingerList[0])
            })
        )
      Text(this.value)
        .backgroundColor(Color.Pink)
        .fontSize(18)
    }
    .height(200)
    .width(259)
    .padding(20)
    .border({width: 3})
    .margin(30)
  }
}

@Component
struct LongGestureEx {
  @State count: number = 0
  build() {
    Column() {
      Text('LongPress onAction:' + this.count).fontSize(28)
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event: GestureEvent)=>{
              if(event.repeat) {
                this.count++
              }
            })
            .onActionEnd(()=>{
              this.count = 0
            })
        )
    }
    .height(200)
    .width(250)
    .padding(20)
    .border({ width: 3 })
    .margin(30)
  }
}

@Component
struct PanGestureEx {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  build() {
    Column() {
      Text('PanGesture Offset:\nX:' + this.offsetX + '\n' + 'Y:' + this.offsetY)
        .fontSize(28)
        .height(200)
        .width(300)
        .border({ width: 3 })
        .padding(20)
        .translate({ x: this.offsetX, y: this.offsetY, z: 0})
        .gesture(
          PanGesture()
            .onActionStart((event: GestureEvent)=>{
              console.info('Pan start')
            })
            .onActionUpdate((event: GestureEvent)=>{
              this.offsetX = this.positionX + event.offsetX
              this.offsetY = this.positionY + event.offsetY
            })
            .onActionEnd(()=>{
              this.positionX = this.offsetX
              this.positionY = this.offsetY
            })
        )

    }
    .height(200)
    .width(250)
  }
}