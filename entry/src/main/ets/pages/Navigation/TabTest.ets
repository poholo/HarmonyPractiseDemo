
@Entry
@Component
struct TabTest {
  @State currentIndex: number = 0
  private tabsController = new TabsController()
  build() {
    Tabs({ barPosition: BarPosition.Start,  controller: this.tabsController }) {
      TabContent() {
        Text('首页内容')
          .fontSize(30)
      }
      .backgroundColor(Color.Red)
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.guanliyuan_normal'), $r('app.media.guanliyuan_selected')))

      TabContent() {
        Text('推荐页面内容')
      }
      .tabBar(this.TabBuilder('推荐', 1, $r('app.media.guanliyuan_normal'), $r('app.media.guanliyuan_selected')))

      TabContent() {
        Text('新闻页面')
      }
      .tabBar(this.TabBuilder('新闻', 2, $r('app.media.guanliyuan_normal'), $r('app.media.guanliyuan_selected')))

      TabContent() {
        Text('Custom')
      }
      .tabBar(this.TabBuilder('custom', 3, $r('app.media.editor_center_alignment'), $r('app.media.business_icon_feeds_fill')))
    }
    .vertical(true)
    .barWidth(100)
    .barHeight(200)
    // .scrollable(false)
    .barMode(BarMode.Fixed)
    .onChange((index)=>{
      this.currentIndex = index
      console.log('onchange: index = ' + index)
    })
  }


  @Builder TabBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex == targetIndex ? selectedImg: normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex == targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
      console.log('|||||currentIndex ' + this.currentIndex)
    })
  }

}