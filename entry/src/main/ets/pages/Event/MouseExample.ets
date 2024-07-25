@Entry
@Component
struct MouseExample {
  @State isHovered: boolean = false

  build() {
    Column() {
      Button(this.isHovered ? 'Hovered' : 'Not Hover')
        .width(200).height(100)
        .backgroundColor(this.isHovered ? Color.Green : Color.Gray)
        .onHover((isHover: boolean) => {
          this.isHovered = isHover
          console.log('' + this.isHovered)
        })
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}