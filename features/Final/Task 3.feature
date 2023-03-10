#language: ru

@tree

Функционал: Проверка документа Продажа

Как Тестировщик я хочу
Проверить работу документа
чтобы пользователи не получили ошибок в работе

Контекст:

Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: Заполнение документа

* Открытие формы документа
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда открылось окно 'Продажи товара'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000108' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа * от *'

* Заполнение документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'    |
		| 'Магазин "Обувь"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа * от * *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'

* Заполнение таблицы Товары
	И пока в таблице "Товары" количество строк ">" 0 Тогда
		И я удаляю все строки таблицы "Товары"
	И в таблице "Товары" я добавляю строку
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Наименование' |
		| 'Bos0009' | 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа * от * *'
	И в таблице "Товары" я завершаю редактирование строки

* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровести'
	Тогда не появилось окно предупреждения системы

Сценарий: Проверка движений документа

* Открытие формы документа
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда открылось окно 'Продажи товара'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000108' |
	И в таблице "Список" я выбираю текущую строку
	Когда открылось окно 'Продажа * от *'

* Проверка движений
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной по шаблону:
		| 'Регистратор'            | 'Контрагент'      | 'Валюта' |
		| 'Продажа 000000108 от *' | 'Магазин "Обувь"' | 'Рубли'  |

	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной по шаблону:
		| 'Регистратор'            | 'Покупатель'      | 'Товар'     |
		| 'Продажа 000000108 от *' | 'Магазин "Обувь"' | 'Босоножки' |

	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной по шаблону:
		| 'Регистратор'            | 'Склад'   | 'Товар'     |
		| 'Продажа 000000108 от *' | 'Большой' | 'Босоножки' |
	
Сценарий: Проверка печати документа

* Позиционирование на документе
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда открылось окно 'Продажи товара'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000108' |

* Печать расходной накладной
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда табличный документ "SpreadsheetDocument" равен макету "fixtures\ПФ_ПечатьРасходнойНакладной.mxl" по шаблону
