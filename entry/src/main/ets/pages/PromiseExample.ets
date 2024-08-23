@Entry
@Component
struct PromiseExample {
  promise = new Promise((resolve, reject) => {
    setTimeout(() => {
      const randomNumber = Math.random() * 100
      if(randomNumber > 0.5) {
        resolve('Current:' + randomNumber)
      } else {
        reject(new Error('Random number is too small' + randomNumber))
      }
    }, 1000)
  })

  @State currentMsg: string = 'click'


  build() {
    Column() {
      Text(this.currentMsg)
        .width('100%')
        .height(80)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .onClick(()=>{
          this.promise.then(result=>{
            this.currentMsg = String(result)
            console.info(String(result))
          }).catch(error=>{
            console.error(error.message)
          })
        })

      Button('3s output hi')
        .margin({ top: 40 })
        .onClick(()=>{
          myAsyncFunction()
        })

    }
  }
}

async function myAsyncFunction() {
  const result =  await new Promise((resolve)=>{
    setTimeout(()=>{
      resolve('Hello, world')
    }, 3000)
  })
  console.info(String(result))
}

