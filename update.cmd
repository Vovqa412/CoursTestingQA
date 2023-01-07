@chcp 65001

@rem обновление конфигурации основной разработческой ИБ без поддержки или на поддержке. по умолчанию в каталоге build/ib
call vrunner update-dev --src src/cf --disable-support

@rem собрать расширения конфигурации внутри ИБ
@rem call vrunner compileext src/cfe/IRP_TestExtension IRP_TestExtension %*
