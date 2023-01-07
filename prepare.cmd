@chcp 65001

@rem Загрузка базы из .dt файла
call vrunner restore src/dt/TestIRP.dt %*

@rem Сборка расширений и загрузка в БД
@rem call vrunner compileext src/cfe/IRP_TestExtension IRP_TestExtension --updatedb %*
