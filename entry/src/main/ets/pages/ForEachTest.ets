
import hilog from '@ohos.hilog'

@Entry
@Component

struct ForEachTest {
  @State simpleArr: Array<string> = ["aaaaa", "bbbbb", "ccccccc"]
  build() {
    Column() {
      ForEach(this.simpleArr, (item: string) => {
        Text(item)
      }, (item: string) => item)

      Button("change bbbb to dddddd")
        .onClick(() => {
          this.simpleArr[1] = 'testChange'
          console.log(this.simpleArr[1])
          hilog.info(0x0000, '%{public}s', this.simpleArr[1])
        })

      Text(`${ this.simpleArr[1] }`)
    }
  }
}

/**
 * 骨架屏
 */
// @Entry
@Component
struct ForEachTest2 {
  @State simpleData: Array<number> = [1, 2, 3, 4, 5]
  build() {
    Column() {
      ForEach(this.simpleData, (item: string)=> {
        ArticleSkeletonView()
          .margin({ top: 20 })
      }, (item: string) => item)
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}


@Builder
function textArea(width: number | Resource | string = '100%', height: number | Resource | string = '100%') {
  Row()
    .width(width)
    .height(height)
    .backgroundColor('#FFF2f3F4')
}

@Component
struct ArticleSkeletonView {
  build() {
    Row() {
      Column() {
        textArea(80, 80)
      }
      .margin({ right: 20 })

      Column() {
        textArea('60%', 20)
        textArea('50%', 20)
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}







