#language: ru

@tree
@ExportScenarios

Функционал: Экспортные сценарии

Сценарий: заполняю шапку документа Заказ
	
* Организация
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'

* Контрагент
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'              |
		| '000000014' | 'Магазин "Бытовая техника"' |
	И в таблице "Список" я выбираю текущую строку

* Склад
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
