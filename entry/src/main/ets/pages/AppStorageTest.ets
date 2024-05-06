AppStorage.SetOrCreate('PropA', 45)
let storageA = new LocalStorage({ 'PropA': 48 })

@Entry(storageA)
@Component
struct AppStorageTest {
  @LocalStorageLink('PropA') sPropA: number = 50
  @StorageLink('PropA') aPropA: number = 60
  build() {
    Column() {
      Button(`LocalStorage propA = ${this.sPropA}`)
        .onClick(()=>{
          this.sPropA += 2
        })
      Button(`AppStorage propA = ${this.aPropA}`)
        .onClick(()=>{
          this.aPropA += 2
        })

    }
  }
}

// PersistentStorage.PersistProp('aProp', 47) 47
// AppStorage.Get('aProp') 47
// @StorageLink('aProp') aProp: number = 48