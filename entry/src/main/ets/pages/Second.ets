import router from '@ohos.router'
@Entry
@Component
struct Second {
  @State message: string = 'HUI'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .margin({ top: 40})
        .width('80%')
        .height(40)
        .onClick(()=>{
          try{
            router.back()
          } catch (err) {
            console.error('err back ${err.code}')
          }
        })
        // .onClick(() => {
        //   try {
        //     router.back()
        //   } catch (err) {
        //     console.error('err back ${err.code})
        //   }
        // })
      }
      .width('100%')
    }
    .height('100%')
  }
}