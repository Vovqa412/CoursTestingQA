﻿#language: ru

@tree

Функционал: Проверка работы отчета Остатки товаров

Как Тестировщик я хочу
Проверить работу отчета
чтобы пользователи могли получать аналитику

Контекст:

Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: Проверка работы отчета Остатки товаров

* Открытие отчета и выбор варианта
	И Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	Тогда открылось окно 'Остатки товаров*'
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление' |
		| 'Основной'      |
	И я нажимаю на кнопку с именем 'Загрузить'
	Тогда открылось окно 'Остатки товаров'

* Проверка формирования отчета без разворота по складу
	И я снимаю флаг 'Разворот по складу'
	И я снимаю флаг 'Склад'
	И я снимаю флаг 'Товар'
	Когда открылось окно 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R3C1' в течение 5 секунд

* Проверка формирования отчета с разворотом по складу
	И я устанавливаю флаг 'Разворот по складу'
	И я снимаю флаг 'Склад'
	И я снимаю флаг 'Товар'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R3C1' в течение 5 секунд
