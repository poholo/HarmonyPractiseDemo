
import http from '@ohos.net.http'
import ResponseCode from '@ohos.net.http'
import image from '@ohos.multimedia.image'


@Entry
@Component
struct ImageReqTest {
  @State image: PixelMap = undefined
  build() {
    Column() {
      Button('Fetch Image')
        .onClick(()=>{
          this.fetchImage()
        })
      Image(this.image).width(300).height(300)
    }
  }

  fetchImage() {
    http.createHttp().request('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280', (error, data) => {
      if (error) {
        console.error(`http request failed with. code ${error.code}, message: ${error.message}`)
      } else {
        let code = data.responseCode
        if (ResponseCode.ResponseCode.OK === code) {
          let res: any = data.result
          let imageSource = image.createImageSource(res)
          let options = {
            alphaType: 0,
            editable: false,
            pixelFormat: 3,
            scaleMode: 1,
            size: {height: 300, width: 300}
          }
          imageSource.createPixelMap(options).then((pixelMap)=>{
            this.image = pixelMap
          })
        }
      }
    })
  }
}