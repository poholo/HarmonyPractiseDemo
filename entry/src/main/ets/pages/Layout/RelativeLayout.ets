
// 必须得设置id，不设置id，无法显示
@Entry
@Component
struct RelativeContainer1 {
  build() {
    Row() {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor(Color.Red)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          })
          .id('row1')
        Row().width(100).height(100).backgroundColor(Color.Orange)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
          .id('row2')
      }
      .width(300)
      .height(300)
      .border({ width:2, color: '#6699ff'})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}