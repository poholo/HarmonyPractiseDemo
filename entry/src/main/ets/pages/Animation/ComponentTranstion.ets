
// @Entry
@Component
struct ComponentTranstion {
  @State flag: boolean = true
  @State show: string = 'show'
  build() {
    Column() {
      Button(this.show).width(80).height(30).margin(30)
        .onClick(()=>{
          if (this.flag) {
            this.show = 'hide'
          } else {
            this.show = 'show'
          }
          animateTo({ duration: 1000}, ()=>{
            this.flag = !this.flag
          })
        })
      if (this.flag) {
        Image($r('app.media.xuehua')).width(200).height(200)
          .transition({ type: TransitionType.Insert, translate: {x: 200, y: -200}})
          .transition({ type: TransitionType.Delete, opacity: 0, scale: {x: 0, y: 0}})
      }
    }.height('100%').width('100%')
  }
}

@Entry
@Component
struct ForEachTransition {
  @State numbers: string[] = ['1', '2', '3', '4', '5']
  startNumber: number = 6
  build() {
    Column({ space: 10 }) {
      Column() {
        ForEach(this.numbers, (item) => {
          Text(item)
            .width(240)
            .height(60)
            .fontSize(18)
            .borderWidth(1)
            .backgroundColor(Color.Orange)
            .textAlign(TextAlign.Center)
            .transition({ type: TransitionType.All, translate: {x: 200}, scale: {x: 0, y: 0}})
        }, item => item)
      }
      .margin(10)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
      .width('90%')
      .height('70%')

      Button('向头部添加元素')
        .fontSize(16)
        .width(160)
        .onClick(()=>{
          animateTo({ duration: 1000}, ()=>{
            this.numbers.unshift(this.startNumber.toString())
            this.startNumber++
          })
        })

      Button('向尾部添加元素')
        .fontSize(16)
        .width(160)
        .onClick(()=>{
          animateTo({ duration: 1000 }, ()=>{
            this.numbers.push(this.startNumber.toString())
            this.startNumber++
          })
        })

      Button('删除头部元素')
        .fontSize(160)
        .fontSize(16)
        .onClick(()=>{
          animateTo({ duration: 1000}, ()=>{
            this.numbers.shift()
          })
        })

      Button('删除尾部元素')
        .fontSize(160)
        .fontSize(16)
        .onClick(()=>{
          animateTo({ duration: 1000}, ()=>{
            this.numbers.pop()
          })
        })
    }
  }
}