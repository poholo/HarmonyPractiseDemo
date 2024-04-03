@Entry
@Component
struct ProvideConsumeTest {
  @Provide value: number = 22
  build() {
    Column() {
      Column() {
        Text(`parent current value = ${this.value}`)
        Button(`parent current value = ${this.value}`)
          .margin({ top: 40 })
          .onClick(() => {
            this.value += 5
          })
      }
      .backgroundColor(Color.Red)
      ComponentB()
    }
  }
}

@Component
struct ComponentB {
  build() {
    ComponentC()
  }
}

@Component
struct  ComponentC {
  build() {
    Row( { space: 5 }) {
      ComponentD()
      ComponentD()
    }
  }
}

@Component
struct ComponentD {
  @Consume value: number
  build() {
    Column() {
      Text(`D value = ${this.value}`)
      Button('D increase 2')
        .margin({ top: 40 })
        .onClick(()=>{
          this.value += 2
        })
    }
  }
}


