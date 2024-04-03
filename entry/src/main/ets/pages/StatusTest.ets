@Entry
@Component
struct StatusTest {
  @State stateNumber: number = 0
  build() {
    Button(`click times: ${this.stateNumber}`)
      .onClick(() => {
        this.stateNumber += 1
      })
  }
}