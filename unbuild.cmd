@chcp 65001

@rem Разборка конфигурации в исходники
call vrunner decompile --out src/cf %*

@rem Разборка расширений конфигурации
call vrunner decompileext IRP_TestExtension src/cfe/IRP_TestExtension %*
