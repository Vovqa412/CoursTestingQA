﻿#language: ru

@tree

Функционал: Проверка заполнения заказа покупателя

Как тестировщик я хочу
проверить заполнение шапки заказа
чтобы пользователи не допускали ошибок

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Шапка заказа покупателя

* Открытие заказа
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	Когда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'

* Заполнение партнера
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '1'   | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'

* Проверка заполнения соглашения
	И поле с именем "Agreement" заполнено
	Когда открылось окно 'Заказ покупателя (создание) *'

* Очистка партнера и проверка недоступности контрагента
	И я нажимаю кнопку очистить у поля с именем "Partner"
	И элемент формы с именем "LegalName" не доступен
