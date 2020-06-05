import os
import shutil
import datetime


def create_file(name: str, text=None):
    with open(name, 'w', encoding='utf-8') as f:
        if text:
            f.write(text)
        save_info(f'Создан файл {name}.')


def create_dir(name: str):
    try:
        os.mkdir(name)
        save_info(f'Создана новая папка {name}.')
    except FileExistsError:
        print('Объект с таким именем уже существует')


def get_list(folders_only=False):
    if folders_only:
        for file in os.listdir():
            if os.path.isdir(file):
                print(f'd {file}')
    else:
        for file in os.listdir():
            if os.path.isdir(file):
                print(f'd {file}')
            else:
                print(f'f {file}')
    save_info(f'Запрошен список файлов.')


def del_object(name):
    for file in name:
        if os.path.isdir(file):
            try:
                os.rmdir(file)
                save_info(f'{file} объект удален.')
            except OSError:
                print('Папка не пуста!')
        else:
            try:
                os.remove(file)
                save_info(f'{file} объект удален.')
            except FileNotFoundError:
                print('Не удается найти указанный файл')
            except NotADirectoryError:
                print('Файл не является директорией.')


def copy_file(name: str, new_name: str):
    if os.path.isdir(name):
        try:
            shutil.copytree(name, new_name)
            save_info(f'Копия папки {new_name} от {name}.')
        except FileExistsError:
            print('Папка с таким именем уже существует!')
    else:
        shutil.copy(name, new_name)
        save_info(f'Копия файла {new_name} от {name}.')


def save_info(message):
    current_time = datetime.datetime.now()
    with open('log.txt', 'a', encoding='utf-8') as f:
        f.write(f'{current_time} - {message}\n')