@chcp 65001

@rem bdd
call allure generate --clean .\build\reports\allure -o .\build\allure && allure open .\build\allure
