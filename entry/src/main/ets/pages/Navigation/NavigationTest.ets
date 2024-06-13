@Entry
@Component
struct NavigationTest {
  private arr = [1, 2, 3]
  build() {
    Column({ space: 10 }) {
      Navigation() {

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text('NavRouter' + item)
                  .width('100%')
                  .height(72)
                  .backgroundColor(Color.White)
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text('NavDestinationContent' + item)
                }
                .title('NavDestinationTitle' + item)
                .backgroundColor('#f3f5f8')
              }
            }
          }, item => item)
        }
      }
      .title('Title')
      .backgroundColor('#f1f3f5')
      .mode(NavigationMode.Auto)
      .menus([
        { value: 'Menu1', icon: '/AppScope/resources/base/media/app_icon.png', action: () => {
        } },
        { value: 'Menu2', icon: '', action: () => {
        } },
        { value: 'Menu3', icon: '', action: () => {
        } },
        { value: 'Menu4', icon: '', action: () => {
        } },
        { value: 'Menu5', icon: '', action: () => {
        } },
      ])
      .toolBar({ items: [
        { value: 'Tab', icon: '$r:app.media.app_icon', action: () => {
        } },
        { value: 'Tab1', icon: '', action: () => {
        } },
        { value: 'Tab2', icon: '', action: () => {
        } }
      ] })
    }
  }
}