@chcp 65001

@rem формирование файла конфигурации. для включения раскомментируйте код ниже
call vrunner compile --src src/cf --out build/1cv8.cf %*

@rem собрать расширения конфигурации внутри ИБ
@rem call vrunner compileext src/cfe/IRP_TestExtension IRP_TestExtension %*
