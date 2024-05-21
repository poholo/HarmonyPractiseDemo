@Component
struct StackLayout {
  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Text('1')
        .margin({ top: 10, left: 10, bottom: 10, right: 10 })
        .backgroundColor('#ff58b87c')
        .width('90%')
        .height('90%')
        .zIndex(1)
      Text('2')
        .width('60%')
        .height('60%')
        .backgroundColor('#ffc3f6aa')
        .zIndex(2)
      Text('3')
        .width('30%')
        .height('30%')
        .backgroundColor('#ffd306')
        .zIndex(3)
    }
    .width('100%')
    .height(250)
    .backgroundColor(Color.Gray)
  }
}

@Entry
@Component
struct PhoneHome {
  private arr: String[] = ['APP1', 'APP2', 'APP3', 'APP4', 'APP5', 'APP6', 'APP7', 'APP8', 'APP9']
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.arr, (item) => {
          Text(item)
            .width(100)
            .height(100)
            .fontSize(16)
            .margin(10)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }, item => item)
      }.width('100%').height('100%')

      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Text('联系人').fontSize(16)
        Text('设置').fontSize(16)
        Text('短信').fontSize(16)
      }
      .width('50%')
      .height(50)
      .backgroundColor('#16302e2e')
      .margin({ bottom: 15 })
      .borderRadius(15)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#CFD0CF')

  }
}



