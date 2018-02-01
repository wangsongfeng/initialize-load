# initialize-load
区分initialize 与 load的 主要区别，怎样去使用它们


2.1日，
    今天来区分一下IOS中关于基础知识的一点小总结： +initialize  +load；
    在我们写IOS项目中会经常见到这两个类，首先从字面意思上区分，initialize 可能和init 有关，那么load就可能会和加载有关；
    我们先不去纠结到底什么意思，我们来创建一个demo去辨别下，实践即真理。
    
    首先创建两个类，一个是Person类，一个是animals类，那么，分别去写出来这两个的用法
    #import "Person.h"
    @implementation Person
    +(void)load{
        NSLog(@"%s",__func__);
    }
    
    +(void)initialize{
        NSLog(@"%s %@",__func__ ,[self class]);
    }
    
    -(instancetype)init{
    if (self=[super init]) {
        NSLog(@"%s",__func__);
    }
    return self;
    }
    
    @end
    ----------------------------------------
    #import "animals.h"
    @implementation animals
    +(void)load{
    NSLog(@"%s",__func__);
    }
    
    +(void)initialize{
    NSLog(@"%s %@",__func__ ,[self class]);
    }
    
    -(instancetype)init{
    if (self=[super init]) {
    NSLog(@"%s",__func__);
    }
    return self;
    }
    @end
    
    
    这两个类只是创建完，写了这几个方法，没有去加载，没有做初始化处理，那么这时候我们 运行项目，发现输出：
    
    2018-02-01 17:35:56.168544+0800 initializer-load[3331:138841] +[animals load]
    2018-02-01 17:35:56.169981+0800 initializer-load[3331:138841] +[Person load]

很显而易见，项目没有加载类方法 但是load 方法 触发了， 可能还是 不深入，这时候我们去 初始化类试下：


    #import "ViewController.h"
    #import "Person.h"
    #import "animals.h"
    @interface ViewController ()
    @end
    
    @implementation ViewController

    - (void)viewDidLoad {
    [super viewDidLoad];

        [[Person alloc]init];
        [[animals alloc]init];
    }
    @end
    
    看输出
    
    2018-02-01 17:47:55.027024+0800 initializer-load[3425:145385] +[animals load]
    2018-02-01 17:47:55.038127+0800 initializer-load[3425:145385] +[Person load]
    2018-02-01 17:47:55.819575+0800 initializer-load[3425:145385] +[Person initialize] Person
    2018-02-01 17:47:55.819821+0800 initializer-load[3425:145385] -[Person init]
    2018-02-01 17:47:55.819983+0800 initializer-load[3425:145385] +[animals initialize] animals
    2018-02-01 17:47:55.820116+0800 initializer-load[3425:145385] -[animals init]

这时候我们发现 initializer 和load 方法 全都在 init 方法之前，再结合之前的 总结：

    load 方法会在加载类的时候就被调用，也就是 ios 应用启动的时候，就会加载所有的类，就会调用每个类的 + load 方法。
     + initialize 方法：这个方法会在 第一次初始化这个类之前 被调用，我们用它来初始化静态变量。




