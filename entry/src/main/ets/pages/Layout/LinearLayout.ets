
@Entry
@Component
/**
 * 线性布局
 */
struct LinerLayoutDemo {
  build() {
    Scroll() {
      Column() {
        VerticalLayout()
        HorizontalLayout()
        VerticalJustifyLayout()
        AjustContentLayout()
      }
    }
    .scrollable(ScrollDirection.Vertical)
    .edgeEffect(EdgeEffect.Spring)
    .scrollBarWidth(20)
    .scrollBar(BarState.On)
  }
}

@Component
struct VerticalLayout {
  build() {
    Column({ space: 20 }) {
      Row().width('90%').height(50).backgroundColor(0xF5DEB3)
      Row().width('90%').height(50).backgroundColor(0xd2B48C)
      Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.Gray)
  }
}

@Component
struct HorizontalLayout {
  build() {
    Row({ space: 35 }) {
      Text('space: 35').fontSize(15).fontColor(Color.Gray)
      Row().width('10%').height(150).backgroundColor(Color.Red)
      Row().width('10%').height(150).backgroundColor(Color.Green)
      Row().width('10%').height(150).backgroundColor(Color.Gray)
    }
    .width('100%')
    .height(200)
    .backgroundColor('rgb(242,242,242)')
    .alignItems(VerticalAlign.Bottom)
  }
}


@Component
struct VerticalJustifyLayout {
  build() {
    Column() {
      Row().width('80%').height(50).backgroundColor(Color.Orange)
      Row().width('80%').height(50).backgroundColor(Color.Red)
      Row().width('80%').height(50).backgroundColor(Color.Orange)
    }
    .height(250)
    .width('100%')
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.SpaceEvenly)
    // start center end
    // SpaceBetween SpaceAround SpaceEvenly

  }
}


/**
 * 自适应拉伸
 */
@Component
struct AjustContentLayout {
  build() {
    Row() {
      Column().layoutWeight(4).height('100%').backgroundColor(Color.Orange)
      Column().layoutWeight(1).height('100%').backgroundColor(Color.Red)
      Column().layoutWeight(8).height('100%').backgroundColor(Color.Orange)
    }
    .height(200)
    .backgroundColor(0xF5DEB3)
  }
}