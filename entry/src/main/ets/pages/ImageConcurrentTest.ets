
import taskpool from '@ohos.taskpool'

@Concurrent
function imageProcessing(dataSlice: ArrayBuffer): ArrayBuffer {
  return dataSlice
}

function histogramStatistic(pixelBuffer: ArrayBuffer) {
  let number = pixelBuffer.byteLength / 3
  let buffer1 = pixelBuffer.slice(0, number)
  let buffer2 = pixelBuffer.slice(number, 2 * number)
  let buffer3 = pixelBuffer.slice(2 * number)

  let task1 = new taskpool.Task(imageProcessing, buffer1)
  let task2 = new taskpool.Task(imageProcessing, buffer2)
  let task3 = new taskpool.Task(imageProcessing, buffer3)

  taskpool.execute(task1).then((ret: ArrayBuffer[])=>{
    console.info('task1: ' + ret.length)
  })

  taskpool.execute(task2).then((ret: ArrayBuffer[])=>{
    console.info('task2:' + ret.length)
  })

  taskpool.execute(task3).then((ret: ArrayBuffer[])=>{
    console.info('task3:' + ret.length)
  })
}



@Entry
@Component
struct ImageConcurrentTest {
  @State message: string = 'hello world'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            let data: ArrayBuffer = new ArrayBuffer()
            histogramStatistic(data)
          })
      }.width('100%')
    }.height('100%')
  }
}