from collections import namedtuple


class Person:
    def __init__(self, name, race, health, mana, armor):
        self.armor = armor
        self.mana = mana
        self.name = name
        self.race = race
        self.health = health

    def __str__(self):
        return f'name = {self.name}'

    def func(self):
        pass


hero = Person('Aaz', 'Izverg', 300, 0, 50)
print(hero.name)
print(hero)


def func():
    pass


PersonNew = namedtuple('PersonNew', 'name, race, health, mana, armor')
hero_new = PersonNew('Aaz', 'Izverg', 300, 0, 50)
hero_new_1 = PersonNew('Aaz', 'Izverg', 300, 0, func)
print(hero_new.name)
print(hero_new)
print(hero_new_1)
# hero_new.mana = 100
hero_new = hero_new._replace(mana=100)
print(hero_new)
