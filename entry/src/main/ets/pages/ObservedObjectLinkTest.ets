// 其他撞他装饰器的描述仅观察到第一层变化，世纪开发会观察多层嵌套，对于多层嵌套就要使用Observed、ObjectLink
// 二维数组 class 双向数据同步

// 限制条件： @Obsered会改变class原型链 与其他类装饰器修饰同一个class会带来问题
// @ObjectLink不能再Entry装饰的自定义组件中使用

@Entry
@Component
struct ObservedTest {
  @State student: Student = new Student(new Person(10, 'www'), 'XA');
  build() {
    Column() {
      ViewA({ student: this.student })
      // ObservedA({ student: new Student(p: new Person(age: 10, nm: 'www'), school: 'XA')})
      Button('change school')
        .onClick(()=>{
          this.student.school += '+'
        })
      Button('change nm')
        .onClick(()=>{
          this.student.p.nm += '~'
          console.log(this.student.p.nm)
        })
    }
  }
}


@Component
struct  ViewA {
  @ObjectLink student: Student
  build() {
    Column() {
      Text(`student school = ${this.student.school}`)
      Text(`student nm = ${this.student.p.nm}`)
        .margin({top:20})

    }
  }
}

@Observed
class Person {
  age: number
  nm: string

  constructor(age: number, nm: string) {
    this.age = age
    this.nm = nm
  }
}

@Observed
class Student {
  p: Person
  school: string
  constructor(p: Person, school: string) {
    this.p = p
    this.school = school
  }
}