import router from '@ohos.router'


@Entry
@Component
struct Index {
  @State message: string = '----------'

  build() {
    Scroll() {
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

        Button() {
          Text('Link Test')
        }
        .margin({ top: 40 })
        .width('100%')
        .height(40)
        .onClick(() => {
          router.pushUrl({ url: 'pages/LinkTest' })
        })

        Button('ProvideConsume')
          .margin({ top: 40 })
          .height(44)
          .onClick(()=>{
            router.pushUrl({ url: 'pages/ProvideConsumeTest' })
          })

        Button('Observed/ObjectLink')
          .margin({ top: 40 })
          .height(44)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ObservedObjectLinkTest' })
          })

        Button('LocalStorageLink')
          .margin({ top: 40 })
          .height(44)
          .onClick(()=>{
            router.pushUrl({ url: 'pages/LocalStorageLinkTest'})
          })

        Button('LocalStorageProp')
          .margin({ top: 40 })
          .height(44)
          .onClick(() => {
            router.pushUrl({ url: 'pages/LocalStoragePropTest' })
          })

        Button('AppStorage')
          .margin({ top: 40 })
          .height(44)
          .onClick(()=>{
            router.pushUrl({ url: 'pages/AppStorageTest' })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}