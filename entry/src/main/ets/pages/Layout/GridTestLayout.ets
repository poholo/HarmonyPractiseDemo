//Grid . 组件为网格容器


@Entry
@Component
struct GridTestLayout {
  private avaliableThings: string[] = ['读书', '运动', '旅游', '听音乐', '看电影', '唱歌', '读书2', '运动3', '旅游4', '听音乐5', '看电影6', '唱歌7']
  private scroller: Scroller = new Scroller()
  build() {
    Grid(this.scroller) {
      ForEach(this.avaliableThings, (item: string, index: number) => {
        if(index == 0) {
          GridItem() {
            Text(item + '00')
          }
          .border({ width: 1, color: Color.Red })
          // .columnStart(1)
          // .columnEnd(3)
        } else if(index == 1) {
          GridItem() {
            Text(item + '111')
          }
          .border({ width: 1, color: Color.Orange })
          // .rowStart(1)
          // .rowEnd(2)
        } else {
          GridItem() {
            Text(item)
          }
          .border({ width: 1, color: Color.Red })
          .width('45%')
          .height('50%')
        }

      }, (item: string, index: number) => item)

    }
    // .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr')
    .maxCount(3)
    .layoutDirection(GridDirection.Row)
    .columnsGap(10)
    .rowsGap(15)
  }
}