@Entry
@Component
struct VideoTest {
  controller = new VideoController()
  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Video({
        src:'http://aliuwmp3.changba.com/userdata/video/45F6BD5E445E4C029C33DC5901307461.mp4',
        currentProgressRate: 1.0,
        previewUri: '',
        controller: this.controller
      })
        .width('100%')
        .height(300)
        .onStart(()=>{

        })
        .onPause(()=>{

        })
    }
  }
}