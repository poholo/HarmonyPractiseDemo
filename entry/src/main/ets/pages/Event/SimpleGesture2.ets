import commonEvent from '@ohos.commonEvent'
@Entry
@Component
struct SimpleGesture2 {
  build() {
    Column() {
      PinchGestureEx()
      PanGestureExp()
      // RotationExp()
      SwipeGestureExp()
    }
  }
}

@Component
struct PinchGestureEx {
  @State scaleValue: number = 1
  @State pinchValue: number = 1
  @State pinchX: number = 0
  @State pinchY: number = 0
  build() {
    Column() {
      Column() {
        Text('PinchGesture scale:\n' + this.scaleValue)
        Text('PinchGesture center:\n(' + this.pinchX + ',' + this.pinchY + ')')
      }
      .height(200)
      .width(300)
      .border({width: 3})
      .margin({ top: 100})
      .scale({x: this.scaleValue, y: this.scaleValue, z: 1})
      .gesture(
        PinchGesture({ fingers: 2 })
          .onActionStart((event: GestureEvent) => {
            console.info('Pinch start')
          })
          .onActionUpdate((event: GestureEvent)=>{
            this.scaleValue = this.pinchValue * event.scale
            this.pinchX = event.pinchCenterX
            this.pinchY = event.pinchCenterY
          })
          .onActionEnd(()=>{
            this.pinchValue = this.scaleValue
            console.info('Pinch end')
          })
      )

    }
  }
}


@Component
struct PanGestureExp {
  @State  offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0

  build() {
    Column() {
      Text('PanGesture offset:\nx:' + this.offsetX + '\nY:' + this.offsetY)
        .fontSize(28)
        .height(200)
        .width(300)
        .padding(20)
        .border({ width: 3 })
        .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
        .gesture(
          PanGesture()
            .onActionStart((event: GestureEvent) => {
              console.info('Pan Start')
            })
            .onActionUpdate((event: GestureEvent) => {
              this.offsetX = this.positionX + event.offsetX
              this.offsetY = this.positionY + event.offsetY
            })
            .onActionEnd((event: GestureEvent) => {
              this.positionX = this.offsetX
              this.positionY = this.offsetY
            })
        )
    }
  }
}

@Component
struct RotationExp {
  @State angle: number = 0
  @State rotateValue: number = 0
  build() {
    Column() {
      Text('RotationGesture angle:' + this.angle).fontSize(28)
        .rotate({ angle: this.angle })
        .gesture(
          RotationGesture()
            .onActionStart((event: GestureEvent)=>{
              console.info('RotationGesture is onActionStart')
            })
            .onActionUpdate((event: GestureEvent)=>{
              this.angle = this.rotateValue + event.angle
              console.info('RotationGesture is update')
            })
            .onActionEnd((event: GestureEvent)=>{
              this.rotateValue = this.angle
              console.info('RotationGesture is onActionEnd')
            })
            .onActionCancel(()=>{
              console.info('RotationGesture is onActionCancel')
            })

        )

    }
    .height(200)
    .width(250)
  }
}

@Component
struct SwipeGestureExp {
  @State rotateAngle: number = 0
  @State speed: number = 1
  build() {
    Column() {
      Column() {
        Text('SwipeGesture speed\n' + this.speed)
        Text('SwipeGesture angle\n' + this.rotateAngle)
      }
      .border({ width: 3 } )
      .width(300)
      .height(200)
      .margin(100)
      .rotate({ angle: this.rotateAngle })
      .gesture(
        SwipeGesture({ direction: SwipeDirection.Vertical })
          .onAction((event: GestureEvent)=>{
            this.speed = event.speed
            this.rotateAngle = event.angle
          })
      )
    }
  }
}



