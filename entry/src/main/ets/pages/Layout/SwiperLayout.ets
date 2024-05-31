
@Entry
@Component
struct SwiperLayout {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Swiper(this.swiperController) {
      Text("0")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text("1")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text("2")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .fontSize(30)
    }
    .height('40%')
    .loop(true)
    .autoPlay(true)
    .interval(1000)
    .indicatorStyle({
      size:30,
      left: 0,
      color: Color.Red,
      selectedColor: Color.Orange
    })
    .indicator(true)
    .vertical(false)
    .displayCount(2)
  }

}