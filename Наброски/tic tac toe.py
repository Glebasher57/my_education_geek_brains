N = 3
board = [[' ' for _ in range(N)] for _ in range(N)]


def get_board():
    count = 1
    for line in board:
        for i in range(len(line)):
            print(f'{line[i]:>2}', end='')
            if i < 2:
                print(' |', end='')
        print()
        if count < 3:
            print('___|___|___')
            count += 1


def get_sum(arr1, arr2, n):
    sum_ = 0
    while n != 0:
        sum_ = sum_ + len(arr1[n-1]) + len(arr2[n-1])
        n -= 1
    return sum_


def get_winner(idx, mark):
    if board[1][1] == mark and (board[0][0] == mark or board[0][2] == mark) and (board[2][0] == mark or board[2][2] == mark):
        return True
    i = 0
    while i < 3:
        if len(idx[i]) == len(board[i]):
            return True
        count = 0
        for item in board[count][i]:
            if item == 'X':
                count += 1
            elif count == 3:
                return True
        i += 1
    else:
        return False


get_board()

idx1 = [[], [], []]
idx2 = [[], [], []]

player = 1
while get_sum(idx1, idx2, N) != 9:
    if player == 1:
        print()
        print(f'Игрок №{player}, ваш ход')
        print('Куда ставим крестик?')
        line = int(input('Линия: '))
        element = int(input('Место: '))
        if element - 1 in idx2[line - 1]:
            print('В этом месте уже стоит нолик!')
            continue
        board[line-1][element-1] = 'X'
        idx1[line - 1].append(element - 1)
        get_board()
        if get_winner(idx1, 'X'):
            print(f'Игрок №{player} выиграл!')
            break
        player += 1
    else:
        print()
        print(f'Игрок №{player}, ваш ход!')
        print('Куда ставим нолик?')
        line = int(input('Линия: '))
        element = int(input('Место: '))
        if element - 1 in idx1[line - 1]:
            print('В этом месте уже стоит крестик!')
            continue
        board[line-1][element-1] = 'O'
        idx2[line - 1].append(element - 1)
        get_board()
        if get_winner(idx2, 'O'):
            print(f'Игрок №{player} выиграл!')
            break
        player -= 1
else:
    print('Победила дружба! :)')