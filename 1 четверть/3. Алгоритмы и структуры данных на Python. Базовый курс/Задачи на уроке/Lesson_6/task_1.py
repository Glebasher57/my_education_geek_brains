lst = [1]
lst.extend([2, 3, 4])
lst.insert(1, 5)
spam = lst.pop()
eggs = lst.pop()
lst.remove(5)

allocated = 0

for new_sise in range(1000):
    if allocated < new_sise:
        new_allocated = (new_sise >> 3) + (3 if new_sise < 9 else 6)
        allocated = new_sise + new_allocated
    print(f'{new_sise=}\t{allocated=}')


lst_new = [None] * 1120
my_index = 0
lst_new[my_index] = 'dgfsdg'
