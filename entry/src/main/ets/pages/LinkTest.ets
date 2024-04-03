@Entry
@Component
struct LinkTest {
  @State currentNumber: number = 0
  build() {
    Column() {
      Text(`Link a currentNumber = ${this.currentNumber}`)
      Button('Increate 5')
        .margin({ top: 40 })
        .onClick(()=>{
          this.currentNumber += 5
        })

      LinkChild({ value: this.currentNumber })
    }
  }
}

@Component
struct LinkChild {
  @Link value: number
  build() {
    Column() {
      Text(`LinkChild value = ${this.value}`)
      Button('Increase 1')
        .margin({ top: 10 })
        .height(44)
        .onClick(()=>{
          this.value += 1
        })
    }
  }
}