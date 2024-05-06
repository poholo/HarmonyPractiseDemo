@Entry
@Component
struct PropTest  {
  @State currentCount: number = 99
  build() {
    Row() {
      Column() {
        Text(`current count = ${this.currentCount}`)
        Button() {
          Text('Parent 1')
            .backgroundColor(Color.White)
        }
        .width(200)
        .height(40)
        .margin({top:40})
        .backgroundColor(Color.Yellow)
        .onClick(()=>{
          this.currentCount += 1
        })
        PropParent({ count: this.currentCount })
          .margin({ top:40 })
          .width(200)
          .backgroundColor(Color.Pink)
        PropChild( { count: this.currentCount })
          .margin({ top: 40 })
          .width(200)
          .backgroundColor(Color.Brown)

      }
    }
  }
}

@Component
struct PropParent {
  @Prop count: number
  build() {
    Column() {
      Text(`Child1 count ${this.count}`)
        .fontColor(Color.Red)
        .width('100%')
        .height(40)
      Button() {
        Text('Click 6')
      }
      .width(200)
      .height(40)
      .margin({ top: 40 })
      .onClick(() => {
        this.count += 6
      })
    }
  }
}

@Component
struct PropChild {
  @Prop count: number
  build() {
    Column() {
      Text(`Child2 count ${this.count}`)
        .fontColor(Color.Orange)
        .width('100%')
        .height(40)
      Button() {
        Text(`Child2 count ${this.count}`)
      }
      .width(200)
      .height(40)
      .margin({ top: 40 })
      .onClick(() => {
        this.count += 11
      })
    }
  }
}