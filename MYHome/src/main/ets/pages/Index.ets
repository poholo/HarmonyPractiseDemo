@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        MyComponet({ count: 10, increaseBy: 2 })
          .width(200)
          .height(100)
      }
      .width('100%')
    }
    .height('100%')
  }
}

class Model {
  public value: string

  constructor(value: string) {
    this.value = value
  }
}

@Component
struct MyComponet {
  @State title: Model = new Model("Hi")
  @State count: number = 0
  private increaseBy: number = 1
  build() {
    Column() {
      Text(`${this.title.value}`)
        .margin( {top:40})
       Button(`Click to change title`)
         .onClick(()=>{
           this.title.value = this.title.value == 'HI' ? 'Hello': 'HI'
         })
         .width(300)
         .height(30)
         .margin({ top: 40 })

      Button(`click to increase count = ${this.count}`)
        .onClick(()=>{
          this.count += this.increaseBy
        })
        .width(300)
        .height(30)
        .margin({ top: 40})

    }
  }
}