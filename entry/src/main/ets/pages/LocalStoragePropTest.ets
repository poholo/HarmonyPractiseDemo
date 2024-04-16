
// let storage = new LocalStorage({ 'PropA': 100 })

let storageB = LocalStorage.GetShared()

@Component
struct PageA {
  @LocalStorageProp('PropA') s: number = 1
  build() {
    Column() {
      Button(`PageA propA = ${this.s}`)
        .onClick(() => { this.s += 1 })
    }
  }
}

@Entry(storageB)
@Component
struct PageB {
  @LocalStorageProp('PropA') a: number = 2
  build() {
    Column() {
      Button(`PageB PropA = ${this.a}`)
        .onClick( () => { this.a += 2 })

      PageA()
        .margin({ top: 20 })
    }
  }
}