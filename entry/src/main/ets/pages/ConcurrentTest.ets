import taskpool from '@ohos.taskpool'

@Entry
@Component
struct ConcurrentTest {
  @State message: string = 'Hello world'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            ConcurrentFunc()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Concurrent
function add(num1: number, num2: number): number {
  return num1 + num2
}

async function ConcurrentFunc(): Promise<void> {
  try {
    let task: taskpool.Task = new taskpool.Task(add, 1, 2)
    // return await taskpool.execute(task)
    console.info('taskpool res is:' + await taskpool.execute(task))
  } catch (e) {
    console.error('taskpool execute error is:' + e)
  }
}
