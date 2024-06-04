@Entry
@Component
struct CustomPopupTest {
  @State customPopup: boolean = false

  @Builder popupBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.app_icon')).width(24).height(24).margin({ left: 5 })
      Text('This is Custom popup').fontSize(15).margin({ left: 10, right: 10 })
    }
    .width(200)
    .height(50)
    .padding(5)

  }
  build() {
    Column() {
      Button('CustomPopupOptions')
        .position({ x: 100, y: 200 })
        .onClick(()=>{
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          popupColor: Color.Pink,
          onStateChange: (e) => {
            console.info(JSON.stringify(e.isVisible))
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        })
    }
    .height('100%')
  }
}