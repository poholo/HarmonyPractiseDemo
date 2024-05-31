import util from '@ohos.util'

// @Entry
@Component
struct ListLayout {
  private listScroller: Scroller = new Scroller()

  private contracts = [
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张'),
    new Contact('小明'),
    new Contact('小张')
  ]
  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      List({ space: 10, scroller: this.listScroller }) {
        ListItemGroup({
          header: this.itemHead('a')
        }) {
          ForEach(this.contracts, (item: Contact) => {
            ListItem() {
              Row() {
                Row()
                  .backgroundColor(Color.Orange)
                  .width(40)
                  .height(40)
                  .margin(10)
                  .borderRadius(20)
                Text(item.name).fontSize(20)
              }
              .width('50%')
              .justifyContent(FlexAlign.Start)
            }
          })
        }
      }
      .listDirection(Axis.Vertical)
      // .lanes(2)
      .lanes({ minLength: 200, maxLength: 300 })
      .alignListItem(ListItemAlign.Center)
      .divider({
        strokeWidth: 1,
        startMargin: 60,
        endMargin: 10,
        color: '#ffe9f0f0'
      })
      .scrollBar(BarState.Auto)
      .sticky(StickyStyle.Header)
      .width('100%')


      Button() {
        Text('Click me to top')
          .fontSize(10)
          .backgroundColor(Color.Red)
      }
      .backgroundColor(Color.Orange)
      .width('100%')
      .height(50)
      .onClick(() => {
        this.listScroller.scrollToIndex(0)
      })
    }
  }


  @Builder itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }
}

class Contact {
  key: string = util.generateRandomUUID(true)
  name: string

  constructor(name: string) {
    this.name = name
  }
}


// 编辑列表
@Component
@Entry
struct EditList {
  @State todoData: Todo[] = []
  private avaliableThings: string[] = ['读书', '运动', '旅游', '听音乐', '看电影', '唱歌']
  @State currentInfo: string = 'Todo 列表'
  // @State isEditMoe: bool = false
  @State selectItems: Todo[] = []
  build() {
    Column() {
      Image($r('app.media.app_icon'))
      .width(50)
      .height(50)
      Row({  }) {
        Text(this.currentInfo)
          .fontSize(18)
          .fontColor(Color.Blue)
        Text('+')
          .width(50)
          .height(50)
          .fontSize(20)
          .fontColor(Color.Blue)
          .onClick(()=>{
            TextPickerDialog.show({
              range: this.avaliableThings,
              onAccept: (value: TextPickerResult) => {
                this.todoData.push(new Todo(this.avaliableThings[value.index]))
                console.log(this.todoData.flatMap(item => [item.key, item.name]).join(','))
              }
            })
          })
      }
      .width('90%')
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)

      List({ space: 20 }) {
        ForEach(this.todoData, (todoItem) => {
          ListItem() {
            Row({ space: 20 }) {
              Text('')
                .width(20)
                .height(20)
                .borderRadius(10)
                .border({ width: 1, color: Color.Orange })


              Text(todoItem.name)
                .height(40)
                .fontSize(18)
                .fontColor(Color.Orange)

              Image($r('app.media.app_icon'))
                .width(50)
                .height(50)

            }
            .width('100%')
            .justifyContent(FlexAlign.Start)

          }
        }, todoItem => todoItem.name)
      }
    }
    .width('100%')
  }
}

class Todo {
  key: string = util.generateRandomUUID(true)
  name: string
  constructor(name: string) {
    this.name = name
  }
}

