

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: ()=>void
  confirm: ()=>void
  build() {
    Column() {
      Text('CustomDialog')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
          .onClick(()=>{
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)

        Button('confirm')
          .onClick(()=>{
            this.controller.close()
            this.confirm()
          })
          .backgroundColor(0xffffff).fontColor(Color.Red)
      }
    }
    .padding({ top: 20, left: 20, bottom: 20, right: 20 })
  }
}

@Entry
@Component
struct CustomDialogTest {
  dialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept
    }),
    alignment: DialogAlignment.Bottom
  })

  build() {
    Flex({ justifyContent: FlexAlign.Center }) {
      Button('Click me')
        .onClick(()=>{
          this.dialogController.open()
        })
    }
  }

  onCancel() {
    console.info('callback when the first button is clicked')
  }
  onAccept() {
    console.info('callback when the second button is clicked')
  }

}