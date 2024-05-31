
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct NormalUITest {
  build() {
    Scroll() {
      Column() {
        Row() {
          Column() {
            Radio({ value: 'radio1', group: 'radioGroup' })
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if (isChecked) {
                  promptAction.showToast({ message: 'Ringing mode.' })
                }
              })
            Text('Ringing')
          }

          Column() {
            Radio({ value: 'radio2', group: 'radioGroup' })
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if (isChecked) {
                  promptAction.showToast({ message: 'Vibration mode.' })
                }
              })
            Text('Vibration')
          }

          Column() {
            Radio({ value: 'radio3', group: 'radioGroup' })
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                if (isChecked) {
                  promptAction.showToast({ message: 'Silent mode.' })
                }
              })
            Text('Silent')
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          //Toggle 勾选样式/开关样式
          Toggle({ type: ToggleType.Checkbox, isOn: false })
            .width(25)
            .height(25)
          Toggle({ type: ToggleType.Checkbox, isOn: true })
            .width(25)
            .height(25)

          Toggle({ type: ToggleType.Switch, isOn: false })
            .width(50)
            .height(25)
            .selectedColor(Color.Pink)
            .switchPointColor(Color.Orange)
            .onChange((isOn: boolean) => {
              if (isOn) {
                promptAction.showToast({ message: "on" })
              }
            })
        }

        // 进度条
        Column() {
          Progress({ value: 24, total: 100, type: ProgressType.Linear })
          Progress({ value: 40, total: 150, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .style({
              strokeWidth: 15
            })

          Progress({ value: 20, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .backgroundColor(Color.Black)
            .style({ scaleCount: 20, scaleWidth: 5 })

          Progress({ value: 20, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .backgroundColor(Color.Black)
            .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 5 })

          Progress({ value: 40, total: 150, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .color(Color.Gray)

          Progress({ value: 40, total: 150, type: ProgressType.Capsule })
            .width(100).height(50)

          Progress({ value: 30, total: 150, type: ProgressType.Capsule })
            .width(50).height(100)


        }

        //Text Span
        Column() {
          Text('some Text')
          Text('text ') {
            Span('I am span')
              .decoration({ type: TextDecorationType.Underline, color: Color.Red })

          }

          Text('') {
            Span('I am Span 2')
              .fontSize(20)
              .decoration({ type: TextDecorationType.Overline, color: Color.Green })
          }
          .margin({ top: 15 })

          Text('') {
            Span('I am Span 3')
              .fontSize(20)
              .decoration({ type: TextDecorationType.LineThrough, color: Color.Pink })
          }

        }

      }
    }

  }
}