import sys
from core import get_list, create_file, create_dir, copy_file, del_object


try:
    command = sys.argv[1]
except IndexError:
    print('help - вывести список доступных команд')
    exit()

if command == 'list':
    get_list()
elif command == 'list_d':
    get_list(folders_only=True)
elif command == 'create_file':
    name = input('Введите имя файла: ')
    text = input('Текст в файле (не обязательно): ')
    create_file(name, text)
elif command == 'create_dir':
    name = input('Введите имя папки: ')
    create_dir(name)
elif command == 'copy':
    name = input('Введите название копируемого файла: ')
    new_name = input('Введите новое имя: ')
    copy_file(name, new_name)
elif command == 'delete':
    count = int(input('Сколько файлов стереть?\n'))
    names = []
    for i in range(count):
        name = input('Введите название удаляемого файла: ')
        names.append(name)
    del_object(names)
elif command == 'help':
    print('list - вывести список файлов в текущем каталоге')
    print('list_d - вывести список папок в текущем каталоге')
    print('create_file - создать новый файл в текущем каталоге')
    print('create_dir - создать новую папку в текущем каталоге')
    print('delete - удалить файл или папку в текущем каталоге')
    print('copy - копировать папку в текущий каталог')
else:
    print('help - вывести список доступных команд')