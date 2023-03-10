#language: ru

@tree

Функционал: Проверка работы с картинками товара

Как Тестировщик я хочу
Проверить работу с картинками в карточке товара
чтобы пользователи могли задействовать новый функционал

Контекст:

Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: Удаление файлов товара

* Открытие товара
	И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	Когда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Код'       | 'Наименование' | 'Поставщик'  | 'Цвет'    |
		| 'Bos0009' | '000000031' | 'Босоножки'    | 'Пантера АО' | 'Красный' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Босоножки (Товар)'

* Очистка текущей картинки
	Если поле с именем "ФайлКартинки" заполнено Тогда
		И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

* Удаление файлов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
	Когда открылось окно 'Босоножки (Товар)'
	И пока в таблице "Список" количество строк ">" 0 Тогда
		И я нажимаю на кнопку с именем 'ФормаУдалить'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Да'

Сценарий: Добавление файла товара

* Открытие товара
	И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	Когда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Код'       | 'Наименование' | 'Поставщик'  | 'Цвет'    |
		| 'Bos0009' | '000000031' | 'Босоножки'    | 'Пантера АО' | 'Красный' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Босоножки (Товар)'

* Добавление файла
	И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
	Когда открылось окно 'Босоножки (Товар)'
	И я нажимаю на кнопку с именем 'Создать'
	Тогда открылось окно 'Файл (создание)'
	И я выбираю файл "$КаталогПроекта$\fixtures\Босоножки.jpg"
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
	Тогда открылось окно '*'
	И я закрываю текущее окно
	Тогда открылось окно 'Босоножки (Товар)'

* Проверка добавления файла
	И таблица "Список" стала равной:
		| 'Наименование'  |
		| 'Босоножки.jpg' |
		
* Выбор картинки для товара
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
	И в таблице "Список" я перехожу к строке
		| 'Наименование'  |
		| 'Босоножки.jpg' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Босоножки (Товар) *'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
