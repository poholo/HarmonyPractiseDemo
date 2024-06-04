@Entry
@Component
struct PopupExample {
  @State handlePopup: boolean = false
  build() {
    Column() {
      Button('PopupOptions')
        .onClick(()=>{
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'This is a popup with PopupOptions',
          primaryButton: {
            value: 'Confirm',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('Confirm button click')
            }
          },
          secondaryButton: {
            value: 'Cancel',
            action: () => {
              this.handlePopup = !this.handlePopup
            }
          },
          onStateChange: (e)=> {
            if(!e.isVisible) {
              this.handlePopup = false
            }
          }
        })
    }
    .width('100%')
    .padding({ top: 5 })
  }
}