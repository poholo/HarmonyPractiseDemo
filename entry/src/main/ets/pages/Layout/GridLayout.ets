// GridRow GridCol
//栅格布局
@Entry
@Component
struct GirdLayout {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown, Color.Red, Color.Orange, Color.Yellow, Color.Green]
  build() {
    GridRow({ gutter: { x: 20, y: 100 }, direction: GridRowDirection.Row, columns: { sm: 4, md: 8 }, breakpoints: { value: ['200vp', '300vp', '400vp', '500vp', '600vp'] } }) {
      ForEach(this.bgColors, (item, index) => {
        GridCol({ span: 1, offset: 0, order: 100 - index }) {
          Row() {
            Text(`${index + 1}`)
          }.width('100%').height(50)
        }
        .backgroundColor(item)

      })
    }
  }
}

// 排列方式 direction: GridRowDirection.Row .RowReverse
// 子组件间距 gutter: 10 gutter: {x: 20, y: 50}
//GridCol({ span: 2}) 子组件占栅格
// GridCol({ offset: 0 }) 栅格子组件偏移列数

// GridCol({ order: 3}) order 值 小到大排列