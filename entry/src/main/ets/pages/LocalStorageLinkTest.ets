
// let storage = new LocalStorage({ 'PropA': 47 })
let storage = LocalStorage.GetShared()
@Component
struct Child {
  @LocalStorageLink('PropA') storeLink2: number = 1
  build() {
    Button(`Child from loclstorage ${this.storeLink2}`)
      .onClick( () => { this.storeLink2 += 1 })
  }
}

@Entry(storage)
@Component
struct CompA {
  @LocalStorageLink('PropA') storeLink1: number = 10
  build() {
    Column({ space: 10 }) {
      Button(`Parent from LocalStorage ${this.storeLink1}`)
        .onClick(()=> {
          this.storeLink1 += 2
        })

      Child()
    }

  }
}