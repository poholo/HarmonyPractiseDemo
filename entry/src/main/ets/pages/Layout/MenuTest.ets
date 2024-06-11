@Entry
@Component
struct MenuTest {
  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Button('Click for menu')
        .bindMenu([
          {
            value: 'Menu1',
            action: () => {
              console.info('handle Menu1 select')
            }
          }
        ])

      Button('MainMenu')
        .bindMenu(this.MainMenu)
    }
  }

  @State select: boolean = true
  private iconstr: ResourceStr = $r('app.media.app_icon')
  private iconstr2: ResourceStr = $r('app.media.app_icon')

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '复制', labelInfo: 'Ctrl+C'})
      MenuItem({ content: '粘贴', labelInfo: 'Ctrl+V'})
    }
  }

  @Builder
  MainMenu() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' }).enabled(false)
      MenuItem({
        startIcon: this.iconstr,
        content:'菜单选项--',
        endIcon: this.iconstr2,
        builder: this.SubMenu
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({ content: '菜单选项' })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected)=>{
            console.info('MenuItem select ' + selected)
            this.iconstr2 = $r('app.media.business_icon_feeds_fill')
          })
        MenuItem({
          startIcon: $r('app.media.business_icon_feeds_fill'),
          content: '菜单选项',
          endIcon: $r('app.media.catalog_download'),
          builder: this.SubMenu.bind(this)
        })

        MenuItem({
          startIcon: this.iconstr2,
          content: '菜单选项',
          endIcon: $r('app.media.editor_center_alignment')
        })

      }
    }
  }
}