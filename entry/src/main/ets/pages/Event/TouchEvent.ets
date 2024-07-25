@Entry
@Component
struct TouchEvent {
  @State number: string[] = ['drag here']
  @State text: string = ''
  @State bool1: boolean = false
  @State bool2: boolean = false
  @State visible: Visibility = Visibility.Visible
  @State visible2: Visibility = Visibility.None
  scroller: Scroller = new Scroller()
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('App2')
        .width('40%')
        .height(80)
        .fontSize(20)
        .margin(30)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Pink)
        .visibility(Visibility.Visible)

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.number, (item)=>{
          ListItem() {
            Text(item)
              .width('100%')
              .height(80)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xFFFFFF)
          }

        }, item=>item)

        ListItem() {
          Text('Across Window Drag This')
            .width('80%')
            .height(80)
            .fontSize(16)
            .margin(30)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Pink)
            .visibility(this.visible2)
        }
      }
      .height('50%')
      .width('90%')
      .border({ width: 1})
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .onDragEnter((event: DragEvent, extraParams: string) => {
        console.info('List onDragEnter' + extraParams)
      })
      .onDragMove((event: DragEvent, extraParams: string) => {
        console.info('List onDragMove' + extraParams)
      })
      .onDragLeave((event: DragEvent, extraParams: string) => {
        console.info('List onDragLeave' + extraParams)
      })
      .onDrop((event: DragEvent, extraParams: string) => {
        console.info('List onDragDrop' + extraParams)
        this.visible2 = Visibility.Visible
      })
    }
  }
}