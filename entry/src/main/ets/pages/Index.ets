import router from '@ohos.router'
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
          .fontColor(Color.Red)


        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height(40)
        .onClick( ()=> {
          console.info('success click')
          router.pushUrl({ url: 'pages/Second'}).then(()=> {
            console.info('succss push in')
          }).catch((err)=>{
            console.error('failed push ${err.code}')
          })
        })

        Button() {
          Text("状态装饰器")
        }
        .margin({ top: 20 })
        .width('40%')
        .height(40)
        .onClick(() => {
          router.pushUrl({ url: 'pages/StatusTest' })
        })

        Button() {
          Text("Prop test")
        }
        .margin( { top: 20 })
        .width('40%')
        .height(40)
        .onClick(()=>{
          router.pushUrl({ url: 'pages/PropTest' }).then(()=>{
            console.log('push prop success')
          }).catch((err)=>{
            console.log(`push prop error ${err.code}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}