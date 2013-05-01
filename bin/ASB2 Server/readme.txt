*** ENG ***

1. Install Steam, and Alien Swarm (http://store.steampowered.com/app/630) if not set.
2. Download our mod from here https://www.dropbox.com/sh/0cp29j9o47kdl7f/NWZKjzO_jO
3. Extract all files to Steam folder with replacement or such as here "d:\Steam\steamapps\common\alien swarm\"
4. In the file server.cfg change the server name and RCON password to the right.
5. The server is started via a shortcut start_server.cmd (port can be changed in this file)
or
on the command line with the parameters: srcds.exe -console -condebug -game swarm -port 27017 +map lobby -maxplayers 8 +exec server.cfg
6. In order for your server to use the statistics, it is necessary to have a static external IP address. And tell a friend Zak (through Steam chat) that same IP address and port.
7. Internet channel should not be hammered by various torrent rocking (or do the restrictions, if the link is slow). Minimum desired rate of 5 Mbit / s



*** RUS ***

1. Установить Steam и Alien Swarm (http://store.steampowered.com/app/630) если не установлен.
2. Скачать наш мод https://www.dropbox.com/sh/0cp29j9o47kdl7f/NWZKjzO_jO
3. Содержимое архива скопировать с заменой, поверх стимовских папок, например сюда "d:\Steam\steamapps\common\alien swarm\"
4. В файле server.cfg изменить  имя сервера и RCON пароль на нужное.
5. Сервер запускается через ярлык start_server.cmd (порт можно изменить в этом файле)
или
через командную строку с параметрами: srcds.exe -console -condebug -game swarm -port 27017 +map lobby -maxplayers 8 +exec server.cfg
6. Для того чтобы ваш сервер мог использовать статистику, то необходимо чтобы у вас был статический внешний IP адрес. А также сообщить товарищу Zak (через стим чат) этот самый IP адрес и порт.
7. Интернет канал не должен быть забит различными торрент качалками (либо делайте ограничения, если канал связи медленный).Минимальная желательная скорость 5 Мбит/сек

Дополнительные команды (пишутся в основном чате игры):
!help - отображает весь этот список
!timer - показывает таймер по-центру экрана.
!timer2 - показывает таймер вверху экрана.
!kills - показывает количество убитых мобов игроком (и общее количество убитых мобов)


*****************************************

ACHTUNG! Внимание!
придумайте пароль для RCON (это пароль от сервера) и НИКОМУ НЕ ДАВАЙТЕ ЕГО!, кроме товарища Zak ;-) Иначе злые хакеры воспользуются вашим сервером!

*****************************************

-condebug добавляет записи из консоли в файл console.log