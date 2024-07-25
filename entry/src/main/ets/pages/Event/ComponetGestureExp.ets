@Entry
@Component
struct ComponentGestureExp {
  build() {
    Column() {
      LongPanGestureExp()
      ParallelGestureExp()
      ExclusiveExp()
    }
  }
}

@Component
struct LongPanGestureExp {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State count: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  @State borderStyles: BorderStyle = BorderStyle.Solid
  build() {
    Column() {
      Text('Sequence gesture\n' + 'LongPress onAction:' + this.count + '\nPangesture offset:\nx:' + this.positionX + '\nY:' + this.offsetY)
        .fontSize(28)
    }
    .translate({x: this.offsetX, y: this.offsetY })
    .height(250)
    .width(300)
    .border({ width: 3 })
    .borderStyle(this.borderStyles)
    .gesture(
      GestureGroup(GestureMode.Sequence,
        LongPressGesture({ repeat: true })
          .onAction((event: GestureEvent)=>{
            if(event.repeat) {
              this.count++
            }
            console.info('LongPress onAction')
          })
          .onActionEnd((event: GestureEvent)=>{
            console.info('LongPress End')
          }),
        PanGesture()
          .onActionStart(()=>{
            this.borderStyles = BorderStyle.Dashed
            console.info('PanGesture Start')
          })
          .onActionUpdate((event: GestureEvent)=>{
            this.offsetX = this.positionX + event.offsetX
            this.offsetY  = this.positionY + event.offsetY
            console.info('PanGesture update')
          })
          .onActionEnd(()=>{
            this.positionX = this.offsetX
            this.positionY = this.positionY
            this.borderStyles = BorderStyle.Solid
          })

      )
    )
  }
}


@Component
struct ParallelGestureExp {
  @State count1: number = 0
  @State count2: number = 0
  build() {
    Column() {
      Column() {
        Text('Parallel gesture\n' + 'tapGesutre count is 1:' + this.count1)
          .fontSize(28)
        Text('TapGesture count is 2:' + this.count2)
          .fontSize(28)
      }
      .width(400)
      .height(150)
      .border({ width: 1 })
      .gesture(
        GestureGroup(GestureMode.Parallel,
          TapGesture({ count: 1 })
            .onAction(()=>{
              this.count1++
            }),
          TapGesture({ count: 2 })
            .onAction(()=>{
              this.count2++
            })
        )
      )

    }
  }
}

@Component
struct ExclusiveExp {
  @State count1: number = 0
  @State count2: number = 0

  build() {
    Column() {
      Text('ExclusiveExp gesture\ntapGesture count is 1:' + this.count1 + '\ntapGesture count is 2:' + this.count2)
        .fontSize(28)
    }.height(300)
    .width(250)
    .borderWidth(3)
    .gesture(
      GestureGroup(GestureMode.Exclusive,
        TapGesture({ count: 1 })
          .onAction(()=>{
            this.count1++
          }),
        TapGesture({ count: 2 })
          .onAction(()=>{
            this.count2++
          })
      )
    )
  }
}
