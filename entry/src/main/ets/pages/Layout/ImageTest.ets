
@Entry
@Component
struct ImageTest {
  build() {
    Scroll() {
      Column() {
        //资源放到ets目录下方可
        Image('heart.png')
          .width(64)
          .height(64)

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(300)

        //Resource 可以跨包跨模块引入
        Image($r('app.media.catalog_download'))
          .width(64)

        // SVG
        Image($r('app.media.xuehua'))
          .width(100)
          .fillColor(Color.Pink)

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(200)
          .border({ width: 1 })
          .objectFit(ImageFit.Contain).margin(15)
          .overlay('Contain', { align: Alignment.Bottom, offset: { x: 0, y: 20 }})

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(150)
          .border({ width: 1 })
          .objectFit(ImageFit.Auto).margin(15)
          .overlay('Auto', { align: Alignment.Bottom, offset: {x: 0, y: 20 }})

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(150)
          .border({ width: 1, color: Color.Red })
          .objectFit(ImageFit.Cover).margin(15)
          .overlay('Cover', { align: Alignment.Bottom, offset: { x: 0, y: 20 }})

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(150)
          .border({ width: 1 })
          .objectFit(ImageFit.ScaleDown).margin(15)
          .overlay('ScaleDown', { align: Alignment.Bottom, offset: { x: 0, y: 20}})

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(150)
          .border({ width: 1 })
          .objectFit(ImageFit.Fill).margin(15)
          .overlay('Fill', {align: Alignment.Bottom, offset: { x: 0, y: 20 }})

        Image('http://gips3.baidu.com/it/u=1022347589,1106887837&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280')
          .width(200).height(150)
          .border({ width: 1 })
          .objectFit(ImageFit.None).margin(15)
          .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: 20 }})

      }
      .width('100%')
      .padding({ top: 10, bottom: 40 })
    }
  }
}

// 获取相册图片
import picker from '@ohos.file.picker'

// @Entry
@Component
struct ImagePickerTest {
  @State imgDatas: String[] = []
  getAllImg() {
    let result = new Array<string>()
    try {
      let photoSelectOptions = new picker.PhotoSelectOptions()
      photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE
      photoSelectOptions.maxSelectNumber = 5
      let photoPicker = new picker.PhotoViewPicker()
      photoPicker.select(photoSelectOptions).then((PhotoSelectResult) => {
        this.imgDatas = PhotoSelectResult.photoUris
        console.log('PhotoViewPicker.select successfully, photoSelectResult uri:' + JSON.stringify(PhotoSelectResult))
      })
    } catch(err) {
      console.log(`PhotoViewPicker.select failed with Code: ${err.code}, message: ${err.message}`)
    }
  }

  async aboutToAppear() {
    this.getAllImg()
  }
  build() {
    Column() {
      Grid() {
        ForEach(this.imgDatas, item => {
          GridItem() {
            Image(item)
              .width(200)
            // console.log(item)
          }
        }, item => JSON.stringify(item))
      }
    }
    .width('100%')
    .height('100%')
  }
}